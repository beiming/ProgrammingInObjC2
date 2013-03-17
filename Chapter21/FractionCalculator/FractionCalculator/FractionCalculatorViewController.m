//
//  FractionCalculatorViewController.m
//  FractionCalculator
//
//  Created by peixin liu on 3/13/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import "FractionCalculatorViewController.h"
@interface FractionCalculatorViewController ()
{
    @private
    NSMutableString *displayString, *currentNumberString;
    NSString *operate;
    int currentNumber;
    BOOL firstOperand, isNumerator, isNewNumber, needClear;
    FractionCalculatorBrain *brain;
    NSDictionary *operateToDisplay;
}
- (void)setDisplayText:(NSString *)str;
- (void)resultClean;
@end

@implementation FractionCalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    firstOperand = YES;
    isNumerator = YES;
    isNewNumber = YES;
    needClear = NO;
    currentNumber = DEFAULT_NUMBER;
    displayString = [NSMutableString stringWithString:DEFAULT_DISPLAY];
    currentNumberString = [NSMutableString stringWithString:DEFAULT_DISPLAY];
    operate = OPERATE_NONE;
    brain =[[FractionCalculatorBrain alloc] init];
    operateToDisplay = @{PLUS_STRING:PLUS_DISPLAY_STRING,
                         SUBTRACT_STRING:SUBTRACT_DISPLAY_STRING,
                         MULTIPLY_STRING:MULTIPLY_DISPLAY_STRING,
                         DIVISION_STRING:DIVISION_DISPLAY_STRING,
                         EQUAL_STRING:EQUAL_DISPLAY_STRING};
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDisplayText:(NSString *)str
{
    [displayString appendString:str];
    self.display.text = displayString;
}

- (IBAction)clickDigit:(UIButton *)sender {
    if(needClear)
    {
        [self clickClear:nil];
    }
    if(isNewNumber)
    {
        if([sender.currentTitle isEqualToString:DEFAULT_DISPLAY] == YES)
        {
            return;
        }
        [currentNumberString setString:sender.currentTitle];
        if([displayString isEqualToString:DEFAULT_DISPLAY] == YES)
        {
            [displayString setString:sender.currentTitle];
        }
        else
        {
            [displayString appendString:sender.currentTitle];
        }
        self.display.text = displayString;
    }
    else
    {
        [currentNumberString appendString:sender.currentTitle];
        [self setDisplayText:sender.currentTitle];
    }
    isNewNumber = NO;
}

- (IBAction)clickOperate:(UIButton *)sender {
    currentNumber = [currentNumberString intValue];
    if(isNumerator)
    {
        brain.operand1.numerator = currentNumber;
    }
    else
    {
        brain.operand1.donominator = currentNumber;
    }
    operate = sender.currentTitle;
    [self setDisplayText:operateToDisplay[operate]];
    //点击一个运算符之后，输入的会是第二个操作数，会是新的一个数字，新的分子
    firstOperand = NO;
    isNewNumber = YES;
    isNumerator = YES;
}
- (IBAction)clickOver:(id)sender {
    currentNumber = [currentNumberString intValue];
    if(firstOperand)
    {
        brain.operand1.numerator = currentNumber;
    }
    else
    {
        brain.operand2.numerator = currentNumber;
    }
    [self setDisplayText:DIVISION_STRING];
    //点击over之后，会是个新的数字，不是分子
    isNewNumber = YES;
    isNumerator = NO;
}
- (IBAction)clickClear:(id)sender {
    [self resultClean];
    [displayString setString:DEFAULT_DISPLAY];
    self.display.text = DEFAULT_DISPLAY;
    needClear = NO;
}
- (void)resultClean
{
    //清理当前数字
    currentNumber = DEFAULT_NUMBER;
    [currentNumberString setString:DEFAULT_DISPLAY];
    //清理上次操作
    operate = OPERATE_NONE;
    //下次是个新的数字
    isNewNumber = YES;
    //是分子
    isNumerator = YES;
    //是第一个操作数
    firstOperand = YES;
    [brain clear];
}
- (IBAction)clickEquals:(UIButton *)sender {
    if([operate isEqualToString:OPERATE_NONE] == YES)
    {
        return;
    }
    currentNumber = [currentNumberString intValue];
    if(isNumerator)
    {
        brain.operand2.numerator = currentNumber;
    }
    else
    {
        brain.operand2.donominator = currentNumber;
    }
    [displayString appendString:operateToDisplay[sender.currentTitle]];
    [self setDisplayText:[[brain performOperation:operate] convertToString]];
    needClear = YES;
    [self resultClean];
}

- (IBAction)clickConvert:(id)sender {
}
@end

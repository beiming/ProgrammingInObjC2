//
//  FractionCalculatorBrain.m
//  FractionCalculator
//
//  Created by peixin liu on 3/13/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import "FractionCalculatorBrain.h"
@implementation FractionCalculatorBrain
- (id)init
{
    self = [super init];
    if(self)
    {
        _operand1 = [[Fraction alloc] initWithNumberto:DEFAULT_NUMBER over:DEFAULT_DONOMINATOR];
        _operand2 = [[Fraction alloc] initWithNumberto:DEFAULT_NUMBER over:DEFAULT_DONOMINATOR];
        _accumulator = [[Fraction alloc] initWithNumberto:DEFAULT_NUMBER over:DEFAULT_DONOMINATOR];
    }
    return self;

}
- (void)clear
{
    if(self.accumulator)
    {
        self.accumulator.numerator = DEFAULT_NUMBER;
        self.accumulator.donominator = DEFAULT_DONOMINATOR;
    }
    if(self.operand1)
    {
        self.operand1.numerator = DEFAULT_NUMBER;
        self.operand1.donominator = DEFAULT_DONOMINATOR;
    }
    if(self.operand2)
    {
        self.operand2.numerator = DEFAULT_NUMBER;
        self.operand2.donominator = DEFAULT_DONOMINATOR;
    }

}
- (Fraction *)performOperation:(NSString *)operate
{
    Fraction *result;
    if([operate isEqualToString:PLUS_STRING])
    {
        result = [self.operand1 add:self.operand2];
    }
    else if([operate isEqualToString:SUBTRACT_STRING])
    {
        result = [self.operand1 subtract:self.operand2];
        
    }
    else if([operate isEqualToString:MULTIPLY_STRING])
    {
        result = [self.operand1 multiply:self.operand2];
        
    }
    else if([operate isEqualToString:DIVISION_STRING])
    {
        result = [self.operand1 divide:self.operand2];
    }
    return result;
}
@end

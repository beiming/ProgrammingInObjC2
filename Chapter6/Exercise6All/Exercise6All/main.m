//
//  main.m
//  Exercise6All
//
//  Created by 佩鑫 刘 on 7/15/12.
//  Copyright (c) 2012 edu.self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSString.h>
#import "Calculator.h"
#import "Fraction.h"

void exercise1();
void exercise2();
void exercise3();
void exercise4();
void exercise5();
void exercise6();
void exercise7();
int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        //exercise1();
        //exercise2();
        //exercise3();
        //exercise4();
        //exercise5();
        exercise6();
        //exercise7();
    }
    return 0;
}


void exercise1()
{
    char nextStep = 'y';
    while(nextStep == 'y')
    {
        int divident, divisor;
        //必须一次性输入2,4y，才能进行下一次。为什么y不能在下次输入？
        NSLog(@"Please input two integer separated with comma like 2,4:");
        scanf("%i,%i", &divident, &divisor);
        if(divident % divisor == 0)
        {
            NSLog(@"%i can be divided by %i", divident, divisor);
        }
        else 
        {
            NSLog(@"%i can not be divided by %i", divident, divisor);
        }
        NSLog(@"continue? y or n");
        scanf("%c", &nextStep);
    }

}

void exercise2()
{
    double value1,value2;
    char operator;
    Calculator *deskCalc = [[Calculator alloc] init];
    Boolean statementVaild = YES;
    NSLog(@"Type in youor expression.");
    scanf("%lf %c %lf", &value1, &operator, &value2);
    
    [deskCalc setAccumulator:value1];
    if (operator == '+')
    {
        [deskCalc add:value2];
    }
    else if(operator == '-')
    {
        [deskCalc subtract:value2];
    }
    else if(operator == '*')
    {
        [deskCalc multiply:value2];
    }
    else if(operator == '/')
    {
        if(value2 == 0)
        {
            NSLog(@"Divison by zero.");
            statementVaild = NO;
        }
        else
        {
            [deskCalc divide:value2];
        }
    }
    else
    {
        NSLog(@"Unkonw operator.");
        statementVaild = NO;
    }
    if(statementVaild == YES)
    {
        NSLog(@"%.2f", [deskCalc accumulator]);
    }
    [deskCalc release];
}

void exercise3()
{
    int numerator,donominator;
    Fraction *fraction = [[Fraction alloc] init];
    NSLog(@"Type tow numbers, like 1,2:");
    scanf("%i,%i", &numerator, &donominator);
    fraction.numerator = numerator;
    fraction.donominator = donominator;
    [fraction print:NO];
    [fraction release];
}

void exercise4()
{
    float number;
    char operator;
    Calculator * calculator = [[Calculator alloc] init];
    NSLog(@"Begin Calculation");
    do 
    {
        scanf("%f %c", &number, &operator);
        
        if(operator > 'Z' && operator <= 'z')
        {
            operator -= 'a' - 'A';
        }
        switch (operator)
        {
            case 'S':
                [calculator setAccumulator:number];
                break;
            case '+':
                [calculator add:number];
                break;
            case '-':
                [calculator subtract:number];
                break;
            case '*':
                [calculator multiply:number];
                break;
            case '/':
                if (number == 0)
                {
                    NSLog(@"Divison by Zero!");
                }
                else 
                {
                    [calculator divide:number];
                }
                break;
            case 'E':
                [calculator clear];
                break;
        }
        NSLog(@"=%.2f", [calculator accumulator]);
    } 
    while (operator != 'E');
    [calculator release];
}

void exercise5()
{
    int number, tempNmber;
    NSLog(@"Type in your number:");
    scanf("%i", &number);
    tempNmber = number;
    if(number < 0)
    {
        tempNmber = -tempNmber;
    }
    while (tempNmber != 0) {
        printf("%i", tempNmber % 10);
        tempNmber /= 10;
    }
    if(number < 10)
    {
        printf("-");
    }
}
void exercise6Tools(int number);
inline NSString *exercise6NumToCharacter(int i);
void exercise6()
{
    int number;
    NSLog(@"Type in your number:");
    scanf("%i", &number);
    //exercise6Tools(number);
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSNumber *integer;
    if(number == 0)
    {
        NSLog(@"%@", exercise6NumToCharacter(number));
    }
    else
    {
        while(number != 0)
        {
            NSNumber *integer = [[[NSNumber alloc] initWithInt:number % 10 ] autorelease];
            [arr addObject:integer];
            number /= 10;
        }
        for(int i = [arr count] - 1; i > -1; i--)
        {
            integer = [arr objectAtIndex:i];
            NSLog(@"%@", exercise6NumToCharacter([integer intValue]));
        }
    }
    integer = nil;
    [arr release];
}

void exercise6Tools(int number)
{
    int nowNum = number / 10;
    if(nowNum == 0)
    {
        NSLog(@"%@", exercise6NumToCharacter(number % 10));
        return;
    }
    else
    {
        exercise6Tools(nowNum);
    }
    NSLog(@"%@", exercise6NumToCharacter(number % 10));
}

NSString *exercise6NumToCharacter(int i)
{
    NSString *str = [NSString stringWithString:@""];
    switch(i)
    {
        case 0:
            str = @"zero";
            break;
        case 1:
            str = @"noe";
            break;
        case 2:
            str = @"tow";
            break;
        case 3:
            str = @"three";
            break;
        case 4:
            str = @"four";
            break;
        case 5:
            str = @"five";
            break;
        case 6:
            str = @"six";
            break;
        case 7:
            str = @"seven";
            break;
        case 8:
            str = @"eight";
            break;
        case 9:
            str = @"nine";
            break;
    }
    return str;
}

void exercise7()
{
    int p, d, isPrime;
    for(p = 2; p <= 50; ++p)
    {
        isPrime = 1;
        if(p % 2 == 0)
        {
            NSLog(@"%i is event. isPrime = 0", p);
            isPrime = 0;
        }
        for(d = 2; isPrime == 1 && d < p; ++d)
        {
            NSLog(@"in for when p is %i, d is %i", p, d);
            if(p % d == 0)
            {
                isPrime = 0;
            }
        }
        if(isPrime != 0)
        {
            NSLog(@"%i", p);
        }
    }
}











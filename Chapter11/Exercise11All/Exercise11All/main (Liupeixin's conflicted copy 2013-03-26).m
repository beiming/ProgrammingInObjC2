//
//  main.m
//  Exercise11All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "Fraction+MathOps.h"
#import "Fraction+Comparison.h"
#import "SquareComposite.h"
#import "Rectangle.h"
#import "Calculator.h"
#import "Calculator+Trig.h"

void exercise1();
void exercise2();
void exercise3();
void exercise4();
void exercise5();

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        //exercise1();
        //exercise2();
        //exercise3();
        exercise4();
        //exercise5();
    }
    return 0;
}

void exercise1()
{
    Fraction *f1 = [[Fraction alloc] initWithNumberto:4 over:5];
    Fraction *f2 = [[Fraction alloc] initWithNumberto:1 over:2];
    Fraction *result;
    result = [f1 add2:f2];
    [result print];
    result = [f1 sub:f2];
    [result print];
    result = [f1 mul:f2];
    [result print];
    result = [f1 div:f2];
    [result print];
    result = [f1 invert:f1];
    [result print];
    
    [f1 release];
    [f2 release];
    result = nil;
}
void exercise2()
{
    Fraction *f1 = [[Fraction alloc] initWithNumberto:4 over:8];
    Fraction *f2 = [[Fraction alloc] initWithNumberto:1 over:2];
    
    Fraction *f3 = [[Fraction alloc] initWithNumberto:4 over:5];
    Fraction *f4 = [[Fraction alloc] initWithNumberto:1 over:2];
    
    Fraction *f5 = [[Fraction alloc] initWithNumberto:4 over:5];
    Fraction *f6 = [[Fraction alloc] initWithNumberto:1 over:2];
    
    Fraction *f7 = [[Fraction alloc] initWithNumberto:1 over:5];
    Fraction *f8 = [[Fraction alloc] initWithNumberto:1 over:2];
    
    Fraction *f9 = [[Fraction alloc] initWithNumberto:5 over:10];
    Fraction *f10 = [[Fraction alloc] initWithNumberto:1 over:2];
    
    NSLog(@"%i", [f1 isEqualTo:f2]);
    NSLog(@"%i", [f3 isEqualTo:f4]);
    
    NSLog(@"%i", [f5 compare:f6]);
    NSLog(@"%i", [f7 compare:f8]);
    NSLog(@"%i", [f9 compare:f10]);

    [f1 release];
    [f2 release];
    [f3 release];
    [f4 release];
    [f5 release];
    [f6 release];
    [f7 release];
    [f8 release];
    [f9 release];
    [f10 release];
}
void exercise3()
{
    Fraction *f1 = [[Fraction alloc] initWithNumberto:4 over:8];
    Fraction *f2 = [[Fraction alloc] initWithNumberto:1 over:2];
        
    if([f1 respondsToSelector:@selector(isGreaterThan:)])
    {
        NSLog(@"%i", [f1 isGreaterThan:f2]);
    }
    if([f1 respondsToSelector:@selector(isLessThan:)])
    {
        NSLog(@"%i", [f1 isLessThan:f2]);
    }
    NSLog(@"mytest %i", [f1 mytest]);
    [f1 release];
    [f2 release];
}
void exercise4()
{
    Calculator *calculator = [[Calculator alloc] init];
    calculator.accumulator = 10;
    
    NSMutableString *operate = [[NSMutableString alloc] initWithString:@""];
    double value;
    do
    {
        char * str = NULL;
        scanf("%s %lf",str, &value);
        NSLog(@"%s", str);
        [operate setString:[NSString stringWithCString:str encoding:1]];
        if([operate isEqualTo:@"sin"])
        {
            [calculator sin];
        }
        NSLog(@"%.2f", [calculator accumulator]);
    }
    while ([operate isNotEqualTo:@"exit"]);
    [operate release];
    [calculator  release];
}
void exercise5()
{
    Rectangle *rect = [[Rectangle alloc] initWithWidth:4 andHeight:4];
    Rectangle *rect1 = [[Rectangle alloc] initWithWidth:6 andHeight:5];
    SquareComposite *square = [[SquareComposite alloc] initWithSide:2];
    NSLog(@"Square side:%.2f, area: %.2f, perimeter: %.2f", square.rect.width, [square area], [square perimeter]);
    
    square.rect = rect;
    NSLog(@"Square side:%.2f, area: %.2f, perimeter: %.2f", square.rect.width, [square area], [square perimeter]);
    
    square.rect = rect1;
    NSLog(@"Square side:%.2f, area: %.2f, perimeter: %.2f", square.rect.width, [square area], [square perimeter]);
    
    square.rect =square.rect;
    NSLog(@"Square side:%.2f, area: %.2f, perimeter: %.2f", square.rect.width, [square area], [square perimeter]);
    
    [rect release];
    [rect1 release];
    [square release];
}


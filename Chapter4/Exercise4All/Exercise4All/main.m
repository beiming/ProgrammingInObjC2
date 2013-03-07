//
//  main.m
//  Exercise4All
//
//  Created by 佩鑫 刘 on 11-11-8.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Complex.h"
#import "Rectangle.h"
#import "Calculator.h"

void exercise2(float);
void exercise3(void);
void exercise4(float x);
void exercise5(void);
void exercise6(void);
void exercise7(void);
void exercise8_9_10(void);
int main (int argc, const char * argv[])
{

    @autoreleasepool {
        //exercise2(27);
        //exercise3();
        //exercise4(2.55);
        //exercise5();
        //exercise6();
        exercise7();
        //exercise8_9_10();
    }
    return 0;
}

void exercise2(float f)
{
    float c = (f - 32) / 1.8;
    NSLog(@"华氏温度：%.2f 等同于摄氏温度：%.2f",f,c);
}

void exercise3(void)
{
    char c ,d;
    c = 'd';
    d = c;
    NSLog(@"d = %c", d);
}

void exercise4(float x)
{
    float result = 3 * x * x * x - 5 * x * x + 6;
    NSLog(@"The result is %.3f", result);
}

void exercise5(void)
{
    double result = (3.31e-8 + 2.01e10-7) / (7.16e-6 + 2.01e-8);
    NSLog(@"The result is %e", result);
}

void exercise6(void)
{
    Complex *complex = [[Complex alloc] init];
    [complex setReal:23.4];
    [complex setImaginary:55.7];
    [complex print];
    
    Complex *complex2 = [[Complex alloc] init];
    [complex2 setReal:10 andImaginary:20];
    [complex2 print];
    
}

void exercise7(void)
{
    Rectangle * rectangle = [[Rectangle alloc] init];
    [rectangle setWidth:3 andHeight:4];
    [rectangle print];
}

void exercise8_9_10(void)
{
    Calculator *deskCalc = [[Calculator alloc] init];
    [deskCalc clear];
    [deskCalc setAccumulator:100];
    NSLog(@"add result is %g", [deskCalc add:200]);
    NSLog(@"divid result is %g", [deskCalc divide:15]);
    NSLog(@"subtract result is %g", [deskCalc subtract:10]);
    NSLog(@"multiply result is %g", [deskCalc multiply:5]);
    [deskCalc print];
    
    NSLog(@"changeSign result is %g", [deskCalc changeSign]);
    NSLog(@"reciprocal result is %g", [deskCalc reciprocal]);
    NSLog(@"xSquared result is %g", [deskCalc xSquared]);
    
    [deskCalc clear];
    [deskCalc setAccumulator:10];
    [deskCalc print];
    [deskCalc memoryClear];
    NSLog(@"memoryStore result is %g", [deskCalc memoryStore]);
    NSLog(@"add result is %g", [deskCalc add:200]);
    NSLog(@"memoryAdd result is %g", [deskCalc memoryAdd]);
    NSLog(@"memorySubtract result is %g", [deskCalc memorySubtract]);
    NSLog(@"memoryRecall result is %g", [deskCalc memoryRecall]);
    [deskCalc print];    
}
//
//  main.m
//  Exercise2All
//
//  Created by 佩鑫 刘 on 12-5-12.
//  Copyright (c) 2012年 edu.self. All rights reserved.
//

#import <Foundation/Foundation.h>

void exercise1 (void);
void exercise2 (void);
void exercise3 (void);
void exercise4 (void);
void exercise5 (void);
void exercise6 (void);

int main (int argc, const char * argv[])
{
    
    @autoreleasepool
    {
        //exercise1();
        //exercise2();
        //exercise3();
        //exercise4();
        //exercise5();
        exercise6();
    }
    return 0;
}

void exercise1 (void)
{
    NSLog(@"Programming is fun!");
    NSLog(@"programming in Objective-C is even more fun!");
    NSLog(@"Testing ...\n..1\n..2\n...3");
    int sum, value1, value2;
    value1 = 50;
    value2 = 25;
    sum = value1 + value2;
    NSLog(@"The sum of %i and %i is %i", value1, value2, sum);
}

void exercise2 (void)
{
    NSLog(@"In Objective-C, lowercase letters are significant.\nmain is where program execution begins.\nOpen and closed braces enclose program statements in a routinue.All Program statement must be terminated by semicolon");
}

void exercise3 (void)
{
    int i;
    i = 1;
    NSLog(@"Testing...");
    NSLog(@"....%i", i);
    NSLog(@"...%i", i + 1);
    NSLog(@"..%i", i+2);
}

void exercise4 (void)
{
    int a = 87, b = 15;
    int subtract = a - b;
    NSLog(@"%i subtract %i is %i", a, b, subtract);
}

void exercise5 (void)
{
    /*COMPUTE RESULT*/
    int sum;
    sum = 25 + 37 - 19;
    //DISPLAY RESULT
    NSLog(@"The answer is %i", sum);
}

void exercise6 (void)
{
    int answer, result;
    answer = 100;
    result = answer - 10;
    NSLog(@"The result is %i\n", result + 5);
}






























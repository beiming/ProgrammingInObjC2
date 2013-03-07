//
//  main.m
//  Exercise7All
//
//  Created by 佩鑫 刘 on 7/17/12.
//  Copyright (c) 2012 edu.self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "Complex.h"

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
        //exercise6();
        exercise7();
    }
    return 0;
}

void exercise1()
{
    Fraction *frac1 = [[Fraction alloc] init];
    Fraction *frac2 = [[Fraction alloc] init];
    Fraction * result;
    
    [frac1 setTo:-2 over:4];
    [frac2 setTo:-4 over:16];
    
    [frac1 print:NO];
    [frac2 print:NO];
    
    result = [frac1 add:frac2];
    [result print:NO];
    
    result = [frac1 subtract:frac2];
    [result print:NO];
    
    result = [frac1 multiply:frac2];
    [result print:NO];
    
    result = [frac1 divide:frac2];
    [result print:NO];
    
    [frac1 release];
    [frac2 release];
    
    result = nil;
}

void exercise2()
{
    Fraction *frac = [[Fraction alloc] init];
    [frac setTo:10 over:20];
    [frac print:NO];
    [frac print:YES];
    [frac release];
}

void exercise3()
{
    Fraction *frac = [[Fraction alloc] init];
    Fraction *sum = [[Fraction alloc] init], *sumTmp;
    int max, pow2 = 2;
    [sum setTo:0 over:1];
    NSLog(@"Enter the Max value:");
    scanf("%i", &max);
    for(int i = 0; i < max; ++i)
    {
        [frac setTo:1 over:pow2];
        sumTmp = [sum add:frac];
        [sum setTo:sumTmp.numerator over:sumTmp.donominator];
        pow2 *= 2;
    }
    NSLog(@"%f", [sum convertToNum]);
    [sum print:YES];
    [sum release];
    [frac release];
}

void exercise4()
{
    Fraction *frac = [[Fraction alloc] init];
    [frac setTo:-1 over:4];
    [frac print:NO];
    [frac print:YES];
    
    [frac setTo:10 over:-20];
    [frac print:NO];
    [frac print:YES];
    
    [frac setTo:-10 over:-20];
    [frac print:NO];
    [frac print:YES];
    
    [frac release];
}

void exercise5()
{
    Fraction *frac = [[Fraction alloc] init];
    [frac setTo:16 over:4];
    [frac print:NO];
    [frac print:YES];
    [frac release];
}

void exercise6()
{
    Complex *complex1 = [[Complex alloc] init];
    Complex *complex2 = [[Complex alloc] init], *sum;
    
    [complex1 setReal:2 andImaginary:2];
    [complex2 setReal:3 andImaginary:3];
    
    sum = [complex1 add:complex2];
    [sum print];
    
    [complex1 release];
    [complex2 release];
}

void exercise7 ()
{
    Complex *complex1 = [[Complex alloc] init];
    Complex *complex2 = [[Complex alloc] init];
    Complex *sum = [[Complex alloc] init], *tempSum;
    
    [complex1 setReal:2 andImaginary:2];
    [complex2 setReal:3 andImaginary:3];
    
    tempSum = [complex1 add:complex2];
    [sum setReal:[tempSum real] andImaginary:[tempSum imaginary]];
    [sum print];
    
    [sum release];
    [complex1 release];
    [complex2 release];
}


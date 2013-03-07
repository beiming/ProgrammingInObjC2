//
//  main.m
//  Exercise10All
//
//  Created by peixin liu on 7/31/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"
#import "Rectangle.h"
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
        //exercise6();
        exercise7();
    }
    return 0;
}

void exercise1()
{
    Rectangle *rect = [[Rectangle alloc] initWithWidth:20 andHeight:30];
    [rect print];
    [rect release];
}

void exercise2()
{
    Square *square = [[Square alloc] initWithSide:5];
    [square print];
    [square release];
}

void exercise3()
{
    Fraction *f1 = [[Fraction alloc] init];
    [f1 setTo:1 over:2];
    Fraction *f2 = [[Fraction alloc] init];
    [f2 setTo:1 over:4];
    
    [f1 add:f2];
    NSLog(@"The add function has invoked %u times.", [Fraction getAddCounter]);
    
    [f1 add:f1];
    NSLog(@"The add function has invoked %u times.", [Fraction getAddCounter]);
    
    [[f2 add:f2] print];
    NSLog(@"The add function has invoked %u times.", [Fraction getAddCounter]);
    
    [f1 release];
    [f2 release];
}

void exercise4()
{
    typedef enum{Sounday = 0, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday} Day;
    Day oneDay = Monday;
    Day today = Tuesday;
    NSLog(@"one day is %u, today is %u", oneDay, today);
}

void exercise5()
{
    typedef Fraction* FractionObj;
    FractionObj f1 = [[Fraction alloc] initWithNumberto:1 over:2], f2 = [[Fraction alloc] initWithNumberto:1 over:4];
    [f1 print];
    [f2 print];
    [f1 release];
    [f2 release];
}

void exercise6()
{
    float f = 1.00;
    short int i = 100;
    long int l = 500L;
    double d = 15.00;
    
    NSLog(@"%f, %lu", f + i, sizeof(f + i));//4
    NSLog(@"%e, %lu", l / d, sizeof(l / d));//8
    NSLog(@"%f, %lu", i / l + f, sizeof(i / l + f));//4
    NSLog(@"%li, %lu", l * i, sizeof(l * i));//8
    NSLog(@"%f, %lu", f / 2, sizeof(f / 2));//4
    NSLog(@"%e, %lu", i / (d + f), sizeof(i / (d + f)));//8
    NSLog(@"%e, %lu", l / (i * 2.0), sizeof(l / (i * 2.0)));//8
    NSLog(@"%e, %lu", l + i / (double) l, sizeof(l + i / (double) l));//8
    
    NSLog(@"");
    NSLog(@"short int 's size: %lu", sizeof(short int));
    NSLog(@"long int 's size: %lu", sizeof(long int));
    NSLog(@"int 's size: %lu", sizeof(int));
    NSLog(@"float 's size: %lu", sizeof(float));
    NSLog(@"double 's size: %lu", sizeof(double));
    NSLog(@"long double 's size: %lu", sizeof(long double));
    NSLog(@"long int 's size: %lu", sizeof(long int));
    NSLog(@"long long int 's size: %lu", sizeof(long long int));
    NSLog(@"uint 's size: %lu", sizeof(uint));

    NSLog(@"2.0 's size: %lu", sizeof(2.0));
}

void int2Binary(int i);
void exercise7()
{
    char cha = '\337';                            //11011111
    int intCha = cha;  //10000000 00000000 00000000 00101111
    uint uintCha = cha;//00000000 00000000 00000000 11011111
    NSLog(@"%c, %i, %u", cha, intCha, uintCha);
    int2Binary(cha);
}

void int2Binary(int i)
{
    int flag = 1;
    int text = 0;
    while (i != -1)
    {
        printf("%u", i & flag);
        i >>= 1;
        text ++;
        if(text >= 100)
        {
            break;
        }
    }
    printf("\n");
}


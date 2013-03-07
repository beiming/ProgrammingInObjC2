//
//  main.m
//  Exercise9All
//
//  Created by peixin liu on 7/29/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Complex.h"
#import "Fraction.h"
#import "XYPoint.h"

void exercise1();
void exercise2();
void exercise3();
void exercise4();
void exercise5();
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //exercise1();
        //exercise2();
        //exercise3();
        //exercise4();
        exercise5();
    }
    return 0;
}

void exercise1()
{
    Fraction *f1 = [[Fraction alloc] init];
    Fraction *f2 = [[Fraction alloc] init];
    Fraction *fracResult;
    
    Complex *c1 = [[Complex alloc] init];
    Complex *c2 = [[Complex alloc] init];
    Complex *compResult;
    
    [f1 setTo:1 over:10];
    [f2 setTo:2 over:15];
    
    [c1 setReal:18.0 andImaginary:2.5];
    [c2 setReal:-5 andImaginary:3.2];
    
    //add ant print 2 complex numbers
    [c1 print];NSLog(@"+");[c2 print];
    NSLog(@"------------------");
    compResult = [c1 add:c2];
    //unrecognized selector sent to instance
    //[compResult reduce];
    [compResult print];
    NSLog(@"\n");
    [c1 release];
    [c2 release];
    //In Objective-C, it is valid to send a message to nil -- it simply has no effect at runtime.
    //[c2 print];
    compResult = nil;
    
    //add and print 2 fractions
    [f1 print:YES];NSLog(@"+");[f2 print:YES];
    NSLog(@"-----------------");
    fracResult = [f1 add:f2];
    [fracResult print:YES];
    
    [f1 release];
    [f2 release];
    fracResult = nil;
}

void exercise2()
{
    id dataVaule;
    Fraction *f1 = [[Fraction alloc] init];
    Complex *c1 = [[Complex alloc] init];
    
    [f1 setTo:2 over:5];
    [c1 setReal:10.10 andImaginary:2.5];
    
    //first dataValue gets a fraction
    dataVaule = f1;
    [dataVaule print:YES];
    
    //now dataValue gets a complex number
    dataVaule = c1;
    [dataVaule print];
    
    [c1 release];
    [f1 release];
    
    //dataValue 也可直接赋值，记得release
    dataVaule = [[Fraction alloc] init];
    [dataVaule setTo:1 over:2];
    [dataVaule print:YES];
    [dataVaule release];
}

void exercise3()
{
    id dataValue;
    XYPoint *point = [[XYPoint alloc] init];
    dataValue = point;
    [dataValue setX:10 andY:10];
    [dataValue print];
    [point release];
}

void exercise4()
{
    id complexResult, dataValue1, dataValue2;
    dataValue1 = [[Complex alloc] init];
    dataValue2 = [[Complex alloc] init];
    
    [dataValue1 setReal:10 andImaginary:20];
    [dataValue2 setReal:1 andImaginary:2];

    //the same to use add:
    complexResult = [dataValue1 addForTestId:dataValue2];
    [complexResult print];
    
    [dataValue1 release];
    [dataValue2 release];
}

void exercise5()
{
    Fraction *fraction = [[Fraction alloc] init];
    Complex *complex = [[Complex alloc] init];
    id number = [[Complex alloc] init];
    
    /*
     isMemberOfClass 考察当前实例是不是当前类的实例，仅考察当前类
     isKindOfClass 考察当前实例是不是当前类及其子类饿实例，既考察当前类，也考察当前类的子类
     instancesRespondToSelector 当前类的实例，能否相应当前selector
     */
    
    NSLog(@"%i", [fraction isMemberOfClass:[Complex class]]);//0 不是当前对象的实例
    NSLog(@"%i", [complex isMemberOfClass:[NSObject class]]);//0 不是父对象的实例
    
    NSLog(@"%i", [complex isKindOfClass:[NSObject class]]);//1 子类的实例
    NSLog(@"%i", [fraction isKindOfClass:[Fraction class]]);//1 当前对象的实例
    
    NSLog(@"%i", [fraction respondsToSelector:@selector(print)]);//1
    NSLog(@"%i", [fraction respondsToSelector:@selector(print:)]);//1

    NSLog(@"%i", [complex respondsToSelector:@selector(print)]);//1
    
    
    NSLog(@"%i", [Fraction instancesRespondToSelector:@selector(print)]);//1 类实例的方法
    
    NSLog(@"%i", [number respondsToSelector:@selector(print)]);//1
    NSLog(@"%i", [number isKindOfClass:[Complex class]]);//1
    NSLog(@"%i", [number respondsToSelector:@selector(release)]);//1
    
    NSLog(@"%i", [[number class] respondsToSelector:@selector(alloc)]);//1 alloc是类方法
    NSLog(@"%i", [[number class] instancesRespondToSelector:@selector(alloc)]);//0
    NSLog(@"%i", [number respondsToSelector:@selector(alloc)]);//0
}


















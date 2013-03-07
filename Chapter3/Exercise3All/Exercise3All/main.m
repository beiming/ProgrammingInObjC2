//
//  main.m
//  Exercise3All
//
//  Created by 佩鑫 刘 on 11-11-13.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "Vehicle.h"
#import "XYPoint.h"

void testFraction(void);
void testVehicle(void);
void testXYPoint(void);
int main (int argc, const char * argv[])
{

    @autoreleasepool {
        //testFraction();
        //testVehicle();
        testXYPoint();
    }
    return 0;
}

void testFraction(void)
{
    Fraction *myFraction = [[Fraction alloc] init];
    myFraction.numerator = 1;
    myFraction.donominator = 2;
    [myFraction print:NO];
    NSLog(@"In main function get the class property: The Fraction is :%i/%i", [myFraction numerator], [myFraction donominator]);
    [myFraction release];
}

void testVehicle(void)
{
    Vehicle *myVehicle =[[Vehicle alloc] init];
    [myVehicle prep:@"MaryChia-Car"];
    [myVehicle setGas:100];
    [myVehicle service:@"pinch face"];
    [myVehicle print];
    [myVehicle release];
}

void testXYPoint(void)
{
    XYPoint *point = [[XYPoint alloc] init];
    [point setX:10 andY:9];
    [point print];
    [point release];
}
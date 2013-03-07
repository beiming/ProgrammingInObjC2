//
//  Complex.m
//  Exercise4All
//
//  Created by 佩鑫 刘 on 11-12-11.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import "Complex.h"

@implementation Complex
@synthesize real, imagainary;
-(void)setReal:(double)a
{
    real = a;
}
- (void)setImaginary:(double)b
{
    imaginary = b;
}
-(void)setReal:(double)a andImaginary:(double)b
{
    real = a;
    imaginary = b;
}
- (void)print
{
    NSLog(@"%.2f+%.2fi",real,imaginary);
}

-(double)real
{
    return  real;
}
-(double)imaginary
{
    return imaginary;
}
- (Complex *)add:(Complex *)complexNum
{
    Complex * complex = [[[Complex alloc] init] autorelease];
    [complex setReal:[self real] + [complexNum real] andImaginary:[self imaginary] + [complexNum imaginary]];
    return complex;
}
-(id)addForTestId:(Complex *)complexNum
{
    id result;
    result = [self add:complexNum];
    return result;
}
@end







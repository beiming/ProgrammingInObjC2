//
//  Calculator.m
//  Exercise4All
//
//  Created by 佩鑫 刘 on 11-12-11.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
-(void)setAccumulator:(double)value
{
    accumulator = value;
}
-(void)clear
{
    accumulator = 0;
}
-(double)accumulator
{
    return accumulator;
}
- (double)add:(double)value
{
    accumulator += value;
    return accumulator;
}
-(double)subtract:(double)value
{
    accumulator -= value;
    return accumulator;
}
- (double)multiply:(double)value
{
    accumulator *= value;
    return accumulator;
}
-(double) divide:(double)value
{
    accumulator /= value;
    return accumulator;
}
-(double)changeSign
{
    return -accumulator;
}
-(double)reciprocal
{
    return 1 / accumulator;
}
-(double)xSquared
{
    return accumulator * accumulator;
}
-(double)memoryClear
{
    memory = 0;
    return  memory;
}
-(double)memoryStore
{
    memory = accumulator;
    return  memory;
}
-(double)memoryRecall
{
    accumulator = memory;
    return memory;
}
-(double)memoryAdd
{
    memory += accumulator;
    return memory;
}
-(double)memorySubtract
{
    memory -= accumulator;
    return memory;
}
-(void)print
{
    NSLog(@"The accumulator is %g", [self accumulator]);
}
@end

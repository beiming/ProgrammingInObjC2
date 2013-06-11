//
//  Fraction.m
//  Exercise3All
//
//  Created by 佩鑫 刘 on 11-11-13.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import "Fraction.h"

static uint addCount = 0;

@implementation Fraction
@synthesize numerator, donominator;

-(id)initWithNumberto:(int)numberatorParameter over:(int)donominatorParameter
{
    self = [super init];
    if(self)
    {
        [self setTo:numberatorParameter over:donominatorParameter];
    }
    return self;
}
-(void)print
{
    [self print:YES];
}
-(void) print:(Boolean)needReduce
{
    Fraction *temp = [[Fraction alloc] init];
    [temp setTo:numerator over:donominator];
    if(needReduce == YES)
    {
        [temp reduce];
    }
        
    if(temp.donominator == 1)
    {
        NSLog(@"The Fraction is: %i", temp.numerator);   
    }
    else if(temp.numerator == 0 || temp.donominator == 0)
    {
        NSLog(@"The Fraction is: 0");
    }
    else
    {
        int prefix = temp.numerator / temp.donominator;
        if(prefix >= 1)
        {
            temp.numerator = temp.numerator % temp.donominator;
            if(temp.numerator == 0)
            {
                NSLog(@"The Fraction is: %i", prefix);
            }
            else
            {
                NSLog(@"The Fraction is: %i %i/%i", prefix, temp.numerator, temp.donominator);
            }
        }
        else 
        {
            NSLog(@"The Fraction is: %i/%i", temp.numerator, temp.donominator);
        }
    }
    [temp release];
}

-(double)convertToNum
{
    if(donominator != 0)
    {
        return (double) numerator / donominator;
    }
    else {
        return 0.0;
    }
}

-(void)setTo:(int)numeratorPar over:(int)donominatorPar
{
    numerator = numeratorPar;
    donominator = donominatorPar;
}

- (void)reduce
{
    int u = numerator, v = donominator, temp;
    while (v != 0)
    {
        temp = u % v;
        u = v;
        v = temp;
    }
    numerator /= u;
    donominator /= u;
}

- (Fraction *)add:(Fraction *)f
{
    ++addCount;
    //To add tow fraction
    //a/b + c/d = a*d + b*c / b*d
    Fraction *result = [[[Fraction alloc] init] autorelease];
    int resultNumerator, resultDonminator;
    resultNumerator = numerator * f.donominator + donominator * f.numerator;
    resultDonminator = donominator * f.donominator;
    [result setTo:resultNumerator over:resultDonminator];
    return result;
}
- (Fraction *)subtract:(Fraction *)f
{
    Fraction *result = [[[Fraction alloc] init] autorelease];
    int resultNumerator, resultDonminator;
    resultNumerator = numerator * f.donominator - donominator * f.numerator;
    resultDonminator = donominator * f.donominator;
    [result setTo:resultNumerator over:resultDonminator];
    return result;
    
}

- (Fraction *)multiply:(Fraction *)f
{
    Fraction *result = [[[Fraction alloc] init] autorelease];
    int resultNumerator, resultDonminator;
    resultNumerator = numerator * f.numerator;
    resultDonminator = donominator * f.donominator;
    [result setTo:resultNumerator over:resultDonminator];
    return result;
}

- (Fraction *)divide:(Fraction *)f
{
    Fraction *result = [[[Fraction alloc] init] autorelease];
    int resultNumerator, resultDonminator;
    resultNumerator = numerator * f.donominator;
    resultDonminator = donominator * f.numerator;
    [result setTo:resultNumerator over:resultDonminator];
    return result;
}
-(BOOL)isGreaterThan:(id)object
{
    return YES;
}
+(uint)getAddCounter
{
    //below is not necessary
    //extern uint addCount;
    return addCount;
}
-(BOOL)mytest
{
    return YES;
}
@end

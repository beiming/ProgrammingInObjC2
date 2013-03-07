//
//  Fraction+Comparison.m
//  Exercise11All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import "Fraction+Comparison.h"

@implementation Fraction (Comparison)
-(BOOL)isEqualTo:(Fraction *)f
{
    BOOL result;
    Fraction *tempF1 = [[Fraction alloc] initWithNumberto:self.numerator over:self.donominator];
    Fraction *tempF2 = [[Fraction alloc] initWithNumberto:f.numerator over:f.donominator];
    
    [tempF1 reduce];
    [tempF2 reduce];
    result = tempF1.numerator == tempF2.numerator && tempF1.donominator == tempF2.donominator;
    [tempF1 release];
    [tempF2 release];
    
    return result;
}
-(int)compare:(Fraction *)f
{
    int result = 1;
    Fraction *tempF1 = [[Fraction alloc] initWithNumberto:self.numerator * f.donominator over:self.donominator * f.donominator];
    Fraction *tempF2 = [[Fraction alloc] initWithNumberto:f.numerator * self.donominator over:f.donominator * self.donominator];
    
    if(tempF1.numerator < tempF2.numerator)
    {
        result = -1;
    }
    else if(tempF1.numerator == tempF2.numerator)
    {
        result = 0;
    }    
    [tempF1 release];
    [tempF2 release];
    
    return result;
}
-(NSComparisonResult)comparison:(Fraction *)f
{
    Fraction *tempF1 = [[Fraction alloc] initWithNumberto:self.numerator * f.donominator over:self.donominator * f.donominator];
    Fraction *tempF2 = [[Fraction alloc] initWithNumberto:f.numerator * self.donominator over:f.donominator * self.donominator];
    
    NSComparisonResult result = NSOrderedSame;
    if(tempF1.numerator < tempF2.numerator)
    {
        result =  NSOrderedAscending;
    }
    else if(tempF1.numerator > tempF2.numerator)
    {
        result =  NSOrderedDescending;
    }
    [tempF1 release];
    [tempF2 release];
    return result;
}
@end

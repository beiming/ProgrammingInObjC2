//
//  Fraction+MathOps.m
//  Exercise11All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import "Fraction+MathOps.h"

@implementation Fraction (MathOps)
-(Fraction *)add2:(Fraction *)f
{
    // a/b + c/d = (ad + bc) / bd
    float resultNumerator = self.numerator * f.donominator + self.donominator * f.numerator;
    float resultDenominator = self.donominator * f.donominator;
    Fraction *result = [[[Fraction alloc] initWithNumberto:resultNumerator over:resultDenominator] autorelease];
    return result;
}
-(Fraction *)sub:(Fraction *)f
{
    // a/b - c/d = (ad - bc) / bd
    float resultNumerator = self.numerator * f.donominator - self.donominator * f.numerator;
    float resultDenominator = self.donominator * f.donominator;
    Fraction *result = [[[Fraction alloc] initWithNumberto:resultNumerator over:resultDenominator] autorelease];
    return result;
}
-(Fraction *)mul:(Fraction *)f
{
    // a/b * c/d = ac / bd
    float resultNumerator = self.numerator * f.numerator;
    float resultDenominator = self.donominator * f.donominator;
    Fraction *result = [[[Fraction alloc] initWithNumberto:resultNumerator over:resultDenominator] autorelease];
    return result;
}
-(Fraction *)div:(Fraction *)f
{
    // a/b / c/d = ad / bc
    float resultNumerator = self.numerator * f.donominator;
    float resultDenominator = self.donominator * f.numerator;
    Fraction *result = [[[Fraction alloc] initWithNumberto:resultNumerator over:resultDenominator] autorelease];
    return result;
}
-(Fraction *)invert:(Fraction *)f
{
    Fraction *result = [[[Fraction alloc] initWithNumberto:f.donominator over:f.numerator] autorelease];
    return result;
}
@end

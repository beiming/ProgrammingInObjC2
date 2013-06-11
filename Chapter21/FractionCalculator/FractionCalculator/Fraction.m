//
//  Fraction.m
//  Exercise3All
//
//  Created by 佩鑫 刘 on 11-11-13.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import "Fraction.h"
@interface Fraction()
+(int)gcdWithU:(int)u andV:(int) v;
@end

@implementation Fraction
+(int)gcdWithU:(int)u andV:(int)v
{
    while(v != DEFAULT_NUMBER)
    {
        int temp = u % v;
        u = v;
        v = temp;
    }
    return u;
}

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
    Fraction *temp = [[Fraction alloc] init];
    [temp setTo:self.numerator over:self.donominator];
    if(temp.donominator == DEFAULT_DONOMINATOR)
    {
        NSLog(@"The Fraction is: %i", temp.numerator);
    }
    else if(temp.numerator == DEFAULT_NUMBER || temp.donominator == DEFAULT_NUMBER)
    {
        NSLog(@"The Fraction is: %i", DEFAULT_NUMBER);
    }
    else
    {
        NSLog(@"The Fraction is: %i/%i", temp.numerator, temp.donominator);
    }
}
-(NSString *)convertToString
{
    [self reduce];
    if(self.numerator == DEFAULT_NUMBER || self.donominator == DEFAULT_NUMBER)
    {
        return DEFAULT_DISPLAY;
    }
    else if(self.numerator == self.donominator)
    {
        return [NSString stringWithFormat:@"%i", DEFAULT_DONOMINATOR];
    }
    else if(self.donominator == DEFAULT_DONOMINATOR)
    {
        return [NSString stringWithFormat:@"%i", self.numerator];
    }
    else
    {
        return [NSString stringWithFormat:@"%i/%i", self.numerator, self.donominator];
    }
}

-(double)convertToNum
{
    if(self.donominator != DEFAULT_NUMBER)
    {
        return  (double) self.numerator / self.donominator;
    }
    else {
        return DEFAULT_NUMBER;
    }
}

-(void)setTo:(int)numeratorPar over:(int)donominatorPar
{
    self.numerator = numeratorPar;
    self.donominator = donominatorPar;
}

- (void)reduce
{
    if(self.numerator == DEFAULT_NUMBER || self.donominator == DEFAULT_NUMBER)
    {
        return;
    }
    int gcbNumber = [Fraction gcdWithU:self.numerator andV:self.donominator];
    self.numerator /= gcbNumber;
    self.donominator /= gcbNumber;
}

- (Fraction *)add:(Fraction *)f
{
    //To add tow fraction
    //a/b + c/d = a*d + b*c / b*d
    Fraction *result = [[Fraction alloc] init];
    int resultNumerator, resultDonminator;
    resultNumerator = self.numerator * f.donominator + self.donominator * f.numerator;
    resultDonminator = self.donominator * f.donominator;
    [result setTo:resultNumerator over:resultDonminator];
    return result;
}
- (Fraction *)subtract:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    int resultNumerator, resultDonminator;
    resultNumerator = self.numerator * f.donominator - self.donominator * f.numerator;
    resultDonminator = self.donominator * f.donominator;
    [result setTo:resultNumerator over:resultDonminator];
    return result;
    
}

- (Fraction *)multiply:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    int resultNumerator, resultDonminator;
    resultNumerator = self.numerator * f.numerator;
    resultDonminator = self.donominator * f.donominator;
    [result setTo:resultNumerator over:resultDonminator];
    return result;
}

- (Fraction *)divide:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    int resultNumerator, resultDonminator;
    resultNumerator = self.numerator * f.donominator;
    resultDonminator = self.donominator * f.numerator;
    [result setTo:resultNumerator over:resultDonminator];
    return result;
}
@end


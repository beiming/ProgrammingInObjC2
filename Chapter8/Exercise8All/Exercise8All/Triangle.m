//
//  Triangle.m
//  Exercise8All
//
//  Created by 佩鑫 刘 on 7/24/12.
//  Copyright (c) 2012 edu.self. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle
@synthesize a,b,c;
-(float)perimeter
{
    return a + b + c;
}
-(float)area
{
    return a + b + c;
}
-(void)print
{
    NSLog(@"The Triangle sides is %.2f,%.2f,%.2f, perimeter is %.2f and area is %.2f", self.a, self.b, self.c, [self perimeter], [self area]);
}
@end

//
//  Circle.m
//  Exercise8All
//
//  Created by 佩鑫 刘 on 7/24/12.
//  Copyright (c) 2012 edu.self. All rights reserved.
//

#import "Circle.h"
static const float myPI = 3.1415926;
@implementation Circle
@synthesize radius;
-(float)perimeter
{
    return 2 * myPI * radius;
}
-(float)area
{
    return myPI * radius * radius;
}
-(void)print
{
    NSLog(@"The Circle radius is %.2f, perimeter is %.2f and area is %.2f", self.radius, [self perimeter], [self area]);
}
@end

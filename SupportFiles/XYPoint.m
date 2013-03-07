//
//  XYPoint.m
//  Exercise3All
//
//  Created by 佩鑫 刘 on 11-12-4.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import "XYPoint.h"

@implementation XYPoint
@synthesize x, y;
-(void) setX:(float)vx
{
    x = vx;
}

-(void) setY:(float)vy
{
    y = vy;
}

-(void) setX:(float)vx andY :(float)vy
{
    x = vx;
    y = vy;
}
-(float)x
{
    return x;
}
-(float)y
{
    return y;
}
-(void)print
{
    NSLog(@"(%.2f,%.2f)", x, y);
}
@end

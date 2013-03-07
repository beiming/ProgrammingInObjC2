//
//  Vehicle.m
//  Exercise3All
//
//  Created by 佩鑫 刘 on 11-11-13.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle
-(void) prep:(NSString *)name
{
    Name = name;
}
-(int) getGas
{
    return GasValue;
}
-(void) setGas:(int)val
{
    GasValue = val;
}
-(void) service:(NSString *)ser
{
    Service = ser;
}
-(void) print
{
    NSLog(@"The vehicle's name is %@, has gas %i, for this you can get service: %@.", Name, [self getGas], Service);
}
@end

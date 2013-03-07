//
//  Vehicle.h
//  Exercise3All
//
//  Created by 佩鑫 刘 on 11-11-13.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject
{
    NSString * Name;
    int GasValue;
    NSString * Service;
}
-(void) prep: (NSString *)name;
-(int) getGas;
-(void) setGas: (int) val;
-(void) service: (NSString *)ser;
-(void) print;
@end

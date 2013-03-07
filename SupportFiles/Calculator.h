//
//  Calculator.h
//  Exercise4All
//
//  Created by 佩鑫 刘 on 11-12-11.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
{
    double accumulator;
    double memory;
}
//accumulator methods
-(void) setAccumulator:(double) value;
-(void) clear;
-(double) accumulator;

//arithmetic methods
-(double) add:(double) value;
-(double) subtract:(double) value;
-(double) multiply:(double) value;
-(double) divide:(double) value;
-(double) changeSign;
-(double) reciprocal;
-(double) xSquared;

//memory
-(double) memoryClear;
-(double) memoryStore;
-(double) memoryRecall;
-(double) memoryAdd;
-(double) memorySubtract;

-(void) print;
@end

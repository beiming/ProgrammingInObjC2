//
//  Fraction.h
//  Exercise3All
//
//  Created by 佩鑫 刘 on 11-11-13.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSComparisonMethods.h"
@interface Fraction : NSObject<NSComparisonMethods>
{
    //由于property，下边变量定义都可省略
    //int numerator;
    //int donominator;
}
@property (nonatomic,assign) int numerator, donominator;

-(id)initWithNumberto:(int) numberatorParameter over:(int) donominatorParameter;

-(void) print;
-(void) print: (Boolean) needReduce;
-(double) convertToNum;
-(void) setTo: (int) numeratorPar over: (int) donominatorPar;
-(void) reduce;

//operation
//add argument from receiver
-(Fraction *) add: (Fraction *) f;
//subtract argument from receiver
-(Fraction *) subtract: (Fraction *) f;
//multiply reveiver by argument
-(Fraction *) multiply: (Fraction *) f;
//Divide receiver by argument
-(Fraction *) divide: (Fraction *) f;

//other
+(uint)getAddCounter;
@end

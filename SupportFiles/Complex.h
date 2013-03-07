//
//  Complex.h
//  Exercise4All
//
//  Created by 佩鑫 刘 on 11-12-11.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Complex : NSObject
{
    double real;
    double imaginary;
}
@property (nonatomic,assign)double real, imagainary;
-(void) setReal:(double) a;
-(void) setImaginary:(double) b;
-(void) setReal:(double)a andImaginary:(double) b;
-(void) print;
-(double) real;
-(double) imaginary;

//operator
-(Complex *) add:(Complex *) complexNum;
-(id) addForTestId:(Complex *) complexNum;
@end

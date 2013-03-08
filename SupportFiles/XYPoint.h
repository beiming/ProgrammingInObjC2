//
//  XYPoint.h
//  Exercise3All
//¡
//  Created by 佩鑫 刘 on 11-12-4.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYPoint : NSObject <NSCopying>
{
    float x;
    float y;
}
@property (nonatomic, assign) float x, y;

-(void) setX:(float) vx;
-(void) setY:(float) vy;
-(void) setX:(float) vx andY:(float) vy;
-(float) x;
-(float) y;
-(void) print;
-(id)copyWithZone:(NSZone *)zone;
-(void)dealloc;
@end

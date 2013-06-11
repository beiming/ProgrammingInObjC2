//
//  Rectangle.h
//  Exercise4All
//
//  Created by 佩鑫 刘 on 11-12-11.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYPoint.h"
#import "GraphicObject.h"
@interface Rectangle : GraphicObject
{
    float width;
    float height;
    XYPoint *origin;
    
}
@property float width, height;
@property (nonatomic, assign)XYPoint* origin;
-(id)initWithWidth:(float)w andHeight:(float)h;
-(void) setWidth:(float) w andHeight:(float) h;
-(void) setX:(float) _x y:(float) _y width:(float) _w height:(float) _h;
-(float) area;
-(float) perimeter;
-(void) print;
-(void) printRectangle;

-(void) setOrigin:(XYPoint*) point;
-(XYPoint *) origin;
-(void) dealloc;
-(void) translate:(XYPoint*) point;

-(Rectangle*) intersect:(Rectangle*) rect;
@end

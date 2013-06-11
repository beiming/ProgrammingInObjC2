//
//  Rectangle.m
//  Exercise4All
//
//  Created by 佩鑫 刘 on 11-12-11.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle
@synthesize width, height;
@synthesize origin;
-(id)initWithWidth:(float)w andHeight:(float)h
{
    self = [super init];
    if(self)
    {
        [self setWidth:w andHeight:h];
    }
    return self;
}

-(void)setWidth:(float)w andHeight:(float)h
{
    width = w;
    height = h;
    origin = [[XYPoint alloc] init];
    origin.x = origin.y = 0;
}
-(void)setX:(float)_x y:(float)_y width:(float)_w height:(float)_h
{
    origin = [[XYPoint alloc] init];
    origin.x = _x;
    origin.y = _y;
    width = _w;
    height = _h;
}
-(float)area
{
    return width * height;
}
-(float)perimeter
{
    return width + height;
}

-(void)print
{
    NSLog(@"The Rectangle[Wdith,Height]:[%.2f,%.2f]. Area is %.2f, Perimeter is %.2f.", 
          self.width, height, [self area], [self perimeter]);
    if(self.origin)
    {
        NSLog(@"at point (%.2f,%.2f)", origin.x, origin.y);
    }
}
-(void) printRectangle
{
    NSLog(@"(%.2f,%.2f,%.2f,%.2f)", origin.x, origin.y, origin.x + width, origin.y + height);
}
- (void)setOrigin:(XYPoint *)point
{
    if(point != origin)
    {
        [origin release];
        origin = [[XYPoint alloc] init];
        [origin setX:[point x] andY:[point y]];
    }
}
- (XYPoint *)origin
{
    return origin;
}
-(void)translate:(XYPoint *)point
{
    if (origin) {
        origin.x = point.x;
        origin.y = point.y;
    }
}
-(Rectangle *)intersect:(Rectangle *)rect
{
    Rectangle *resultRect = [[[Rectangle alloc] init] autorelease];
    [resultRect setWidth:0 andHeight:0];
    
    
    float x1, x2, x3, x4, y1, y2, y3, y4;
    x1 = self.origin.x;
    x2 = self.origin.x + self.width;
    x3 = rect.origin.x;
    x4 = rect.origin.x + rect.width;
    
    y1 = self.origin.y;
    y2 = self.origin.y + self.height;
    y3 = rect.origin.y;
    y4 = rect.origin.y + rect.height;
    /*
     在屏幕坐标系里，矩形，定了左上角顶点，另外一点总是向坐标系方向扩展的。
     所以，只要判断两个矩形的左上角点，何右下角点，大小关系就能确定是否相交
     假设两个矩形，两点表示 A(x1,y1,x2,y2) B(x3,y3,x4,y4)相交的条件是：
     A的右下角点要大于B的左上角点 x2 >= x3 && y2 >= y3;
     A的左上角点要小于B的右下角点 x1 <= x4 && y1 <= y4
     A，B顺序可以互换，互换之后当作两个不同的矩形即可，只要满足上述条件，即相交。
     相交矩形的顶点确定C (x5,y5,x6,y6)
     C 的左上角点 取A和B里较大的 x1 >= x3 ? x1 : x3; y1 >= x3 ? y1 : y3;
     C 的右下角点 取A和B里较小的 x2 <= x4 ? x2 : x4; y2 <= y4 ? y2 : y4;
     
     所以就有了第二个思路，直接计算相交矩形的两点，如果 两点>=0，切点 1>=点2 则相交。
     */
    if(x2 >= x3 && y2 >= y3 && y4 >= y1 && x4 >= x1)
    {
        resultRect.origin.x = x1 >= x3 ? x1 : x3;
        resultRect.origin.y = y1 >= y3 ? y1 : y3;
        float a = x2 <= x4 ? x2 : x4;
        float b = y2 <= y4 ? y2 : y4;
        resultRect.width = a - resultRect.origin.x;
        resultRect.height = b - resultRect.origin.y;
        NSLog(@"intersect");
        [resultRect printRectangle];
    }
    else
    {
        NSLog(@"not intersect");
    }
    return resultRect;
}
- (void)dealloc
{
    [origin release];
    [super dealloc];
}
@end

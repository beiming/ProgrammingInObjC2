//
//  SquareComposite.m
//  Exercise11All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import "SquareComposite.h"

@implementation SquareComposite
@synthesize rect;
-(SquareComposite *)initWithSide:(int)s
{
    self = [super init];
    if(self)
    {
        rect = [[Rectangle alloc] initWithWidth:s andHeight:s];
    }
    return self;
}
-(void) setRect:(Rectangle *)r
{
    if(rect != r && r.width == r.height)
    {
        [rect release];
        rect = [[Rectangle alloc] initWithWidth:r.width andHeight:r.height];
    }
    else
    {
        NSLog(@"the same rect or invalid square");
    }
}
-(float)area
{
    return rect.width * rect.height;
}
-(float)perimeter
{
    return rect.width + rect.height;
}
- (void)dealloc
{
    [rect release];
    [super dealloc];
}
@end

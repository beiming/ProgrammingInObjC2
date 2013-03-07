//
//  Square.m
//  Exercise10All
//
//  Created by peixin liu on 7/31/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import "Square.h"

@implementation Square
@synthesize side;
-(id)initWithSide:(float)sideParameter
{
    self = [super initWithWidth:sideParameter andHeight:sideParameter];
    if(self)
    {
        [self setSide:sideParameter];
    }
    return self;
}
-(void)setSide:(float)sideParameter
{
    side = sideParameter;
    [self setWidth:sideParameter andHeight:sideParameter];
}
@end

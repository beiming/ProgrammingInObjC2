//
//  Calculator+Trig.m
//  Exercise11All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import "Calculator+Trig.h"

@implementation Calculator (Trig)
-(double)sin
{
    self.accumulator = sin(self.accumulator);
    return self.accumulator;
}
-(double)cos
{
    self.accumulator = cos(self.accumulator);
    return self.accumulator;
}
-(double)tan
{
    self.accumulator = tan(self.accumulator);
    return self.accumulator;
}
@end

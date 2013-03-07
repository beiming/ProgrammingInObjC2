//
//  MyDate.m
//  Exercise13All
//
//  Created by peixin liu on 2/27/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import "MyDate.h"

@implementation MyDate
@synthesize day, year, month;
-(void)print
{
    //%.2 same as %02
    NSLog(@"%.2i/%.2i/%4i", day, month, year);
}

-(void)dateUpdate:(int)d month:(int)m year:(int)y
{
    day = d;
    month = m;
    year = y;
}

-(id)initWithDate:(int)d month:(int)m year:(int)y
{
    self = [super init];
    if(self)
    {
        [self dateUpdate:d month:m year:y];
    }
    return self;
}
@end

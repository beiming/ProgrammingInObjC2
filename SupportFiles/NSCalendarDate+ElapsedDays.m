//
//  NSCalendarDate+ElapsedDays.m
//  Exercise15All
//
//  Created by peixin liu on 3/1/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import "NSCalendarDate+ElapsedDays.h"

@implementation NSCalendarDate (ElapsedDays)
-(unsigned long)numberOfElapsedDays:(NSCalendarDate *)theData
{
    
    return [self dayOfCommonEra] - [theData dayOfCommonEra];
}
@end

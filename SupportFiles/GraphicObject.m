//
//  GraphicObject.m
//  Exercise8All
//
//  Created by 佩鑫 刘 on 7/24/12.
//  Copyright (c) 2012 edu.self. All rights reserved.
//

#import "GraphicObject.h"

@implementation GraphicObject
@synthesize fillColor,lineColor;
@synthesize filled;
-(void)test
{
    NSLog(@"0x%x, 0x%x, %i",fillColor, lineColor, filled);
}
@end

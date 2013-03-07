//
//  MyDate.h
//  Exercise13All
//
//  Created by peixin liu on 2/27/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDate : NSObject
{}
@property int day, month, year;
-(id)initWithDate:(int)d month:(int)m year:(int)y;
-(void)print;
-(void)dateUpdate:(int)d month:(int)m year:(int)y;

@end

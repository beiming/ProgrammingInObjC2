//
//  Song.h
//  Exercise15All
//
//  Created by peixin liu on 3/4/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject
@property (nonatomic, copy)NSString *name, *artist, *album;
@property (nonatomic, assign)int time;
-(id)initWithName:(NSString *)n artist:(NSString *)ar album:(NSString *)al time:(int) t;
-(void)dealloc;
-(BOOL)isEqual:(Song *)theSong;
-(NSComparisonResult)compareSong:(Song *) theSong;
-(NSComparisonResult)compareSongWithName:(NSString *)theName;
@end

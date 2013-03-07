//
//  Song.m
//  Exercise15All
//
//  Created by peixin liu on 3/4/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import "Song.h"

@implementation Song
@synthesize name, artist, album, time;
-(id)initWithName:(NSString *)n artist:(NSString *)ar album:(NSString *)al time:(int)t
{
    self = [super init];
    if(self)
    {
        self.name = n;
        self.artist = ar;
        self.album = al;
        self.time = t;
    }
    return self;
}
-(void)dealloc
{
    [name release];
    [artist release];
    [album release];
    [super dealloc];
}
-(BOOL)isEqual:(Song *)theSong
{
    return [self.name isEqualToString:theSong.name] && [self.artist isEqualToString:theSong.artist] && [self.album isEqualToString:theSong.album];
}
-(NSComparisonResult)compareSong:(Song *)theSong
{
    NSComparisonResult result = [self.name compare:theSong.name options:NSCaseInsensitiveSearch];
    if(result == NSOrderedSame)
    {
        result = [self.artist compare:theSong.artist options:NSCaseInsensitiveSearch];
        if(result == NSOrderedSame)
        {
            result = [self.album compare:theSong.album options:NSCaseInsensitiveSearch];
        }
    }
    return result;
}
-(NSComparisonResult)compareSongWithName:(NSString *)theName
{
    return [self.name compare:theName options:NSCaseInsensitiveSearch];
}
@end

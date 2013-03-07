//
//  PlayList.h
//  Exercise15All
//
//  Created by peixin liu on 3/4/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"
@interface PlayList : NSObject
{
    @private
    NSMutableDictionary *songs;
    @public
    NSMutableArray *songsKeyIndex;
}
@property (copy, nonatomic)NSString *name;

-(id)init;
-(id)initWithName:(NSString *)n andSongs:(Song *)song1, ...;
-(void)dealloc;
-(void)printList;
-(void)sortWithSongName;

-(void)addSong:(Song *)theSong;
-(void)removeSong:(Song *)theSong;
-(void)removeSongFromName:(NSString *)theName;

-(Song *)findSongFromName:(NSString *)theName;

-(BOOL)isEqual:(PlayList *)object;

-(NSArray *)getAllSongs;
@end

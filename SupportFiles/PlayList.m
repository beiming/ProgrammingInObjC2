//
//  PlayList.m
//  Exercise15All
//
//  Created by peixin liu on 3/4/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import "PlayList.h"

@implementation PlayList
@synthesize name;
-(id)init
{
    self = [super init];
    if(self)
    {
        songs = [[NSMutableDictionary alloc] init];
        songsKeyIndex = [[NSMutableArray alloc] init];
    }
    return self;
}
-(id)initWithName:(NSString *)n andSongs:(Song *)song1, ...
{
    self = [self init];
    if(self)
    {
        self.name = n;
        va_list arguementList;
        va_start(arguementList, song1);
        Song *song;
        if(song1)
        {
            //[songs setObject:song1 forKey:song1.name];
            songs[song1.name] = song1;
            songsKeyIndex[0] = song1.name;
            int index = 1;
            while ((song = va_arg(arguementList, Song*)))
            {
                if(song)
                {
                    //[songs setObject:song forKey:song.name];
                    songs[song.name] = song;
                    songsKeyIndex[index] = song.name;
                    index++;
                }
            }
            va_end(arguementList);
        }
    }
    return self;
}
-(void)dealloc
{
    [name release];
    [songs release];
    [super dealloc];
}
-(void)printList
{
    if(songs != nil && songsKeyIndex !=nil)
    {
        printf("PlayList: %s\n", [name UTF8String]);
        for(NSString *key in songsKeyIndex)
        {
            Song *song = songs[key];
            printf("%-15s %-15s %-15s %-3i minute\n", [song.name UTF8String], [song.artist UTF8String], [song.album UTF8String], song.time);
        }
    }
}
-(void)sortWithSongName
{
    [songsKeyIndex sortUsingSelector:@selector(compare:)];
}
-(void)addSong:(Song *)theSong
{
    [songsKeyIndex addObject:theSong.name];
    songs[theSong.name] = theSong;
}
-(void)removeSong:(Song *)theSong
{
    [songsKeyIndex removeObject:theSong.name];
    [songs removeObjectForKey:theSong.name];
}
-(void)removeSongFromName:(NSString *)theName
{
    [songsKeyIndex removeObject:theName];
    [songs removeObjectForKey:theName];
}
-(Song *)findSongFromName:(NSString *)theName
{
    return [songs objectForKey:theName];
}
-(BOOL)isEqual:(PlayList *)object
{
    return self.name == object.name;
}
-(NSArray *)getAllSongs
{
    NSArray *array = [songs allValues];
    return  array;
}
@end

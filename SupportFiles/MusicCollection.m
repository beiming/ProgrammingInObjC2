//
//  MusicCollection.m
//  Exercise15All
//
//  Created by peixin liu on 3/4/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import "MusicCollection.h"
@interface MusicCollection()
{
    @private
    NSMutableArray *playListArr;
}
@end
@implementation MusicCollection
-(id)init
{
    self = [super init];
    if(self)
    {
        library = [[PlayList alloc] init];
        library.name = @"Library";
        playListArr = [[NSMutableArray alloc] init];
    }
    return self;
}
-(id)initWithPlayList:(PlayList *)list1, ...
{
    self = [self init];
    if(self)
    {
        va_list arguementList;
        va_start(arguementList, list1);
        PlayList *list;
        if(list1)
        {
            [self addPlayList:list1];
            while ((list = va_arg(arguementList, PlayList*)))
            {
                if(list)
                {
                    [self addPlayList:list];
                }
            }
            va_end(arguementList);
        }

    }
    return self;
}
-(void)addPlayList:(PlayList *)list
{
    [playListArr addObject:list];

    NSArray *songs = [list getAllSongs];

    for(Song *song in songs)
    {
        if([library findSongFromName:song.name] == NO)
        {
            [library addSong:song];
        }
    }
}
-(void)removePlayList:(PlayList *)list
{
    [playListArr removeObject:list];
    NSArray *songs = [list getAllSongs];
    for(Song *song in songs)
    {
        [library removeSong:song];
    }
}

-(void)dealloc
{
    [library release];
    [playListArr release];
    [super dealloc];
}
-(void)addSong:(Song *)song toPlayList:(PlayList *)list
{
    if([playListArr containsObject:list] == YES)
    {
        [list addSong:song];
        [library addSong:song];
    }
    else
    {
        [list addSong:song];
        [self addPlayList:list];
    }
        
}
-(void)removeSong:(Song *)song fromPlayList:(PlayList *)list
{
    if([playListArr containsObject:list] == YES)
    {
        [list removeSong:song];
        [library removeSong:song];
    }
}
-(void)removeSongFromLibrary:(Song *)song
{
    [library removeSong:song];
    for(PlayList *list in playListArr)
    {
        if([list findSongFromName:song.name])
        {
            [list removeSong:song];
        }
    }
}
-(PlayList *)getLibrary
{
    return library;
}
-(void)printLibrary
{
    [library printList];
}
@end

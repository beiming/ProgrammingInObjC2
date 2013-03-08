//
//  MusicCollection.h
//  Exercise15All
//
//  Created by peixin liu on 3/4/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayList.h"
#import "Song.h"
@interface MusicCollection : NSObject
{
    PlayList *library;
}
-(id)init;
-(id)initWithPlayList:(PlayList *)list1, ...;
-(void)addPlayList:(PlayList *)list;
-(void)removePlayList:(PlayList *)list;
-(void)dealloc;
-(void)addSong:(Song *)song toPlayList:(PlayList *)list;
-(void)removeSong:(Song *)song fromPlayList:(PlayList *)list;
-(void)removeSongFromLibrary:(Song *)song;
-(PlayList *)getLibrary;
-(void)printLibrary;
@end

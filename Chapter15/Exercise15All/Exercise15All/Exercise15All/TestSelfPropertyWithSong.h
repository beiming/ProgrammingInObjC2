//
//  TeseSelfPropertyWithSong.h
//  Exercise15All
//
//  Created by peixin liu on 3/5/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"

@interface TestSelfPropertyWithSong : NSObject
{
    @public
    int publicVar;
    @private
    int privateVar;
    @protected
    int protectedVar;
}
@property (assign, nonatomic, readonly)NSString *test;
@property (retain, nonatomic)Song * testSong;
-initWithSong:(Song *)theSong;
-initWithDefaultSong;
//-(void)setTestSong:(Song *)testSong;
//-(Song *)testSong;
-(void)dealloc;
@end

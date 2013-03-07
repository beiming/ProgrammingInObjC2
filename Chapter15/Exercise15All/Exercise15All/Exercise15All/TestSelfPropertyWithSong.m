//
//  TeseSelfPropertyWithSong.m
//  Exercise15All
//
//  Created by peixin liu on 3/5/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import "TestSelfPropertyWithSong.h"

@implementation TestSelfPropertyWithSong
//如果写上这句，则不会自动生成_xxx,xxx于self.xxx不同
//@synthesize testSong;
//-(void)setTestSong:(Song *)thetestSong
//{
//    if(thetestSong != testSong)
//    {
//        [testSong release];
//        testSong = [thetestSong retain];
//    }
//}
//-(Song *)testSong
//{
//    //property为retain，get 不会retain
//    return _testSong;
//}
-(id)initWithSong:(Song *)theSong
{
    self = [super init];
    if(self)
    {
        //self.xxx 会调用setXXX方法
        //xxx会直接访问xxx属性
        //这里因该自行retain 或者用self.xxx
        self.testSong = theSong;
    }
    return self;
}
-(id)initWithDefaultSong
{
    self = [super init];
    if(self)
    {
        //这里如果使用self.xxx就会内存泄漏,因为会多呗retain一次
        _testSong = [[Song alloc] initWithName:@"Song" artist:@"Liu dehua" album:@"Chinese" time:200];
        printf("init alloc %lu\n", _testSong.retainCount);
    }
    return self;
}
-(void)dealloc
{
    [_testSong release];
    //NSLog(@"dealloc %lu", [_testSong retainCount]);
    [super dealloc];
}
@end

//
//  main.m
//  copy
//
//  Created by peixin liu on 3/7/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        NSFileManager *fm;
        NSArray *sources;
        NSString *dest = nil;
        BOOL isDir;
        NSProcessInfo *proc = [NSProcessInfo processInfo];
        NSArray *args = [proc arguments];
        
        NSLog(@"%@", [args description]);
        
        fm = [NSFileManager defaultManager];
        
        if(args.count < 3)
        {
            NSLog(@"Usage: %@ src1 src2 ... dest(if multi src ,dest must be directory).", proc.processName);
            return 1;
        }
        NSRange range;
        range.location = 1;
        range.length = args.count - 2;
        sources = [args subarrayWithRange:range];
        dest = args[args.count - 1];

        NSLog(@"%@", [sources description]);
        
        for(NSString *source in sources)
        {
            if([fm isReadableFileAtPath:source] == NO)
            {
                NSLog(@"Can't read %@", source);
                return 2;
            }
        }
        [fm fileExistsAtPath:dest isDirectory:&isDir];
        if(isDir)
        {
            for(NSString *source in sources)
            {
                NSString *realDest = [dest stringByAppendingPathComponent:[source lastPathComponent]];
                [fm removeItemAtPath:realDest error:nil];
                if([fm copyItemAtPath:source toPath:realDest error:nil] == NO)
                {
                    NSLog(@"copy %@ to %@ failed!", source, realDest);
                    return 3;
                }
                NSLog(@"copy %@ to %@ successed!", source, realDest);
            }
        }
        else
        {
            if(sources.count != 1)
            {
                NSLog(@"Usage: %@ src1 src2 ... dest(if multi src ,dest must be directory).", proc.processName);
                return 4;
            }
            [fm removeItemAtPath:dest error:nil];
            if([fm copyItemAtPath:sources[0] toPath:dest error:nil] == NO)
            {
                NSLog(@"copy %@ to %@ failed!", sources[0], dest);
                return 3;
            }
            NSLog(@"copy %@ to %@ successed!", sources[0], dest);

        }
    }
    return 0;
}


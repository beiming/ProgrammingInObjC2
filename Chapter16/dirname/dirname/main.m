//
//  main.m
//  dirname
//
//  Created by peixin liu on 3/7/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        NSProcessInfo *proc = [NSProcessInfo processInfo];
        NSArray *args = [proc arguments];
        if(args.count != 2)
        {
            NSLog(@"Usage %@ src", proc.processName);
            return 1;
        }
        NSString *src = args[1];
        NSLog(@"the dirname is:%@", src.stringByDeletingLastPathComponent);
    }
    return 0;
}


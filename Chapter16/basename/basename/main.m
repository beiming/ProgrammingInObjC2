//
//  main.m
//  basename
//
//  Created by peixin liu on 3/7/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        NSProcessInfo *proce = [NSProcessInfo processInfo];
        NSArray *args = [proce arguments];
        if(args.count != 2)
        {
            NSLog(@"Usage %@ src", proce.processName);
            return 1;
        }
        NSString *src = args[1];
        NSLog(@"the basename is:%@", src.lastPathComponent);
    }
    return 0;
}


//
//  main.m
//  TestARC
//
//  Created by peixin liu on 3/7/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        NSMutableString *str = [[NSMutableString alloc] initWithString:@"hello "];
        [str appendString:@"world"];
        NSLog(@"%@", str);
    }
    return 0;
}


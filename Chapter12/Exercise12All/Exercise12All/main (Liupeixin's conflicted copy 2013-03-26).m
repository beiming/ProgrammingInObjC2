//
//  main.m
//  Exercise12All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        Fraction * frac = [[Fraction alloc] initWithNumberto:1 over:2];
        [frac print];
        NSLog(@"%l", [frac add2:frac]);
        [frac release];
        
    }
    return 0;
}


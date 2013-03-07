//
//  NSString+TempFiles.m
//  Exercise16All
//
//  Created by peixin liu on 3/7/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import "NSString+TempFiles.h"

@implementation NSString (TempFiles)
+(NSString *)temporaryFileName
{
    NSMutableString *tempFileSource = [[NSMutableString alloc] initWithString:NSTemporaryDirectory()];
    [tempFileSource appendString:[[NSProcessInfo processInfo] globallyUniqueString]];
    NSString *tempFile = [[tempFileSource copy] autorelease];
    [tempFileSource release];
    return tempFile;
}

@end

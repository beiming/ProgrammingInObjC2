//
//  main.m
//  myfind
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
        if(args.count != 3)
        {
            NSLog(@"Usage %@ src filename", proc.processName);
            return 1;
        }
        NSFileManager *fm= [NSFileManager defaultManager];
        NSString *directory = args[1], *fileName = args[2];
        NSDirectoryEnumerator *dirEnum = [fm enumeratorAtPath:directory];
        NSString *path;
        BOOL isFile, finded = NO;
        while((path = [dirEnum nextObject]) != nil)
        {
            [fm fileExistsAtPath:path isDirectory:&isFile];
            if(!isFile && [[path lastPathComponent] isEqualToString:fileName])
            {
                NSLog(@"%@ finded", path);
                finded = YES;
                break;
            }
        }
        if(finded == NO)
        {
            NSLog(@"can't find %@ in %@", fileName, directory);
        }
    }
    return 0;
}


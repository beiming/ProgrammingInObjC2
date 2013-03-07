//
//  main.m
//  Exercise16All
//
//  Created by peixin liu on 3/6/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+TempFiles.h"

void exercise4();
void exercise5();
int exercise6();
int exercise7();
void exercise8();

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        //exercise4();
        //exercise5();
        //exercise6();
        //exercise7();
        exercise8();
    }
    return 0;
}

void exercise4()
{
    NSProcessInfo *proc = [NSProcessInfo processInfo];
    NSLog(@"\n%@ 's argument:\n%@", proc.processName, proc.arguments);
    NSLog(@"\n%@ 's environment:\n%@", proc.processName, proc.environment);
    
    NSLog(@"\ngloballyUniqueString:%@", proc.globallyUniqueString);
    NSLog(@"\nhostname:%@", proc.hostName);
    NSLog(@"\noperate System:%li", (unsigned long)proc.operatingSystem);
    NSLog(@"\noperate System Name:%@", proc.operatingSystemName);
    NSLog(@"\noperatingSystemVersionString:%@", proc.operatingSystemVersionString);
}

void exercise5()
{
    NSString *tempFile = [NSString temporaryFileName];
    NSLog(@"%@", tempFile);
}
#define READ_BUFFER_SIZE 100
int exercise6()
{
    NSString *inFileName = @"/Users/peixinLiu/Desktop/vim整理.txt", *outFileName = @"/Users/peixinLiu/Desktop/vim_tidy.txt";
    NSFileHandle *inFile, *outFile;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSData *buffer;
    
    inFile = [NSFileHandle fileHandleForReadingAtPath:inFileName];
    
    if(inFile == nil)
    {
        NSLog(@"open of %@ for reading failed.", inFileName);
        return 1;
    }
    
    if([fm fileExistsAtPath:outFileName] == NO)
    {
        [fm createFileAtPath:outFileName contents:nil attributes:nil];
        NSLog(@"create file %@.", outFileName);
    }
    
    outFile = [NSFileHandle fileHandleForWritingAtPath:outFileName];
    if(outFile == nil)
    {
        NSLog(@"open of %@ for writing failed.", inFileName);
        return 1;
    }
    [outFile truncateFileAtOffset:0];
    
    while((buffer = [inFile readDataOfLength:READ_BUFFER_SIZE]).length!= 0)
    {
        [outFile writeData:buffer];
    }
    [inFile closeFile];
    [outFile closeFile];
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *str = [NSString stringWithContentsOfFile:outFileName encoding:enc error:nil];
    NSLog(@"\n%@", str);
    return 0;
}

int exercise7()
{
    NSString *inFileName = @"/Users/peixinLiu/Desktop/vim_tidy.txt";
    NSFileHandle *inFile;
    NSData *buffer;
    inFile = [NSFileHandle fileHandleForReadingAtPath:inFileName];
    
    if(inFile == nil)
    {
        NSLog(@"open of %@ for reading failed.", inFileName);
        return 1;
    }
    
    id output = [NSFileHandle fileHandleWithStandardOutput];
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);

    while ((buffer = [inFile readDataOfLength:READ_BUFFER_SIZE]).length != 0)
    {
        NSString *str = [[NSString alloc] initWithData:buffer encoding:enc];
        buffer = [str dataUsingEncoding:NSUTF8StringEncoding];
        [str release];
        [output writeData:buffer];
    }
    [output closeFile];
    return 0;
}

void exercise8()
{
    NSString *path,*gitPath = @"/Users/peixinLiu/Dropbox/ObjectiveC/ProgrammingInObjC2/", *objDirName = @".git";
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnum = [fm enumeratorAtPath:gitPath];
    BOOL isDir;
    while ((path = [dirEnum nextObject]) != nil)
    {
        [fm fileExistsAtPath:[gitPath stringByAppendingPathComponent:path] isDirectory:&isDir];
        if(isDir && [path.lastPathComponent isEqualToString:objDirName])
        {
            BOOL removed = [fm removeItemAtPath:[gitPath stringByAppendingPathComponent:path] error:nil];
            printf("%i, %s\n", removed, [path UTF8String]);
        }
    }
}

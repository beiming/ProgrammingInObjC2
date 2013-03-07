//
//  main.m
//  Exercise5All
//
//  Created by 佩鑫 刘 on 11-12-11.
//  Copyright (c) 2011年 北京逍遥游网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSString.h>

void exercise1(void);
void exercise2(void);
void exercise3(void);
void exercise4(void);
void exercise5(void);
void exercise8(void);
void exercise9(void);
int main (int argc, const char * argv[])
{

    @autoreleasepool {
        //exercise1();
        //exercise2();
        //exercise3();
        //exercise4();
        exercise5();
    }
    return 0;
}

void exercise1(void)
{
    NSLog(@"Table of number and squared:");
    NSLog(@"\n+++---+++++");
    int i,n = 1;
    for (i = 0; i < 100; ++i, ++n)
    {
        //增加行距 -左对齐 默认右对齐
        NSLog(@"\n%-3i   %-5i", n, n*n);
    }
}

void exercise2(void)
{
    int i = 5;
    for(; i < 51; i += 5)
    {
        NSLog(@"%i 's triangularNumber is %i", i,i * (i + 1) / 2);
    }
}

void exercise3(void)
{
    int i, j, factorial;
    for(i = 1; i < 11; ++i)
    {
        factorial = 1;
        for(j = i; j > 0; --j)
        {
            factorial *= j;
        }
        NSLog(@"%i 's factorial is %i", i, factorial);
        
    }
}

void exercise4(void)
{
    int n, trianglarNumber = 0;
    NSLog(@"TABLE OF TRIANGLAR NUMBERS");
    NSLog(@" n SUM from 1 to n");
    NSLog(@"-- --------");
    
    for(n = 1; n <= 10; ++n)
    {
        trianglarNumber += n;
        NSLog(@"%-2i %i", n, trianglarNumber);
    }
}

void exercise5(void)
{
    int n, number, triangularNumber, counter, inputCounter;
    NSLog(@"How times do you want in put number:");
    scanf("%i", &inputCounter);
    for(counter = 1; counter  <= inputCounter; ++counter)
    {
        NSLog(@"What triangular nummber do you want?");
        scanf("%i", &number);
        triangularNumber = 0;
        for(n = 1; n <= number; ++n)
        {
            triangularNumber += n;
        }
        NSLog(@"Triangular number %i is %i", number, triangularNumber);
    }
}

void exercise8(void)
{
    int number;
    NSLog(@"abc");
    scanf("%i", &number);
    while (number > 0) {
        NSLog(@"ok");
        number %= 10;
        NSLog(@"%i", number);
    }
}

void exercise9(void)
{
    //don't need autorelease
    NSMutableString * str1 = [NSMutableString stringWithString:@"mutable string 1"];
    NSString *str2 = [NSString stringWithString:@"string 2"];
    NSString *str3 = @"string 3";
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSLog(@"str1 retainCount = %lu, str2 retainCount = %lu, str3 retainCount = %lu", [str1 retainCount], [str2 retainCount], [str3 retainCount]);
    [arr addObject:str1];
    [arr addObject:str2];
    [arr addObject:str3];
    NSLog(@"str1 retainCount = %lu, str2 retainCount = %lu, str3 retainCount = %lu", [str1 retainCount], [str2 retainCount], [str3 retainCount]);
    for (int i = 0; i < [arr count]; i++) {
        //NSLog(@"%s",[[arr objectAtIndex:i] cString]);
        NSLog(@"%@", [arr objectAtIndex:i]);
    }
    NSLog(@"%s","hello");
    [arr release];
    //也不可如此释放，因为str1不是alloc获得的，不拥有这个NSMutableString对象，无法释放，此NSMutableString对象已经自动autoRekeased
    //[str1 release];
}











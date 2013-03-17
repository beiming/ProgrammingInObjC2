//
//  main.m
//  Exercise19All
//
//  Created by peixin liu on 3/10/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressBook.h"
#import "AddressCard.h"

void exercise1();
void exercise2();
void exercise3();
void exercise4();
void exercise4_follow();

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        exercise1();
        //exercise2();
        //exercise3();
        //exercise4();
        //exercise4_follow();
    }
    return 0;
}
#define MAX_PRIME 50
NSArray* generatePrimeNumber()
{
    BOOL isPriem;
    NSMutableArray *primes = [[[NSMutableArray alloc] initWithCapacity:20] autorelease];
    [primes addObject:@2];
    [primes addObject:@3];
    
    for(int i = 5; i <= MAX_PRIME; i+=2)
    {
        isPriem = YES;
        int j = 1;
        int perPrime;
        do
        {
            perPrime = [primes[j] intValue];
            if(i % perPrime == 0)
            {
                isPriem = NO;
                break;
            }
            j++;
        }
        //如果一个数不是素数，那他一定能有<=其平方根的素数整除
        //perPrime <= sqrt(i)
        while (perPrime * perPrime <= i);
        if(isPriem)
        {
            [primes addObject:[NSNumber numberWithInt:i]];
        }
    }
    return  primes;
}

void exercise1()
{
    NSArray *primes = generatePrimeNumber();
    //NSLog(@"%@, count=%lu", primes, primes.count);
    NSString *savePath = [@"~/Desktop/primes.pl" stringByStandardizingPath];
    if([primes writeToFile:savePath atomically:YES] == YES)
    {
        NSLog(@"%@ saved", savePath);
    }
    else
    {
        NSLog(@"%@ not saved", savePath);

    }
}

void exercise2()
{
    NSString *savePath = [@"~/Desktop/primes.pl" stringByStandardizingPath];
    NSArray *primes = [[NSArray alloc] initWithContentsOfFile:savePath];
    if(primes)
    {
        NSLog(@"load array data form file:%@\n%@", savePath, primes);
    }
    else
    {
        NSLog(@"load array data form file:%@ error!", savePath);
    }
    [primes release];
}

void exercise3()
{
    NSString *savePath = [@"/Applications/Calendar.app/Contents/version.plist" stringByStandardizingPath];
    NSDictionary *history = [NSDictionary dictionaryWithContentsOfFile:savePath];
    if(history)
    {
        NSLog(@"load dicionary data form file:%@\n", savePath);
        for(NSString *key in history)
        {
            NSLog(@"%@ => %@", key, [history objectForKey:key]);
        }
    }
    else
    {
        NSLog(@"load dicionary data form file:%@ error!", savePath);
    }
}

void exercise4()
{
    NSString *savePath = [@"~/Desktop/AddressBook.arc" stringByStandardizingPath];
    
    AddressCard *card1 = [[AddressCard alloc] initWithName:@"name1" email:@"email1" city:@"city1"];
    //card2 不是alloc copy new 而来的，不需要release
    AddressCard *card2 = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:card1]];
    if(card2)
    {
        card2.name = @"name2";
        card2.email = @"email2";
        card2.city = @"city2";
    }
    
    AddressBook *book = [[AddressBook alloc] initWithBookName:@"mybook"];
    [book addCard:card1];
    [book addCard:card2];
    [book list];

//    AddressBook *book2 = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:book]];
//    [book2 lookup:@"name1"].name = @"card2_2";
//    [book list];
//    [book2 list];
    if([NSKeyedArchiver archiveRootObject:book toFile:savePath] == YES)
    {
        NSLog(@"%@, saved", savePath);
    }
    else
    {
        NSLog(@"%@, save failed", savePath);
    }
    
//    NSMutableData *dataArea = [[NSMutableData alloc] init];
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:dataArea];
//    [archiver encodeObject:book forKey:@"myBook1"];
//    [archiver encodeObject:book2 forKey:@"myBook2"];
//    [archiver finishEncoding];
    
    [card1 release];
    [book release];
}

void exercise4_follow()
{
    NSString *savePath = [@"~/Desktop/AddressBook.arc" stringByStandardizingPath];
    AddressBook *book = [NSKeyedUnarchiver unarchiveObjectWithFile:savePath];
    [book list];
    
    NSProcessInfo *proce = [NSProcessInfo processInfo];
    NSArray *args = [proce arguments];
    if(args.count != 3)
    {
        NSLog(@"Usage:%@ command argument", proce.processName);
        return;
    }
    NSString *command = args[1];
    NSString *argument = args[2];
    if([command isEqualToString: @"lookup"])
    {
        AddressCard *card = [book performSelector:@selector(lookup:) withObject:argument];
        if(card != nil)
        {
            [card print];
        }
        else
        {
            NSLog(@"card %@ not find.", argument);
        }

    }
    else if([command isEqualToString: @"list"])
    {
        [book performSelector:NSSelectorFromString(command)];
    }
}
//
//  main.m
//  Exercise17All
//
//  Created by peixin liu on 3/7/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "AddressCard.h"
#import "AddressBook.h"

void exercise1();
void exercise2();
void exercise3();
void exercise4();

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        //exercise1();
        //exercise2();
        //exercise3();
        exercise4();
    }
    return 0;
}

void exercise1()
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSMutableString *test = [[NSMutableString alloc] initWithString:@"test"];
    printf("before add to dictionary retainCount:%lu\n", test.retainCount);
    
    [dict setValue:test forKey:test];
    printf("added to dictionary retainCount:%lu\n", test.retainCount);
    
    [dict removeObjectForKey:test];
    printf("removed to dictionary retainCount:%lu\n", test.retainCount);
    
    [dict release];
    [test release];
}

void exercise2()
{
    //why initWithUTF8String reatinCount is 1 other is 0xffffffff ?
    NSString *test = [[NSString alloc] initWithUTF8String:"test"];
    NSString *otherStr = [[NSString alloc] initWithUTF8String:"otherString"];
    printf("init 2 string retainCount: %lu, %lu\n", test.retainCount, otherStr.retainCount);
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:test, nil];
    printf("added the first to an array retainCount: %lu, %lu\n", test.retainCount, otherStr.retainCount);
  
//    [array replaceObjectAtIndex:0 withObject:otherStr];    
    array[0] = otherStr;
    
    printf("replace the first to the second string in the array retainCount: %lu, %lu\n", test.retainCount, otherStr.retainCount);
    [test release];
    [otherStr release];
    [array release];
}

void exercise3()
{
    Fraction *frac1 = [[Fraction alloc] initWithNumberto:1 over:2];
    Fraction *frac2 = [[Fraction alloc] initWithNumberto:1 over:3];
    
    //the object that return is autorelease
    [[frac1 add:frac2] print];
    [frac1 release];
    [frac2 release];
}

void exercise4()
{
    AddressCard *card1 = [[AddressCard alloc] initWithName:@"name1" email:@"mail1" city:@"city1"];
    AddressCard *card2 = [[AddressCard alloc] initWithName:@"name2" email:@"mail2" city:@"city2"];
    
    AddressBook *book = [[AddressBook alloc] initWithBookName:@"book"];
    [book addCard:card1];
    [book addCard:card2];
    
    [card1 release];
    [card2 release];
    [book release];
}


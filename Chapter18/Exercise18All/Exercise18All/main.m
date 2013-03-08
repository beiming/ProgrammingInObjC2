//
//  main.m
//  Exercise18All
//
//  Created by peixin liu on 3/8/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"
#import "AddressBook.h"
#import "Rectangle.h"
#import "XYPoint.h"

void exercise1();
void exercise2();
void exercise3();

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        //exercise1();
        exercise2();
        //exercise3();
    }
    return 0;
}

void exercise1()
{
    AddressBook *book = [[AddressBook alloc] initWithBookName:@"book"];
    AddressCard *card1 = [[AddressCard alloc] initWithName:@"name1" email:@"email1" city:@"city1"];
    AddressCard *card2 = [[AddressCard alloc] initWithName:@"name2" email:@"email2" city:@"city2"];
    AddressCard *card3 = [[AddressCard alloc] initWithName:@"name3" email:@"email3" city:@"city3"];
    
    
    [book addCard:card1];
    [book addCard:card2];
    NSLog(@"book list");
    [book list];
    
    AddressBook *bookCopy = [book copy];
    NSLog(@"bookCopy list");
    [bookCopy list];
    
    [bookCopy addCard:card3];
    NSLog(@"after add card3 to bookCopy list");
    [bookCopy list];
    
    NSLog(@"book list");
    [book list];
    
    card1.name = @"lily";
    NSLog(@"after change card1'name, book");
    [book list];
    
    NSLog(@"bookCopy list");
    [bookCopy list];

    [book release];
    [bookCopy release];
    [card1 release];
    [card2 release];
    [card3 release];    
}

void exercise2()
{
    XYPoint *point1 = [[XYPoint alloc] init];
    point1.x = point1.y = 10;
    
    Rectangle *rect1 = [[Rectangle alloc] initWithWidth:3 andHeight:3];
    rect1.origin = point1;
    
    
    Rectangle *rect2 = [rect1 copy];
    
    point1.x = 100;
    NSLog(@"change point1.x = 100 info:");
    [point1 print];
    NSLog(@"rect1' info:");
    [rect1 print];
    
    rect2.origin.y = 100;
    NSLog(@"rect2' info:");
    [rect2 print];
    
    printf("\npoint1.retainCount:%lu, rect1.origin.retainCount:%lu, rect2.origin.retainCount:%lu\n\n", point1.retainCount, rect1.origin.retainCount, rect2.origin.retainCount);
    
    [point1 release];
    [rect1 release];
    [rect2 release];
}

void exercise3()
{
    NSMutableString *str1 = [[NSMutableString alloc] initWithString:@"str1"];
    NSMutableString *str2 = [[NSMutableString alloc] initWithString:@"str2"];
    NSMutableString *str3 = [[NSMutableString alloc] initWithString:@"str3"];

    NSDictionary *dict = @{@"key1":str1, @"ke2":str2};
    NSDictionary *dictCopy = [dict copy];
    NSMutableDictionary *dictMutableCopy = [dict mutableCopy];
    
    NSLog(@"dict: %@",dict);
    
    //can't do this
//    [dictCopy setValue:str3 forKey:@"key3"];
    NSLog(@"dictCopy: %@",dict);

    dictMutableCopy[@"key3"] = str3;
//    [dictMutableCopy setValue:str3 forKey:@"key3"];
    NSLog(@"dictMutableCopy: %@",dictMutableCopy);
    
    NSLog(@"dict: %@",dict);

    [str1 release];
    [str2 release];
    [str3 release];
    [dictCopy release];
    [dictMutableCopy release];
}


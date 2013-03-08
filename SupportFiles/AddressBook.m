//
//  AddressBook.m
//  Exercise15All
//
//  Created by peixin liu on 3/1/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//
#import "AddressBook.h"
@implementation AddressBook
-(id)initWithBookName:(NSString *)name
{
    self = [super init];
    if(self)
    {
        _bookName = [[NSString alloc] initWithString:name];
        _books = [[NSMutableArray alloc] init];
        if(cardProperty == nil)
        {
            cardProperty = [[NSSet alloc] initWithObjects:@"name", @"email", @"city", nil];
        }
    }
    return self;
}

-(void)addCard:(AddressCard *)theCard
{
    [self.books addObject:theCard];
}
-(void)removeCard:(AddressCard *)theCard
{
    [self.books removeObject:theCard];
}
-(BOOL)removeName:(NSString *)theName
{
    for(AddressCard *card in self.books)
    {
        //if([card.name caseInsensitiveCompare:theName] == NSOrderedSame)
        if([card.name rangeOfString:theName options:NSCaseInsensitiveSearch].location != NSNotFound)
        {
            [self removeCard:card];
            return YES;
        }
    }
    return NO;
}
-(int)entries
{
    return (int)[self.books count];
}
-(void)list
{
    printf("========== Contents of: %s total:%i ==========\n", [self.bookName UTF8String], [self entries]);
    for(AddressCard *card in self.books)
    {
        for(NSString *key in cardProperty)
        {
            printf("%s\t", [[card valueForKey:key] UTF8String]);
        }
        printf("\n");
        //printf("%-20s %-32s\n", [card.name UTF8String], [card.email UTF8String]);
    }
    printf("============================================================\n");
}
-(void)sort
{
    [self.books sortUsingSelector:@selector(compareNames:)];
}
-(AddressCard *)lookup:(NSString *)theName
{
    for(AddressCard *card in self.books)
    {
        //NSRange range = [card.name rangeOfString:theName options:NSCaseInsensitiveSearch];
        if([card.name rangeOfString:theName options:NSCaseInsensitiveSearch].location != NSNotFound)
        {
            return card;
        }
    }
    return nil;
}
-(NSArray *)lookupFromEmail:(NSString *)theEmail
{
    NSMutableArray *filtered = [[NSMutableArray alloc] init];
    for(AddressCard *card in self.books)
    {
        if([card.email rangeOfString:theEmail options:NSCaseInsensitiveSearch].location != NSNotFound)
        {
            [filtered addObject:card];
        }
    }
    if([filtered count] > 0)
    {
        NSArray *result = [[[NSArray alloc] initWithArray:filtered] autorelease];
        //NSArray *result = [NSArray arrayWithArray:filtered];
        //NSArray *result = [[filtered copy] autorelease];

        [filtered release];
        return result;
    }
    else
    {
        [filtered release];
        return nil;
    }
}
- (void)dealloc
{
    NSLog(@"address book %@ dealloc", _bookName);
    [_bookName release];
    [_books release];
    [super dealloc];
}
-(id)copyWithZone:(NSZone *)zone
{
    AddressBook *book = [[[self class] allocWithZone:zone] init];
    //此处不可使用copy，因为这俩property本来就是copy的，多copy一次造成内存泄漏
//    book.bookName = [self.bookName copy];
//    book.books = [self.books mutableCopy];
    //但也不能对books直接付值，这样books会变成NSArray，我们需要的是NSMutableArray
//    book.bookName = self.bookName;
//    book.books = self.books;
    //所以只能自己付值解决
    book.bookName = self.bookName;
    for(AddressCard *card in self.books)
    {
        [book addCard:card];
    }
    return book;
}
@end

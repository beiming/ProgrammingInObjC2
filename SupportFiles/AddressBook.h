//
//  AddressBook.h
//  Exercise15All
//
//  Created by peixin liu on 3/1/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"
static NSSet *cardProperty = nil;

@interface AddressBook : NSObject <NSCopying, NSCoding>
{
}
@property(copy, nonatomic) NSString * bookName;
@property(copy, nonatomic) NSMutableArray *books;
+(void)initcardProperty;
-(id)initWithBookName:(NSString *)name;

-(void)addCard:(AddressCard *) theCard;
-(void)removeCard:(AddressCard *) theCard;
-(BOOL)removeName:(NSString *) theName;

-(int)entries;
-(void)list;
-(void)sort;

-(AddressCard *)lookup:(NSString *)theName;
-(NSArray *)lookupFromEmail:(NSString *)theEmail;

-(void)dealloc;

-(id)copyWithZone:(NSZone *)zone;

-(void)encodeWithCoder:(NSCoder *)aCoder;
-(id)initWithCoder:(NSCoder *)aDecoder;
@end

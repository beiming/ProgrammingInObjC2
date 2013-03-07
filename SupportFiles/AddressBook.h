//
//  AddressBook.h
//  Exercise15All
//
//  Created by peixin liu on 3/1/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

@interface AddressBook : NSObject
{
    @private
    NSMutableArray *books;
    NSSet *cardProperty;
}
@property(copy, nonatomic) NSString * bookName;
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
@end

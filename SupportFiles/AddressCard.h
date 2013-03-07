//
//  AddressCard.h
//  Exercise15All
//
//  Created by peixin liu on 3/1/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject
@property(copy, nonatomic) NSString *name, *state, *email, *city;
-(id)initWithName:(NSString *) n email:(NSString *) e city:(NSString *)c;
-(void)print;
-(BOOL)isEqual:(AddressCard *)theCard;
-(NSComparisonResult)compareNames:(AddressCard *) theCard;
-(void)dealloc;
@end

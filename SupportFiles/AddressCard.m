//
//  AddressCard.m
//  Exercise15All
//
//  Created by peixin liu on 3/1/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import "AddressCard.h"
#import <stdio.h>

@implementation AddressCard
@synthesize name, email, state, city;
-(id)initWithName:(NSString *)n email:(NSString *)e city:(NSString *)c
{
    self = [super init];
    if(self)
    {
        self.name = n;
        self.email = e;
        self.city = c;
    }
    return self;
}
-(void)dealloc
{
    [name release];
    [email release];
    [city release];
    [super dealloc];
}
-(void)print
{
    printf("=================================\n");
    printf("|                               |\n");
    printf("| %-30s|\n", [self.name UTF8String]);
    printf("| %-30s|\n", [self.email UTF8String]);
    printf("| %-30s|\n", [self.city UTF8String]);
    printf("|                               |\n");
    printf("|                               |\n");
    printf("|                               |\n");
    printf("|      O                O       |\n");
    printf("=================================\n");
}
-(BOOL)isEqual:(AddressCard *)theCard
{
    return [self.name isEqualToString:theCard.name] == YES && [self.email isEqualToString:theCard.email] == YES;
}
-(NSComparisonResult)compareNames:(AddressCard *)theCard
{
//    NSLog(@"%@ --- %@, %ld", self.name, theCard.name, [self.name compare:theCard.name]);
    return [self.name compare:theCard.name];
}
@end

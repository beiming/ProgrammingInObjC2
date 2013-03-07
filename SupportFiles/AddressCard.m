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
-(id)initWithName:(NSString *)n email:(NSString *)e city:(NSString *)c
{
    self = [super init];
    if(self)
    {
        _name = [[NSString alloc] initWithString:n];
        _email = [[NSString alloc] initWithString:e];
        _city = [[NSString alloc] initWithString:c];
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"address card %@ dealloc", self.name);
    [_name release];
    [_email release];
    [_city release];
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

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
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:@"AddressCardName"];
    [aCoder encodeObject:_email forKey:@"AddressCardEmail"];
    [aCoder encodeObject:_city forKey:@"AddressCardCity"];

}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    //这里我理解的是，adecode会去申请一块内存，retaincount ＝ 1， 会被自动回收，所以为了防止其自动回收，retain一次，故我觉得copy也行
    //这里不要用self.xxx 会有内存泄漏 retain了一次，因为name是copy的，所以会被copy一次。 retain属性也会造成内存泄漏
    _name = [[aDecoder decodeObjectForKey:@"AddressCardName"] retain];
    _email = [[aDecoder decodeObjectForKey:@"AddressCardEmail"] retain];
    _city = [[aDecoder decodeObjectForKey:@"AddressCardCity"] retain];
    return  self;
}
@end

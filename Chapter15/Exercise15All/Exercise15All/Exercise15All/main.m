//
//  main.m
//  Exercise15All
//
//  Created by peixin liu on 2/28/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSCalendarDate+ElapsedDays.h"
#import "AddressBook.h"
#import "AddressCard.h"
#import "Fraction.h"
#import "Fraction+Comparison.h"
#import "Song.h"
#import "PlayList.h"
#import "MusicCollection.h"
#import "TestSelfPropertyWithSong.h"

void exercise1();
void exercise2();
void exercise3();
void exercise6();
void exercise7();
void exercise8();
void exercise9();
void exercise10();
void exercise11();
void exercise12();
void exercise13();
void exercise14();
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //exercise1();
        //exercise2();
        //exercise3();
        //exercise6();
        //exercise7();
        //exercise8();
        //exercise9();
        //exercise10();
        //exercise11();
        //exercise12();
        //exercise13();
        exercise14();
    }
    return 0;
}

void exercise1()
{
    NSCalendarDate *calendarDate1 = [[NSCalendarDate alloc] initWithString:@"2013-3-1" calendarFormat:@"%Y-%m-%d"];
    NSCalendarDate *calendarDate2 = [[NSCalendarDate alloc] initWithYear:2012 month:2 day:1 hour:20 minute:0 second:0 timeZone:nil];
    NSLog(@"The elapsed days of two calendar is:%lu", [calendarDate1 numberOfElapsedDays:calendarDate2]);
    
    [calendarDate1 release];
    [calendarDate2 release];
    
    int residueDays = 180 - 8;
    NSCalendarDate *ieltsDate = [[NSCalendarDate alloc] initWithString:@"2013-3-2" calendarFormat:@"%Y-%m-%d"];

    NSLog(@"%@ to %@", [ieltsDate description], [ieltsDate dateByAddingYears:0 months:0 days:residueDays hours:0 minutes:0 seconds:0]);
    
    [ieltsDate release];
}

void exercise2()
{
    AddressBook *addressBook = [[AddressBook alloc] initWithBookName:@"Fengyi's Contacts"];
    AddressCard *card1 = [[AddressCard alloc] initWithName:@"Steven Jobs" email:@"steven@me.com" city:@"NewYork"];
    AddressCard *card2 = [[AddressCard alloc] initWithName:@"Peixin Liu" email:@"fengyi.mail@gmail.com" city:@"Shannxi"];
    AddressCard *card3 = [[AddressCard alloc] initWithName:@"Marychia" email:@"marychia@outlook.com" city:@"Beijing"];

    [addressBook addCard:card2];
    [addressBook addCard:card3];
    [addressBook addCard:card1];

    
    [addressBook list];
    
    AddressCard *findCard = [addressBook lookup:@"steve"];
    [findCard print];
    
    [addressBook sort];
    
    [addressBook list];
    
    [card1 release];
    [card2 release];
    [card3 release];
    [addressBook release];
}

void exercise3()
{
    AddressBook *addressBook = [[AddressBook alloc] initWithBookName:@"Fengyi's Contacts"];
    AddressCard *card1 = [[AddressCard alloc] initWithName:@"Steven Jobs" email:@"steven@me.com" city:@"NewYork"];
    AddressCard *card2 = [[AddressCard alloc] initWithName:@"Peixin Liu" email:@"fengyi.mail@gmail.com" city:@"Shannxi"];
    AddressCard *card3 = [[AddressCard alloc] initWithName:@"Marychia" email:@"marychia@outlook.com" city:@"Beijing"];
    
    [addressBook addCard:card2];
    [addressBook addCard:card3];
    [addressBook addCard:card1];
    
        
    NSArray *finded = [addressBook lookupFromEmail:@"."];
    //if array is nil, the count also is 0
    //because finded is autorelease so don't need to manual release it. if arr is nil it's ok. else it will be crash.
    NSLog(@"%lu, %lu", [finded count], (unsigned long)[finded retainCount]);
    //for(id card in finded)
    for(AddressCard *card in finded)
    {
        [card print];
    }
    //because finded is autorelease so don't need to manual release it. if arr is nil it's ok. else it will be crash.
    //[finded release];
    [card1 release];
    [card2 release];
    [card3 release];
    [addressBook release];
}

void exercise6()
{
    AddressBook *addressBook = [[AddressBook alloc] initWithBookName:@"Fengyi's Contacts"];
    AddressCard *card1 = [[AddressCard alloc] initWithName:@"Steven Jobs" email:@"steven@me.com" city:@"NewYork"];
    AddressCard *card2 = [[AddressCard alloc] initWithName:@"Peixin Liu" email:@"fengyi.mail@gmail.com" city:@"Shannxi"];
    AddressCard *card3 = [[AddressCard alloc] initWithName:@"Marychia" email:@"marychia@outlook.com" city:@"Beijing"];
    
    [addressBook addCard:card2];
    [addressBook addCard:card3];
    [addressBook addCard:card1];
    
    
    [addressBook list];
    [addressBook removeName:@"Steve"];    
    
    [addressBook list];
    
    [card1 release];
    [card2 release];
    [card3 release];
    [addressBook release];
}

void exercise7()
{
    Fraction *frac1 = [[Fraction alloc] initWithNumberto:1 over:2];
    Fraction *frac2 = [[Fraction alloc] initWithNumberto:2 over:2];
    Fraction *frac3 = [[Fraction alloc] initWithNumberto:3 over:2];

    NSArray *array = [[NSArray alloc] initWithObjects:frac1, frac2, frac3, nil];
    Fraction *sum = nil;
    for(Fraction *frac in array)
    {
        if(sum == nil)
        {
            sum = frac;
        }
        else
        {
            sum = [sum add:frac];
        }
    }
    
    [sum print];
    [frac1 release];
    [frac2 release];
    [frac3 release];
    [array release];
}

void exercise8()
{
    Fraction *frac1 = [[Fraction alloc] initWithNumberto:1 over:2];
    Fraction *frac2 = [[Fraction alloc] initWithNumberto:1 over:3];
    Fraction *frac3 = [[Fraction alloc] initWithNumberto:1 over:1];
    Fraction *frac4 = [[Fraction alloc] initWithNumberto:1 over:5];
    Fraction *frac5 = [[Fraction alloc] initWithNumberto:8 over:6];
    Fraction *frac6 = [[Fraction alloc] initWithNumberto:10 over:3];
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:frac1, frac2, frac3, frac4, frac5, frac6, nil];
    
    for(Fraction *frac in array)
    {
        [frac print];
    }
    
    [array sortUsingSelector:@selector(comparison:)];
    
    NSLog(@"after sort:");
    for(Fraction *frac in array)
    {
        [frac print];
    }

    [array release];
    [frac1 release];
    [frac2 release];
    [frac3 release];
    [frac4 release];
    [frac5 release];
    [frac6 release];
}

void exercise9()
{
    Song *song1 = [[Song alloc] initWithName:@"Song1" artist:@"atrlist1" album:@"album1" time:60];
    Song *song2 = [[Song alloc] initWithName:@"Song2" artist:@"atrlist1" album:@"album1" time:59];
    Song *song3 = [[Song alloc] initWithName:@"Song3" artist:@"atrlist2" album:@"album1" time:180];
    Song *song4 = [[Song alloc] initWithName:@"Song4" artist:@"atrlist3" album:@"album1" time:80];
    Song *song5 = [[Song alloc] initWithName:@"Song5" artist:@"atrlist4" album:@"album1" time:20];
    Song *song6 = [[Song alloc] initWithName:@"Song6" artist:@"atrlist2" album:@"album1" time:130];

    PlayList *playList1 = [[PlayList alloc] initWithName:@"playList1" andSongs:song2, song1, song4, song3, nil];
    PlayList *playList2 = [[PlayList alloc] initWithName:@"playList2" andSongs:song2, song1, song4, song3, nil];
    PlayList *playList3 = [[PlayList alloc] initWithName:@"playList3" andSongs:song2, song1, song4, song3, nil];
    
    MusicCollection *collection = [[MusicCollection alloc] initWithPlayList:playList1, playList2, playList3, nil];
    
    [collection printLibrary];
    
    
    NSLog(@"add song %@ to collection", song5.name);
    [collection addSong:song5 toPlayList:playList1];
    
    NSLog(@"add song %@ to collection", song6.name);
    [collection addSong:song6 toPlayList:playList2];

    [collection printLibrary];
    
    NSLog(@"remove song %@ from library", song1.name);
    [collection removeSongFromLibrary:song1];
    
    [collection printLibrary];
    
    [song1 release];
    [song2 release];
    [song3 release];
    [song4 release];
    [song5 release];
    [song6 release];

    [playList1 release];
    [playList2 release];
    [playList3 release];

    [collection release];
}

#define RANDOM100 (arc4random() % 100 + 1)
void exercise10()
{
    int arrayLen = 100;
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:arrayLen];
    for(int i = 0; i < arrayLen; i += 1)
    {
        [array addObject:[NSNumber numberWithInt:RANDOM100]];
    }
    
    NSCountedSet *countSet = [[NSCountedSet alloc] init];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for(NSNumber *number in array)
    {
        [countSet addObject:number];
        
        //if([dictionary objectForKey:[number stringValue]])
        if(dictionary[[number stringValue]])
        {
            //[dictionary setValue:@([[dictionary objectForKey:[number stringValue]] intValue] + 1) forKey:[number stringValue]];
            dictionary[[number stringValue]] = @([dictionary[[number stringValue]] intValue] + 1);
        }
        else
        {
            [dictionary setValue:@1 forKey:[number stringValue]];
        }
    }
    NSLog(@"%@", [dictionary description]);
    
    for(NSNumber *number in countSet)
    {
        printf("%-4i probability:%li%%\n", [number intValue], (unsigned long)[countSet countForObject:number]);
    }
    [array release];
    [countSet release];
    [dictionary release];
}

void exercise11()
{
    Song *song = [[Song alloc] initWithName:@"Song1" artist:@"atrlist1" album:@"album1" time:60];
    NSLog(@"%@", song.name);
    NSLog(@"%@", [song name]);

    NSMutableArray *array = [[NSMutableArray alloc] init];
    array[0] = song;
    array[1] = song;
    printf("%lu\n", [song retainCount]);
    [array release];
    printf("%lu\n", [song retainCount]);
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    //when the key is overwrite is will release the old value
    dict[@"key"] = song;
    dict[@"key"] = song;
    printf("%lu\n", [song retainCount]);

    [dict release];
    printf("%lu\n", [song retainCount]);

    [song release];
}

void exercise12()
{
    NSString *songName = [[NSString alloc] initWithUTF8String:"中国人"];
    printf("songname %lu\n", songName.retainCount);

    Song *song = [[Song alloc] initWithName:songName artist:@"atrlist1" album:@"album1" time:60];
    printf("songname %lu\n", songName.retainCount);

    printf("%lu\n", song.retainCount);

    TestSelfPropertyWithSong *testSong = [[TestSelfPropertyWithSong alloc] initWithSong:song];
//    TestSelfPropertyWithSong *testSong = [[TestSelfPropertyWithSong alloc] initWithDefaultSong];

//    testSong.testSong = song;
    
    [songName release];

    printf("%s, %lu\n", [song.name UTF8String], song.name.retainCount);
    [song release];
    [testSong release];
    
    }

void exercise13()
{
    NSString *str1 = [[NSString alloc] initWithUTF8String:"hehe"];
    NSString *str2 = [[NSString alloc] initWithString:@"hehe"];
    printf("string1 %lu\n", str1.retainCount);
    printf("string2 %lx\n", str2.retainCount);
    
    //如此定义输入，会自动autorelrase
    NSArray *array = @[str1, str2];
    printf("array %lu\n", array.retainCount);
    printf("string1 %lu\n", str1.retainCount);
    printf("string2 %lx\n", str2.retainCount);
    
    [str1 release];
    [str2 release];
    //[array release];

}

void exercise14()
{
    Song *song = [[Song alloc] initWithName:@"song1" artist:@"atrlist1" album:@"album1" time:60];
    printf("song retain count: %lu\n", song.retainCount);

    TestSelfPropertyWithSong *testSong = [[TestSelfPropertyWithSong alloc] initWithSong:song];

    printf("song retain count: %lu\n", song.retainCount);
    //    //property为retain，get 不会retain
    Song *song2 = testSong.testSong;
    printf("song retain count: %lu\n", song.retainCount);
    printf("song2 retain count %lu\n", song2.retainCount);

    [song release];
    [testSong release];
}

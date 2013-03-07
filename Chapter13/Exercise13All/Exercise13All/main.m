//
//  main.m
//  Exercise13All
//
//  Created by peixin liu on 1/27/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "MyDate.h"

void exercise1();
void exercise2();
void exercise4();
void exercise4_2();
float averageOfFloatArray(float *, int);
void exercise5();
void exercise6();
void exercise7();
void exercise8(int argc, const char * argv[]);
void exercise9();

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        //exercise1();
        //exercise2();
        //exercise4();
        //exercise4_2();
        //exercise5();
        //exercise6();
        //exercise7();
        exercise8(argc, argv);
        //exercise9();
    }
    return 0;
}

void exercise1()
{
    float numbers[10] = {1.1, 2.2 ,3.3 ,4.4 ,5.5 ,6.6 ,7.7 ,8.8 ,9.9, 10.10};
    float average = averageOfFloatArray(numbers, sizeof(numbers) / sizeof(float));
    NSLog(@"%f", average);
}

float averageOfFloatArray(float *arr, int len)
{
    float *end, *pointer = arr, sum = 0;
    end = pointer + len;
    while (pointer < end)
    {
        sum += *pointer;
        pointer++;
    }
    return sum / len;
}

void exercise2()
{
    //static function for class is not a good choice
    Fraction *frac = [[Fraction alloc] initWithNumberto:13 over:44];
    [frac print:NO];
    [frac reduce];
    [frac print];
    [frac release];
}

void exercise4()
{
    Fraction *fracs[3];
    Fraction *temp, *result = [[Fraction alloc] init];
    Fraction **pFrac, **end;
    end = fracs + 3;
    
    for(int i =0 ; i < 3; i++)
    {
        fracs[i] = [[Fraction alloc] initWithNumberto:i+1 over:2];
    }
    [result setTo:fracs[0].numerator over:fracs[0].donominator];
    for(pFrac = fracs + 1; pFrac < end; pFrac++)
    {
        [*pFrac print];
        temp = [result add:*pFrac];
        [result setTo:temp.numerator over:temp.donominator];
    }
    [result print];
    for(pFrac = fracs; pFrac < end; pFrac++)
    {
        [*pFrac release];
    }
    [result release];
}

void exercise4_2()
{
    Fraction *fracs[3];
    for(int i = 0; i < 3; i++)
    {
        fracs[i] = [[Fraction alloc] initWithNumberto:i+1 over:2];
    }

    Fraction *result = nil;
    result = fracs[0];
    for(int i = 1; i < 3; i++)
    {
        result = [result add:fracs[i]];
    }

    for(int i = 0; i < 3; i++)
    {
        [fracs[i] release];
    }

    [result print];
}

void exercise5()
{
    NSString *dateFormat = @"%02i-%02i-%4i";
    /*struct Date
    {
        int day;
        int month;
        int year;
    } date1={02,27,2013};
    struct Date date2;
    date2.day = 27;
    date2.month = 8;
    date2.year = 2013;*/
    typedef struct {int day, month, year;} Date;
    Date *date1 = NULL, date2={27,8,2013};
    date1 = &date2;
    date1->year = 2013;
    date1->month = 12;
    date1->day = 12;
    NSLog(dateFormat, date1->day, date1->month, date1->year);
    NSLog(dateFormat, date2.day, date2.month, date2.year);

}

void exercise6()
{
    MyDate *date = [[MyDate alloc] initWithDate:12 month:1 year:2013];
    //[date dateUpdate:2 month:9 year:2009];
    [date print];
}

void exercise7()
{
    char *message = "Programming in Objective-C is fun";
    char message2[] = "You said it";// \0 is the last char
    
    /*** set 1 ***/
    NSLog(@"Programming in Objective-C is fun");
    NSLog(@"%s", "Programming in Objective-C is fun");
    NSLog(@"%s", message);
    
    /*** set 2 ***/
    NSLog(@"You said it");
    NSLog(@"%s", message2);
    NSLog(@"%s", &message2[0]);//the index 0's address is an pointer
    
    /*** set 3 ***/
    NSLog(@"said it");
    NSLog(@"%s", message2 + 4);
    NSLog(@"%s", &message2[4]);
}

void exercise8(int argc, const char **argv)
{
    const char **pointer = argv;
    const char **end = argv + argc;
    NSLog(@"parameter number:%i", argc);
    while (pointer < end)
    {
        NSLog(@"parameter: %s", *pointer);
        pointer++;
    }
}

void exercise9()
{
    NSLog(@"This is a test");
    //Incompatible pointer types passing 'char [15]' to parameter of type 'NSString *'
    //NSLog("This is a test");
    
    NSLog(@"%s", "This is a test");
    //Format specifies type 'char *' but the argument has type 'NSString *'
    //NSLog(@"%s", @"This is a test");//can run
    
    //Inconpatibel poiter types passint 'char [3]' to parameter of type 'NSString *'
    //NSLog("%s", "This is a test");//can run mess code
    //NSLog("%s", @"This is a test");
    
    NSLog(@"%@", @"This is a test");
    //Format specifies type 'id' but the argument has type 'char *'
    //NSLog(@"%@", "This is a test");

}
//
//  main.m
//  Exercise12All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
//compare
#define MY_MIN(a, b) (a) < (b) ? (a) : (b)
#define MAX3(a, b, c) MAX(c, MAX(a, b))
//character 
#define IS_UPPER_CASE(char) ((char) >= 'A') && ((char) <= 'Z')
#define IS_LOWER_CASE(char) ((char) >= 'a') && ((char) <= 'z')
#define IS_ALPHABETIC(char) IS_UPPER_CASE(char) || IS_LOWER_CASE(char)
#define IS_DIGIT(char) ((char) >= '0') && ((char) <= '9')
#define IS_SPECIAL(char) !(IS_ALPHABETIC(char) || IS_DIGIT(char))
//number
#define ABSOLUTE_VALUE(x) (x) < 0 ? -(x) : (x)

#define printint(n) printf(# n " is %i\n", n)//#n = "n" 字符串
#define printx(n) printint(0x ## n)//##连接符号，因为只是文字替换，所以如果传递近来变量i，而非常数，会报告找不到0xi

void exercise2();
void exercise3();
void exercise4();
void exercise5();
void exercise6();
void exercise7();
void exercise8();

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        //exercise2();
        //exercise3();
        //exercise4();
        //exercise5();
        //exercise6();
        //exercise7();
        exercise8();
    }
    return 0;
}

void exercise2()
{
    int a = 5, b = 6;
    NSLog(@"%i and %i the smaller is %i", a+b, a-b, MY_MIN(a+b, a-b));
    NSLog(@"%i and %i the smaller is %i", a+b, a-b, MIN(a+b, a-b));

}

void exercise3()
{
    int a = -7, b = 12, c = 100;
    NSLog(@"%i ,%i and %i the biggest is %i", a, b, c, MAX3(a, b, c));

}

void exercise4()
{
    char input = 'A';
    while(input != 'e')
    {
        scanf("%s", &input);//如果是%c，则输入流里的回车会被当作第二个char直接从流里读取
        NSLog(@"Is upper case ? %c -> %i", input, IS_UPPER_CASE(input));
    }
}

void exercise5()
{
    char input = 'A';
    while(scanf("%s", &input), input != 'e')
    {
        NSLog(@"Is alphabetic ? %c -> %i", input, IS_ALPHABETIC(input));
    }
}

void exercise6()
{
    char input = 'A';
    while(scanf("%s", &input), input != 'e')
    {
        NSLog(@"Is special ? %c -> %i", input, IS_SPECIAL(input));
    }
}

void exercise7()
{
    int input = 0;
    while(scanf("%i", &input), input != 999)
    {
        NSLog(@"%i 's absolute is %i", input - 100, ABSOLUTE_VALUE(input - 100));
    }
}

void exercise8()
{
    for(int i = 1; i <= 100; ++i)
    {
        //printx(i);
        printx(100);
    }
}
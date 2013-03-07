//
//  main.m
//  Exercise8All
//
//  Created by 佩鑫 刘 on 7/20/12.
//  Copyright (c) 2012 edu.self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassC.h"
#import "ClassB2.h"
#import "Rectangle.h"
#import "XYPoint.h"
#import "Circle.h"
#import "Triangle.h"

void exercise1();
void exercise2();
void exercise3();
void exercise4();
void exercise5();
void exercise6();
void exercise7();
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        //exercise1();
        //exercise2();
        //exercise3();
        //exercise4();
        //exercise5();
        exercise6();
        //exercise7();
    }
    return 0;
}


void exercise1()
{
    ClassA *a = [[ClassA alloc] init];
    ClassB *b = [[ClassB alloc] init];
    ClassC *c = [[ClassC alloc] init];
    [a initVar];
    [a release];
    
    [b initVar];
    [b printVar];
    [b release];

    [c initVar];
    [c printVar];
    [c release];

}

void exercise2()
{
    XYPoint *point = [[XYPoint alloc] init];
    [point setX:10 andY:10];
    Rectangle * rect = [[Rectangle alloc] init];
    [rect setWidth:20 andHeight:30];
    [rect setOrigin:point];
    [rect print];
    [rect release];
    [point release];
}

void exercise3()
{
    NSLog(@"%@'s superClass is %@", [ClassB2 class], [ClassB2 superclass]);
    NSLog(@"%@'s superClass is %@", [ClassB class], [ClassB superclass]);
    NSLog(@"%i", [ClassB2 isSubclassOfClass:[ClassA class]]);
    NSLog(@"ClassB 和 ClassB2 之间是同级关系，他们都是 ClassA 的子类。");
    NSLog(@"ClassB 的超类是 ClassA。");
    NSLog(@"ClassB2 的超类是 ClassA。");
    NSLog(@"一个类可以有无数个子类，但只能有一个父类。");
}

void exercise4()
{
    XYPoint *point1 = [[XYPoint alloc] init];
    XYPoint *point2 = [[XYPoint alloc] init];
    [point1 setX:10 andY:20];
    [point2 setX:20 andY:20];
    
    Rectangle *rect = [[Rectangle alloc] init];
    [rect setWidth:100 andHeight:100];
    rect.origin = point1;
    [rect print];
    [rect translate:point2];
    [rect print];
    
    [rect release];
    [point1 release];
    [point2 release];
}

void exercise5()
{
    XYPoint *point = [[XYPoint alloc] init];
    [point setX:10 andY:10];
    Rectangle * rect = [[Rectangle alloc] init];
    [rect setWidth:20 andHeight:30];
    [rect setOrigin:point];
    [rect print];
    rect.filled = YES;
    rect.fillColor = 0xffffff;
    rect.lineColor = 0xff0000;
    [rect test];
    [rect release];
    [point release];
    
    Circle *circle = [[Circle alloc] init];
    circle.radius = 10;
    [circle print];
    [circle release];
    
    Triangle *triangle = [[Triangle alloc] init];
    triangle.a = triangle.b = triangle.c = 10;
    [triangle print];
    [triangle release];
}

void exercise6()
{    
    Rectangle *rect1 = [[Rectangle alloc] init];
    [rect1 setX:0 y:5 width:20 height:5];
    
    Rectangle *rect2 = [[Rectangle alloc] init];
    [rect2 setX:5 y:0 width:2 height:30];
    
    Rectangle *rect3 = [rect1 intersect:rect2];
    
    [rect1 printRectangle];
    [rect2 printRectangle];
    
    [rect1 release];
    [rect2 release];
    rect3 = nil;
}

#define BLANK " "
#define VERTICAL "|"
#define HORIZONTAL "-"
#define NEWLINE "\n"
void exercise7()
{
    Rectangle *rect = [[Rectangle alloc] init];
    [rect setX:2 y:2 width:6 height:8];

    int startx = ceil(rect.origin.x);
    int starty = ceil(rect.origin.y);
    int x = ceil(rect.width) + startx;
    int y = ceil(rect.height) + starty;
    
    for(int i = 0; i <= y; ++i)
    {
        for(int j = 0; j <= x; ++j)
        {
            if(i < starty)
            {
                printf(BLANK);
            }
            else if(i == starty || i == y)
            {
                if(j < startx)
                {
                    printf(BLANK);
                }
                else
                {
                    printf(HORIZONTAL);
                }
            }
            else 
            {
                if(j < startx)
                {
                    printf(BLANK);
                }
                else if(j == startx || j == x)
                {
                    printf(VERTICAL);
                }
                else 
                {
                    printf(BLANK);
                }
            }
        }
        printf(NEWLINE);
    }
    [rect release];
}
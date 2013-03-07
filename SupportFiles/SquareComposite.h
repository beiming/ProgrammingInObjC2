//
//  SquareComposite.h
//  Exercise11All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
@interface SquareComposite : NSObject
{
    Rectangle *rect;
}
@property(nonatomic, assign) Rectangle *rect;
-(SquareComposite *) initWithSide:(int) s;
-(float) area;
-(float) perimeter;
-(void) dealloc;//override to release the Rectangle object's memory
@end

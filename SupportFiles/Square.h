//
//  Square.h
//  Exercise10All
//
//  Created by peixin liu on 7/31/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import "Rectangle.h"

@interface Square : Rectangle
{
    float side;
}
@property (nonatomic, assign) float side;
-(id)initWithSide:(float)sideParameter;
-(void)setSide:(float)side;
@end

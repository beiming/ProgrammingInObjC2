//
//  Circle.h
//  Exercise8All
//
//  Created by 佩鑫 刘 on 7/24/12.
//  Copyright (c) 2012 edu.self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GraphicObject.h"
@interface Circle : GraphicObject
@property (nonatomic, assign)float radius;
-(float)perimeter;
-(float)area;
-(void)print;
@end

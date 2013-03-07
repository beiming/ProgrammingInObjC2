//
//  Triangle.h
//  Exercise8All
//
//  Created by 佩鑫 刘 on 7/24/12.
//  Copyright (c) 2012 edu.self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GraphicObject.h"

@interface Triangle : GraphicObject
@property (nonatomic, assign)float a,b,c;
-(float)perimeter;
-(float)area;
-(void)print;
@end

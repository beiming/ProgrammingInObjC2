//
//  GraphicObject.h
//  Exercise8All
//
//  Created by 佩鑫 刘 on 7/24/12.
//  Copyright (c) 2012 edu.self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphicObject : NSObject
{
    int fillColor;
    BOOL filled;
    int lineColor;
}
@property int fillColor,lineColor;
@property BOOL filled;
-(void)test;
@end

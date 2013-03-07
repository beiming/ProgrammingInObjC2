//
//  NSComparisonMethods.h
//  Exercise11All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NSComparisonMethods
@required
-(BOOL) mytest;
// null
@optional
-(BOOL) isEqualTo:(id)object;
-(BOOL) isLessThanOrEqualTo:(id)object;
-(BOOL) isLessThan:(id)object;
-(BOOL) isGreaterThanOrEqualTo:(id)object;
-(BOOL) isGreaterThan:(id)object;
-(BOOL) isNotEqualTo:(id)object;
@end

//
//  Fraction+MathOps.h
//  Exercise11All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import "Fraction.h"

@interface Fraction (MathOps)
-(Fraction *)add2:(Fraction *)f;
-(Fraction *)mul:(Fraction *)f;
-(Fraction *)sub:(Fraction *)f;
-(Fraction *)div:(Fraction *)f;
-(Fraction *)invert:(Fraction *)f;
@end

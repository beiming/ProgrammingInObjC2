//
//  FractionCalculatorBrain.h
//  FractionCalculator
//
//  Created by peixin liu on 3/13/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
@interface FractionCalculatorBrain : NSObject
@property (strong, nonatomic)Fraction *operand1, *operand2, *accumulator;

- (id)init;
- (Fraction *)performOperation:(NSString *) operate;
- (void)clear;
@end

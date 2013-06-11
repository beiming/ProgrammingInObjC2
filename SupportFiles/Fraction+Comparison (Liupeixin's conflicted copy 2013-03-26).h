//
//  Fraction+Comparison.h
//  Exercise11All
//
//  Created by peixin liu on 8/5/12.
//  Copyright (c) 2012 peixin liu. All rights reserved.
//

#import "Fraction.h"
@interface Fraction (Comparison)
-(BOOL) isEqualTo:(Fraction *) f;
-(int) compare:(Fraction *) f;
@end

//
//  FractionCalculatorViewController.h
//  FractionCalculator
//
//  Created by peixin liu on 3/13/13.
//  Copyright (c) 2013 peixin liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FractionCalculatorBrain.h"
#import "CommonVariable.h"
@interface FractionCalculatorViewController : UIViewController
{
}
@property (weak, nonatomic) IBOutlet UILabel *display;
- (IBAction)clickDigit:(UIButton *)sender;
- (IBAction)clickOperate:(UIButton *)sender;
- (IBAction)clickClear:(id)sender;
- (IBAction)clickOver:(id)sender;
- (IBAction)clickEquals:(UIButton *)sender;
- (IBAction)clickConvert:(id)sender;
@end

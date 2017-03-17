//
//  ViewController.h
//  Calculator
//
//  Created by BridgeLabz Solutions LLP  on 2/22/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

#import <UIKit/UIKit.h>

#define PLUS 0
#define MINUS 1
#define MULTIPLY 2
#define DIVIDE 3

@interface ViewController : UIViewController
{
    NSInteger num1;
    NSInteger num2;
    double answer;
    
    NSInteger operand;
    NSString *theNumber;
    IBOutlet UILabel *lblText;
}


@property NSInteger num1;
@property NSInteger num2;
@property double answer;

@property NSInteger operand;
@property (strong, nonatomic) NSString *theNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblText;

@end

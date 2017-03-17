//  ViewController.m
//  Calculator
//
//  Created by BridgeLabz Solutions LLP  on 2/22/17.
//  Copyright © 2017 BridgeLabz Solutions LLP . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize num2,num1,answer,operand,theNumber,lblText;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNum1:0];
    [self setNum2:0];
    [self setOperand:PLUS];
    [self setAnswer:0.0];
    [self setTheNumber:@"0"];
    [self printNumber];
}

-(void)printNumber
{
    [lblText setText:theNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveNum1
{
    num1 = [theNumber integerValue];
    theNumber = @"0";
    [self printNumber];
}

-(IBAction)calculate:(id)sender
{
    num2 = [theNumber integerValue];
    
    if(operand == PLUS)
        answer = num1 + num2;
        else if(operand == MINUS)
            answer = num1 - num2;
            else if(operand == MULTIPLY)
                    answer = num1 * num2;
                    else
                        answer = (double)num1 / (double)num2;
    
    theNumber = [NSString stringWithFormat:@"%f",answer];
    [self printNumber];
    
    num1 = 0;
    num2 = 0;
    answer = 0.0;

}
-(IBAction)clearNumber:(id)sender
{
    theNumber = @"0";
    [self printNumber];
}
-(IBAction)setPlus:(id)sender
{
    [self saveNum1];
    operand = PLUS;
}
-(IBAction)setMinus:(id)sender
{
    [self saveNum1];
    operand = MINUS;
}
-(IBAction)setDivide:(id)sender
{
    [self saveNum1];
    operand = DIVIDE;
}
-(IBAction)setMultiply:(id)sender
{
    [self saveNum1];
    operand = MULTIPLY;
}

-(IBAction)press9:(id)sender
{
    theNumber = [theNumber stringByAppendingString:@"9"];
    [self printNumber];
}
-(IBAction)press8:(id)sender
{
    theNumber = [theNumber stringByAppendingString:@"8"];
    [self printNumber];
}
-(IBAction)press7:(id)sender
{
    theNumber = [theNumber stringByAppendingString:@"7"];
    [self printNumber];
}
-(IBAction)press6:(id)sender
{
    theNumber = [theNumber stringByAppendingString:@"6"];
    [self printNumber];
}
-(IBAction)press5:(id)sender
{
    theNumber = [theNumber stringByAppendingString:@"5"];
    [self printNumber];
}
-(IBAction)press4:(id)sender
{
    theNumber = [theNumber stringByAppendingString:@"4"];
    [self printNumber];
}
-(IBAction)press3:(id)sender
{
    theNumber = [theNumber stringByAppendingString:@"3"];
    [self printNumber];
}
-(IBAction)press2:(id)sender
{
    theNumber = [theNumber stringByAppendingString:@"2"];
    [self printNumber];
} 
-(IBAction)press1:(id)sender
{
    theNumber = [theNumber stringByAppendingString:@"1"];
    [self printNumber];
}
-(IBAction)press0:(id)sender
{
    theNumber = [theNumber stringByAppendingString:@"0"];
    [self printNumber];
}

@end

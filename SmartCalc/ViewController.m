//
//  ViewController.m
//  SmartCalc
//
//  Created by 양동길 on 2014. 6. 3..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize curValue, totalCurValue, curStatusCode, curInputValue, displayLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    displayLabel.layer.cornerRadius = 5;
    keypadMC.layer.cornerRadius = 5;
    keypadMPlus.layer.cornerRadius = 5;
    keypadMMinus.layer.cornerRadius = 5;
    keypadMR.layer.cornerRadius = 5;
    keypadC.layer.cornerRadius = 5;
    keypadPM.layer.cornerRadius = 5;
    keypadPercent.layer.cornerRadius = 5;
    keypadDivide.layer.cornerRadius = 5;
    keypadMultiple.layer.cornerRadius = 5;
    keypadMinus.layer.cornerRadius = 5;
    keypadPlus.layer.cornerRadius = 5;
    keypadEqual.layer.cornerRadius = 5;
    keypad0.layer.cornerRadius = 5;
    keypad1.layer.cornerRadius = 5;
    keypad2.layer.cornerRadius = 5;
    keypad3.layer.cornerRadius = 5;
    keypad4.layer.cornerRadius = 5;
    keypad5.layer.cornerRadius = 5;
    keypad6.layer.cornerRadius = 5;
    keypad7.layer.cornerRadius = 5;
    keypad8.layer.cornerRadius = 5;
    keypad9.layer.cornerRadius = 5;
    keypadPoint.layer.cornerRadius = 5;
}

-(IBAction) disitPressed:(UIButton *)sender
{
    
}

-(IBAction)operationpressed:(UIButton *)sender
{
    
}

-(void) Calculation:(kStatusCode)StatusCode CurStatusCode:(kStatusCode)cStatusCode
{
    
}

-(void) ClearCalulation
{
    
}

-(void) DisplayInputValue:(NSString *)displayText
{
    
}

-(void) DisplayCalculationValue
{
    
}


-(NSString *)ConvertComma:(NSString *)data
{
    NSString * aa;
    return aa;
}


-(void) MinusCalculation
{
    
}

-(void) PlusClaculation
{
    
}

-(void) MultiplyCalculation
{
    
}

-(void) DivisionCalculation
{
    
}

-(void) RemainCalculationValue
{
    
}

-(void)ReturnCalculationValue
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

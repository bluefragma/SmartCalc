//
//  ViewController.h
//  SmartCalc
//
//  Created by 양동길 on 2014. 6. 3..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    STATUS_DEFAULT=0,
    STATUS_DIVISION,
    STATUS_MULTIPLY,
    STATUS_MINUS,
    STATUS_PLUS,
    STATUS_RETURN
}kStatusCode;

@interface ViewController : UIViewController {
    double curValue;
    double totalCurValue;
    NSString *curInputValue;
    
    IBOutlet UILabel *displayLabel;
    IBOutlet UIButton *keypadMC;
    IBOutlet UIButton *keypadMPlus;
    IBOutlet UIButton *keypadMMinus;
    IBOutlet UIButton *keypadMR;
    IBOutlet UIButton *keypadC;
    IBOutlet UIButton *keypadPM;
    IBOutlet UIButton *keypadPercent;
    IBOutlet UIButton *keypadDivide;
    IBOutlet UIButton *keypadMultiple;
    IBOutlet UIButton *keypadMinus;
    IBOutlet UIButton *keypadPlus;
    IBOutlet UIButton *keypadEqual;
    IBOutlet UIButton *keypad0;
    IBOutlet UIButton *keypad1;
    IBOutlet UIButton *keypad2;
    IBOutlet UIButton *keypad3;
    IBOutlet UIButton *keypad4;
    IBOutlet UIButton *keypad5;
    IBOutlet UIButton *keypad6;
    IBOutlet UIButton *keypad7;
    IBOutlet UIButton *keypad8;
    IBOutlet UIButton *keypad9;
    IBOutlet UIButton *keypadPoint;
}

-(IBAction) digitPressed:(UIButton *)sender;
-(IBAction)operationpressed:(UIButton *)sender;
-(void) Calculation:(kStatusCode)StatusCode CurStatusCode:(kStatusCode)cStatusCode;
-(void) ClearCalulation;
-(void) DisplayInputValue:(NSString *)displayText;
-(void) DisplayCalculationValue;

-(NSString *)ConvertComma:(NSString *)data;

-(void) MinusCalculation;
-(void) PlusCalculation;
-(void) MultiplyCalculation;
-(void) DivisionCalculation;
-(void) RemainCalculationValue;
-(void)ReturnCalculationValue;

@property Float64 curValue;
@property Float64 totalCurValue;
@property kStatusCode curStatusCode;
@property (nonatomic, retain) NSString *curInputValue;
@property (nonatomic, retain) UILabel *displayLabel;

@end

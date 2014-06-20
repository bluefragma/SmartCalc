//
//  ViewController.h
//  SmartCalc
//
//  Created by 양동길 on 2014. 6. 3..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class Calc;

@interface ViewController : UIViewController {
    
    IBOutlet UILabel *displayLabel;
    IBOutlet UIButton *keypadMC;
    IBOutlet UIButton *keypadMPlus;
    IBOutlet UIButton *keypadMMinus;
    IBOutlet UIButton *keypadMR;
    IBOutlet UIButton *keypadC;
    IBOutlet UIButton *keypadPM;
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
    IBOutlet UILabel *operationState;
    IBOutlet UILabel *displayMemory;
}

-(IBAction) digitPressed:(UIButton *)sender;
-(IBAction) operationpressed:(UIButton *)sender;
-(void) DisplayCalculationValue:(Float64) totalCurValue64;

-(void) ClearCalulation;
-(void) DisplayInputValue:(NSString *)displayText;

-(NSString *)ConvertComma:(NSString *)data;

-(void) ReturnCalculationValue;

// 계산기
@property (nonatomic, strong) Calc *calc;
@property (nonatomic, retain) IBOutlet UILabel *displayLabel;
@property (nonatomic, retain) IBOutlet UILabel *displayMemory;
@property (strong, nonatomic) IBOutlet UILabel *displaySymbolState;

@end

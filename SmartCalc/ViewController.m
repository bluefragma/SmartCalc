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
    /*
    displayLabel.layer.cornerRadius = 3;
    keypadMC.layer.cornerRadius = 3;
    keypadMPlus.layer.cornerRadius = 3;
    keypadMMinus.layer.cornerRadius = 3;
    keypadMR.layer.cornerRadius = 3;
    keypadC.layer.cornerRadius = 3;
    keypadPM.layer.cornerRadius = 3;
    keypadDivide.layer.cornerRadius = 3;
    keypadMultiple.layer.cornerRadius = 3;
    keypadMinus.layer.cornerRadius = 3;
    keypadPlus.layer.cornerRadius = 3;
    keypadEqual.layer.cornerRadius = 3;
    keypad0.layer.cornerRadius = 3;
    keypad1.layer.cornerRadius = 3;
    keypad2.layer.cornerRadius = 3;
    keypad3.layer.cornerRadius = 3;
    keypad4.layer.cornerRadius = 3;
    keypad5.layer.cornerRadius = 3;
    keypad6.layer.cornerRadius = 3;
    keypad7.layer.cornerRadius = 3;
    keypad8.layer.cornerRadius = 3;
    keypad9.layer.cornerRadius = 3;
    keypadPoint.layer.cornerRadius = 3;
    */
    [self setNeedsStatusBarAppearanceUpdate];
    [self ClearCalulation];
    [displayLabel setText:@"0"];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger) supportedInterfaceOrientations
{
    // plist에서 먼저 설정
    return UIInterfaceOrientationMaskPortrait;  // 세로화면만 허용
}

// 숫자버튼 처리
-(IBAction) digitPressed:(UIButton *)sender
{
    NSString *numPoint;
    if ([@"∙" isEqualToString:sender.titleLabel.text])
    {
        [self Calculation:curStatusCode CurStatusCode:STATUS_PLUS];
        numPoint = @".";
    }
    else {
        numPoint = [[sender titleLabel]text];
    }
    curInputValue = [curInputValue stringByAppendingFormat:numPoint, nil];
    [self DisplayInputValue:curInputValue];
}

// 기능버튼 처리
-(IBAction)operationpressed:(UIButton *)sender
{
    NSString *operationText = sender.titleLabel.text;
    
    if ([@"+" isEqualToString:operationText])           // +
    {
        [self Calculation:curStatusCode CurStatusCode:STATUS_PLUS];
    }
    else if([@"−" isEqualToString:operationText])       // -
    {
        [self Calculation:curStatusCode CurStatusCode:STATUS_MINUS];
    }
    else if([@"×" isEqualToString:operationText])       // x
    {
        [self Calculation:curStatusCode CurStatusCode:STATUS_MULTIPLY];
    }
    else if([@"÷" isEqualToString:operationText])       // ÷
    {
        [self Calculation:curStatusCode CurStatusCode:STATUS_DIVISION];
    }
    else if([@"c" isEqualToString:operationText])       // 클리어
    {
        [self ClearCalulation];
    }
    else if([@"=" isEqualToString:operationText])       // 계산
    {
        [self Calculation:curStatusCode CurStatusCode:STATUS_RETURN];
    }
    else if([@"mc" isEqualToString:operationText])       // mc
    {
        
    }
    else if([@"m+" isEqualToString:operationText])       // m+
    {

    }
    else if([@"m−" isEqualToString:operationText])       // m-
    {

    }
    else if([@"mr" isEqualToString:operationText])       // mr
    {
        
    }
    
}

// 현재 상태에 따른 분기처리
-(void) Calculation:(kStatusCode)StatusCode CurStatusCode:(kStatusCode)cStatusCode
{
    switch(StatusCode)
    {
        case STATUS_DEFAULT:
        case STATUS_RETURN:
            [self DefaultCalculation];
            break;
        case STATUS_DIVISION:
            [self DivisionCalculation];
            break;
        case STATUS_MULTIPLY:
            [self MultiplyCalculation];
            break;
        case STATUS_MINUS:
            [self MinusCalculation];
            break;
            
        case STATUS_PLUS:
            [self PlusCalculation];
            break;
    }
    curStatusCode = cStatusCode;
}

// 계산기 초기화
-(void) ClearCalulation
{
    curInputValue = @"";
    curValue = 0;
    totalCurValue = 0;
    
    [self DisplayInputValue:curInputValue];
    
    curStatusCode = STATUS_DEFAULT;
}

-(void) DisplayInputValue:(NSString *)displayText
{
    NSString *CommaText;
    CommaText = [self ConvertComma:displayText];
    [displayLabel setText:CommaText];
}

// 계산 결과 화면 출력
-(void) DisplayCalculationValue
{
    NSString *displayText;
    displayText = [NSString stringWithFormat:@"%g", totalCurValue];
    [self DisplayInputValue:displayText];
    
    curInputValue = @"";
}

// 천원단위표시
-(NSString *)ConvertComma:(NSString *)data
{
    if ( data == nil ) return nil;
    if ( [data length] <= 3 ) return data;
    
    NSString *integerString = nil;
    NSString *floatString = nil;
    NSString *minusString = nil;
    
    // 소수점을 찾는다.
    NSRange pointRange = [data rangeOfString:@"."];
    if ( pointRange.location == NSNotFound ) {
        // 소수점이 없다.
        integerString = data;
    }
    else {
        // 소수점 이하 영역을 찾는다.
        NSRange r;
        r.location = pointRange.location;
        r.length = [data length] - pointRange.location;
        floatString = [data substringWithRange:r];
        
        // 정수부 영역을 찾는다.
        r.location = 0;
        r.length = pointRange.location;
        integerString = [data substringWithRange:r];
    }
    
    // 음수 부호를 찾는다.
    NSRange minusRange = [integerString rangeOfString:@"-"];
    if ( minusRange.location != NSNotFound ) { // 음수 부호가 있다.
        minusString = @"-";
        integerString = [integerString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    
    // 세자리 단위로 콤마를 찍는다.
    NSMutableString *integerStringCommaInserted = [[NSMutableString alloc] init];
    int integerStringLength = [integerString length];
    int idx = 0;
    while (idx < integerStringLength ) {
        [integerStringCommaInserted appendFormat:@"%C",[integerString characterAtIndex:idx]];
        if ( ( integerStringLength - ( idx + 1 ) ) % 3 == 0 && integerStringLength != ( idx + 1 ) ) {
            [integerStringCommaInserted appendString:@","];
        }
        idx++;
    }
    
    NSMutableString *returnString = [[NSMutableString alloc] init];
    if ( minusString != nil ) [returnString appendString:minusString];
    if ( integerStringCommaInserted != nil ) [returnString appendString:integerStringCommaInserted];
    if ( floatString != nil ) [returnString appendString:floatString];
    
    return returnString;
}



// 기본 입력 된 값 처리
- (void)DefaultCalculation
{
    curValue = [curInputValue doubleValue];
    totalCurValue = curValue;
    [self DisplayCalculationValue];
}

// 빼기 연산
-(void) MinusCalculation
{
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue - curValue;
    [self DisplayCalculationValue];
}

// 더하기 연산
-(void) PlusCalculation
{
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue + curValue;
    [self DisplayCalculationValue];
}

// 곱하기 연산
-(void) MultiplyCalculation
{
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue * curValue;
    [self DisplayCalculationValue];
}

// 나누기 연산
-(void) DivisionCalculation
{
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue / curValue;
    [self DisplayCalculationValue];
}

-(void) RemainCalculationValue
{
    
}

// 0으로 초기화
-(void) ReturnCalculationValue
{
    totalCurValue = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

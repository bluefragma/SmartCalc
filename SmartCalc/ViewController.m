//
//  ViewController.m
//  SmartCalc
//
//  Created by 양동길 on 2014. 6. 3..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import "ViewController.h"
#import "Calc.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize displayLabel;
@synthesize displayMemory;
@synthesize calc;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self setNeedsStatusBarAppearanceUpdate];
    
    calc = [Calc new];
    
    [self ClearCalulation];
    [self.displayLabel setText:@"0"];
    [self.displayMemory setText:@"0"];
    [self.displaySymbolState setText:@""];
}

#pragma mark ------- 숫자 버튼 처리 ----------------------------------

// 숫자버튼 처리
-(IBAction) digitPressed:(UIButton *)sender
{
    NSString *numPoint;
    if ([@"∙" isEqualToString:sender.titleLabel.text])
    {
        [self Calculation:calc.curStatusCode CurStatusCode:STATUS_PLUS];
        numPoint = @".";
    }
    else {      // 숫자 버튼 처리
        numPoint = [[sender titleLabel]text];
    }
    calc.curInputValue = [calc.curInputValue stringByAppendingString:numPoint];
    [self DisplayInputValue:calc.curInputValue];
}

#pragma mark ------- 기능 버튼 처리 ----------------------------------

// 기능버튼 처리
-(IBAction) operationpressed:(UIButton *)sender
{
    NSString *operationText = sender.titleLabel.text;
    
    if ([@"+" isEqualToString:operationText])           // +
    {
        [self Calculation:calc.curStatusCode CurStatusCode:STATUS_PLUS];
    }
    else if([@"−" isEqualToString:operationText])       // -
    {
        [self Calculation:calc.curStatusCode CurStatusCode:STATUS_MINUS];
    }
    else if([@"×" isEqualToString:operationText])       // x
    {
        [self Calculation:calc.curStatusCode CurStatusCode:STATUS_MULTIPLY];
    }
    else if([@"÷" isEqualToString:operationText])       // ÷
    {
        [self Calculation:calc.curStatusCode CurStatusCode:STATUS_DIVISION];
    }
    else if([@"c" isEqualToString:operationText])       // 클리어
    {
        [self ClearCalulation];
    }
    else if([@"=" isEqualToString:operationText])       // 계산
    {
        [self Calculation:calc.curStatusCode CurStatusCode:STATUS_RETURN];
    }
}

// +/- 처리
- (IBAction)operationPlusMinus:(id)sender {
    [calc PlusMinus];
    [self DisplayInputValue:calc.curInputValue];
}

- (IBAction)MemoryPressed:(UIButton *)sender {
    NSString *operationText = sender.titleLabel.text;

    if([@"mc" isEqualToString:operationText])           // 메모리 클리어
    {
        [calc MemoryClear];
        [self DisplayMRInputValue:[NSString stringWithFormat:@"%g", calc.memoryValue]];
    }
    else if([@"m+" isEqualToString:operationText])       // 메모리 플러스
    {
        calc.calcStatusCode = STATUS_PL;
        [calc MemoryPlus];
        [self DisplayInputValue:[NSString stringWithFormat:@"%g", calc.totalCurValue]];
    }
    else if([@"m−" isEqualToString:operationText])       // 메모리 마이너스
    {
        calc.calcStatusCode = STATUS_MN;
        [calc MemoryMinus];
        [self DisplayInputValue:[NSString stringWithFormat:@"%g", calc.totalCurValue]];
    }
    else if([@"mr" isEqualToString:operationText])       // 메모리 저장
    {
        [calc MemorySave];
        [self DisplayMRInputValue:[NSString stringWithFormat:@"%g", calc.memoryValue]];
    }
}

#pragma mark ------- 계산 상태에 따른 처리 ----------------------------------

// 현재 상태에 따른 분기처리
-(void) Calculation:(kStatusCode)StatusCode CurStatusCode:(kStatusCode)cStatusCode
{
    switch(StatusCode)
    {
        case STATUS_DEFAULT:
            switch (cStatusCode) {
                case STATUS_DIVISION:
                    [self.displaySymbolState setText:@"÷"];
                    break;
                case STATUS_MULTIPLY:
                    [self.displaySymbolState setText:@"x"];
                    break;
                case STATUS_MINUS:
                    [self.displaySymbolState setText:@"−"];
                    break;
                case STATUS_PLUS:
                    [self.displaySymbolState setText:@"+"];
                    break;
                default:
                    [self.displaySymbolState setText:@""];
                    break;
            }
        case STATUS_RETURN:
            [calc DefaultCalc];
            switch (cStatusCode) {
                case STATUS_DIVISION:
                    [self.displaySymbolState setText:@"÷"];
                    break;
                case STATUS_MULTIPLY:
                    [self.displaySymbolState setText:@"x"];
                    break;
                case STATUS_MINUS:
                    [self.displaySymbolState setText:@"−"];
                    break;
                case STATUS_PLUS:
                    [self.displaySymbolState setText:@"+"];
                    break;
                default:
                    [self.displaySymbolState setText:@""];
                    break;
            }
            break;
        case STATUS_DIVISION:
            [calc DivisionCalc];
            switch (cStatusCode) {
                case STATUS_DIVISION:
                    [self.displaySymbolState setText:@"÷"];
                    break;
                case STATUS_MULTIPLY:
                    [self.displaySymbolState setText:@"x"];
                    break;
                case STATUS_MINUS:
                    [self.displaySymbolState setText:@"−"];
                    break;
                case STATUS_PLUS:
                    [self.displaySymbolState setText:@"+"];
                    break;
                default:
                    [self.displaySymbolState setText:@""];
                    break;
            }
            break;
        case STATUS_MULTIPLY:
            [calc MultiplyCalc];
            switch (cStatusCode) {
                case STATUS_DIVISION:
                    [self.displaySymbolState setText:@"÷"];
                    break;
                case STATUS_MULTIPLY:
                    [self.displaySymbolState setText:@"x"];
                    break;
                case STATUS_MINUS:
                    [self.displaySymbolState setText:@"−"];
                    break;
                case STATUS_PLUS:
                    [self.displaySymbolState setText:@"+"];
                    break;
                default:
                    [self.displaySymbolState setText:@""];
                    break;
            }
            break;
        case STATUS_MINUS:
            [calc MinusCalc];
            switch (cStatusCode) {
                case STATUS_DIVISION:
                    [self.displaySymbolState setText:@"÷"];
                    break;
                case STATUS_MULTIPLY:
                    [self.displaySymbolState setText:@"x"];
                    break;
                case STATUS_MINUS:
                    [self.displaySymbolState setText:@"−"];
                    break;
                case STATUS_PLUS:
                    [self.displaySymbolState setText:@"+"];
                    break;
                default:
                    [self.displaySymbolState setText:@""];
                    break;
            }
            break;
        case STATUS_PLUS:
            [calc PlusCalc];
            switch (cStatusCode) {
                case STATUS_DIVISION:
                    [self.displaySymbolState setText:@"÷"];
                    break;
                case STATUS_MULTIPLY:
                    [self.displaySymbolState setText:@"x"];
                    break;
                case STATUS_MINUS:
                    [self.displaySymbolState setText:@"−"];
                    break;
                case STATUS_PLUS:
                    [self.displaySymbolState setText:@"+"];
                    break;
                default:
                    [self.displaySymbolState setText:@""];
                    break;
            }
            break;
    }
    calc.curStatusCode = cStatusCode;
}

// 계산기 초기화
-(void) ClearCalulation
{
    calc.curInputValue = @"";
    calc.curValue = 0;
    calc.totalCurValue = 0;
    [self.displayLabel setText:@"0"];
    [self.displaySymbolState setText:@""];
    calc.curStatusCode = STATUS_DEFAULT;
}

#pragma mark ------- 화면 처리 ----------------------------------

-(void) DisplayInputValue:(NSString *)displayText
{
    NSString *CommaText;
    CommaText = [self ConvertComma:displayText];
    [displayLabel setText:CommaText];
}

-(void) DisplayMRInputValue:(NSString *)displayText
{
    NSString *CommaText;
    CommaText = [self ConvertComma:displayText];
    [self.displayMemory setText:CommaText];
}

// 계산 결과 화면 출력
-(void) DisplayCalculationValue:(Float64) totalCurValue64
{
    NSString *displayText;
    displayText = [NSString stringWithFormat:@"%g", totalCurValue64];
    [self DisplayInputValue:displayText];
    calc.curInputValue = @"";
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
    NSRange minusRange = [integerString rangeOfString:@"−"];
    if ( minusRange.location != NSNotFound ) { // 음수 부호가 있다.
        minusString = @"−";
        integerString = [integerString stringByReplacingOccurrencesOfString:@"−" withString:@""];
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

// 0으로 초기화
-(void) ReturnCalculationValue
{
    calc.totalCurValue = 0;
}

#pragma mark ------- 디바이스 처리 ----------------------------------

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

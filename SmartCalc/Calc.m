//
//  Calc.m
//  SmartCalc
//
//  Created by 양동길 on 2014. 6. 20..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import "Calc.h"

@implementation Calc

@synthesize curValue, totalCurValue;
@synthesize curStatusCode, curInputValue;
@synthesize memoryValue;
@synthesize calcStatusCode;

// 플러스 마이너스
-(void) PlusMinus
{
    curValue = [curInputValue doubleValue];
    curValue = curValue * -1;
    curInputValue = [NSString stringWithFormat:@"%g", curValue];
}

// 기본 입력 된 값 처리
-(void) DefaultCalc
{
    curValue = [curInputValue doubleValue];
    totalCurValue = curValue;
}

// 빼기 연산
-(void) MinusCalc
{
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue - curValue;
}

// 더하기 연산
-(void) PlusCalc
{
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue + curValue;
}

// 곱하기 연산
-(void) MultiplyCalc
{
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue * curValue;
}

// 나누기 연산
-(void) DivisionCalc
{
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue / curValue;
}

// 메모리 클리어
-(void) MemoryClear
{
    memoryValue = 0;
}

// 메모리 플러스
-(void) MemoryPlus
{
    switch (calcStatusCode) {
        case STATUS_DF:
            totalCurValue = totalCurValue + memoryValue;
            break;
        case STATUS_PL:
            totalCurValue = curValue + memoryValue;
            break;
        default:
            break;
    }

}

// 메모리 마이너스
-(void) MemoryMinus
{
    switch (calcStatusCode) {
        case STATUS_DF:
            totalCurValue = totalCurValue - memoryValue;
            break;
        case STATUS_MN:
            totalCurValue = curValue - memoryValue;
            break;
        default:
            break;
    }
}

// 메모리 저장
-(void) MemorySave
{
    memoryValue = [curInputValue doubleValue];
}

@end
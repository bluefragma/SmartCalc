//
//  Calc.h
//  SmartCalc
//
//  Created by 양동길 on 2014. 6. 20..
//  Copyright (c) 2014년 양동길. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    STATUS_DEFAULT=0,
    STATUS_DIVISION,
    STATUS_MULTIPLY,
    STATUS_MINUS,
    STATUS_PLUS,
    STATUS_RETURN
}kStatusCode;

typedef enum {
    STATUS_DF=0,
    STATUS_PL,
    STATUS_MN
}calcStatusCode;

@interface Calc : NSObject
{
    // 계산기 관련
    double curValue;
    double totalCurValue;
    double memoryValue;
    NSString *curInputValue;
    
}

-(void) PlusMinus;
-(void) DefaultCalc;
-(void) MinusCalc;
-(void) PlusCalc;
-(void) MultiplyCalc;
-(void) DivisionCalc;
-(void) MemoryClear;
-(void) MemoryPlus;
-(void) MemoryMinus;
-(void) MemorySave;

// 계산기 관련
@property Float64 curValue;
@property Float64 totalCurValue;
@property Float64 memoryValue;
@property kStatusCode curStatusCode;
@property calcStatusCode calcStatusCode;
@property (nonatomic, retain) NSString *curInputValue;

@end

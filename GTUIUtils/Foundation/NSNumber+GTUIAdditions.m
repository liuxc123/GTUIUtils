//
//  NSNumber+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "NSNumber+GTUIAdditions.h"

@implementation NSNumber (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Prehash
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Prehash

- (NSDate *)gtui_toDate
{
    double curTime = [self doubleValue];
    NSDate *curDate = [NSDate dateWithTimeIntervalSince1970:curTime];
    return curDate;
}

- (NSString *)gtui_toString
{
    NSString *curString = [NSString stringWithFormat:@"%@", self];
    return curString;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  FloatValue
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - CGFloatValue

- (CGFloat)gtui_CGFloatValue
{
#if (CGFLOAT_IS_DOUBLE == 1)
    CGFloat curValue = [self doubleValue];
#else
    CGFloat curValue = [self floatValue];
#endif
    return curValue;
}

+ (instancetype)gtui_numberWithCGFloat:(CGFloat)cValue
{
#if (CGFLOAT_IS_DOUBLE == 1)
    NSNumber *curNumber = [[self alloc] initWithDouble:cValue];
#else
    NSNumber *curNumber = [[self alloc] initWithFloat:cValue];
#endif
    return curNumber;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Round
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Round

- (instancetype)gtui_roundWithDigit:(NSUInteger)digit
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:digit];
    [formatter setMinimumFractionDigits:digit];
    NSString *curString = [formatter stringFromNumber:self];
    NSNumber *curNumber = [NSNumber numberWithDouble:[curString doubleValue]];
    return curNumber;
}

- (instancetype)gtui_ceilWithDigit:(NSUInteger)digit
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundCeiling];
    [formatter setMaximumFractionDigits:digit];
    NSString *curString = [formatter stringFromNumber:self];
    NSNumber *curNumber = [NSNumber numberWithDouble:[curString doubleValue]];
    return curNumber;
}

- (instancetype)gtui_floorWithDigit:(NSUInteger)digit
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundFloor];
    [formatter setMaximumFractionDigits:digit];
    NSString *curString = [formatter stringFromNumber:self];
    NSNumber *curNumber = [NSNumber numberWithDouble:[curString doubleValue]];
    return curNumber;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  RomanNumeral
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - romanNumeral

- (NSString *)gtui_toRomanNumeral
{
    NSArray *numerals = [NSArray arrayWithObjects:@"M", @"CM", @"D", @"CD", @"C", @"XC", @"L", @"XL", @"X", @"IX", @"V", @"IV", @"I", nil];
    NSUInteger valueCount = 13;
    NSUInteger values[] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};

    NSMutableString *numeralString = [NSMutableString string];
    NSInteger curInteger = [self integerValue];
    for (NSUInteger i = 0; i < valueCount; i++)
    {
        while (curInteger >= values[i])
        {
            curInteger -= values[i];
            [numeralString appendString:[numerals objectAtIndex:i]];
        }
    }
    return numeralString;
}


@end

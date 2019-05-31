//
//  NSArray+GTUISafeAccess.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "NSArray+GTUISafeAccess.h"
#import "GTUIMacro.h"
#import "NSString+GTUIAdditions.h"
#import "NSNumber+GTUIAdditions.h"

@implementation NSArray (GTUISafeAccess)


- (id)gtui_objectWithIndex:(NSUInteger)cIndex
{
    if (cIndex < self.count) {
        return self[cIndex];
    }
    return nil;
}

- (NSString *)gtui_stringWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        NSString *curString = [NSString gtui_stringFromObject:curValue];
        return curString;
    }
    return nil;
}

- (NSNumber *)gtui_numberWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSNumber class]]) {
            return curValue;
        }
        if ([curValue isKindOfClass:[NSString class]]) {
            NSNumber *curNumber = ((NSString *)curValue).gtui_toNumber;
            return curNumber;
        }
    }
    return nil;
}

- (NSArray *)gtui_arrayWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSArray class]]) {
            return curValue;
        }
    }
    return nil;
}

- (NSMutableArray *)gtui_mutableArrayWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSMutableArray class]]) {
            return curValue;
        }
    }
    return nil;
}

- (NSDictionary *)gtui_dictionaryWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSDictionary class]]) {
            return curValue;
        }
    }
    return nil;
}

- (NSMutableDictionary *)gtui_mutableDictionaryWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSMutableDictionary class]]) {
            return curValue;
        }
    }
    return nil;
}

- (NSInteger)gtui_integerWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSString class]] ||
            [curValue isKindOfClass:[NSNumber class]]) {
            NSInteger curInteger = [curValue integerValue];
            return curInteger;
        }
    }
    return 0;
}

- (NSUInteger)gtui_unsignedIntegerWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSString class]] ||
            [curValue isKindOfClass:[NSNumber class]]) {
            NSUInteger curUInteger = [curValue unsignedIntegerValue];
            return curUInteger;
        }
    }
    return 0;
}

- (BOOL)gtui_boolWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSString class]] ||
            [curValue isKindOfClass:[NSNumber class]]) {
            BOOL curRet = [curValue boolValue];
            return curRet;
        }
    }
    return NO;
}

- (float)gtui_floatWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSString class]] ||
            [curValue isKindOfClass:[NSNumber class]]) {
            float curFloat = [curValue floatValue];
            return curFloat;
        }
    }
    return 0;
}

- (double)gtui_doubleWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSString class]] ||
            [curValue isKindOfClass:[NSNumber class]]) {
            double curDouble = [curValue doubleValue];
            return curDouble;
        }
    }
    return 0;
}

- (CGFloat)gtui_CGFloatWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSString class]]) {
            NSNumber *curNumber = ((NSString *)curValue).gtui_toNumber;
            CGFloat curFloat = curNumber.gtui_CGFloatValue;
            return curFloat;
        } else if ([curValue isKindOfClass:[NSNumber class]]) {
            CGFloat curFloat = ((NSNumber *)curValue).gtui_CGFloatValue;
            return curFloat;
        }
    }
    return 0;
}

- (CGPoint)gtui_pointWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSString class]]) {
            CGPoint curPoint = CGPointFromString(curValue);
            return curPoint;
        }
    }
    return CGPointZero;
}

- (CGSize)gtui_sizeWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSString class]]) {
            CGSize curSize = CGSizeFromString(curValue);
            return curSize;
        }
    }
    return CGSizeZero;
}

- (CGRect)gtui_rectWithIndex:(NSUInteger)cIndex
{
    id curValue = [self gtui_objectWithIndex:cIndex];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSString class]]) {
            CGRect curRect = CGRectFromString(curValue);
            return curRect;
        }
    }
    return CGRectZero;
}


@end



/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  NSMutableArray
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

@implementation NSMutableArray (GTUISafeAccess)


- (void)gtui_addObj:(id)a
{
    if (a != nil) {
        [self addObject:a];
    }
}

- (void)gtui_addInteger:(NSInteger)a
{
    [self addObject:@(a)];
}

- (void)gtui_addUnsignedInteger:(NSUInteger)a
{
    [self addObject:@(a)];
}

- (void)gtui_addBool:(BOOL)a
{
    [self addObject:@(a)];
}

- (void)gtui_addFloat:(float)a
{
    [self addObject:@(a)];
}

- (void)gtui_addDouble:(double)a
{
    [self addObject:@(a)];
}

- (void)gtui_addCGFloat:(CGFloat)a
{
    [self addObject:@(a)];
}

- (void)gtui_addPoint:(CGPoint)a
{
    [self addObject:NSStringFromCGPoint(a)];
}

- (void)gtui_addSize:(CGSize)a
{
    [self addObject:NSStringFromCGSize(a)];
}

- (void)gtui_addRect:(CGRect)a
{
    [self addObject:NSStringFromCGRect(a)];
}


@end


//
//  NSDictionary+GTUISafeAccess.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "NSDictionary+GTUISafeAccess.h"
#import "GTUIMacro.h"
#import "NSString+GTUIAdditions.h"
#import "NSNumber+GTUIAdditions.h"

@implementation NSDictionary (GTUISafeAccess)


- (id)gtui_objectForKey:(id)cKey
{
    id curValue = [self objectForKey:cKey];
    if (!kNilOrNull(curValue)) {
        return curValue;
    }
    return nil;
}

- (NSString *)gtui_stringForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        NSString *curString = [NSString gtui_stringFromObject:curValue];
        return curString;
    }
    return nil;
}

- (NSNumber *)gtui_numberForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
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

- (NSArray *)gtui_arrayForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSArray class]]) {
            return curValue;
        }
    }
    return nil;
}

- (NSMutableArray *)gtui_mutableArrayForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSMutableArray class]]) {
            return curValue;
        }
    }
    return nil;
}

- (NSDictionary *)gtui_dictionaryForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSDictionary class]]) {
            return curValue;
        }
    }
    return nil;
}

- (NSMutableDictionary *)gtui_mutableDictionaryForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSMutableDictionary class]]) {
            return curValue;
        }
    }
    return nil;
}

- (NSInteger)gtui_integerForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSString class]] ||
            [curValue isKindOfClass:[NSNumber class]]) {
            NSInteger curInteger = [curValue integerValue];
            return curInteger;
        }
    }
    return 0;
}

- (NSUInteger)gtui_unsignedIntegerForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSString class]] ||
            [curValue isKindOfClass:[NSNumber class]]) {
            NSUInteger curUInteger = [curValue unsignedIntegerValue];
            return curUInteger;
        }
    }
    return 0;
}

- (BOOL)gtui_boolForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (!kNilOrNull(curValue)) {
        if ([curValue isKindOfClass:[NSString class]] ||
            [curValue isKindOfClass:[NSNumber class]]) {
            BOOL curRet = [curValue boolValue];
            return curRet;
        }
    }
    return NO;
}

- (float)gtui_floatForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSString class]] ||
            [curValue isKindOfClass:[NSNumber class]]) {
            float curFloat = [curValue floatValue];
            return curFloat;
        }
    }
    return 0;
}

- (double)gtui_doubleForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSString class]] ||
            [curValue isKindOfClass:[NSNumber class]]) {
            double curDouble = [curValue doubleValue];
            return curDouble;
        }
    }
    return 0;
}

- (CGFloat)gtui_CGFloatForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
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

- (CGPoint)gtui_pointForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSString class]]) {
            CGPoint curPoint = CGPointFromString(curValue);
            return curPoint;
        }
    }
    return CGPointZero;
}

- (CGSize)gtui_sizeForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSString class]]) {
            CGSize curSize = CGSizeFromString(curValue);
            return curSize;
        }
    }
    return CGSizeZero;
}

- (CGRect)gtui_rectForKey:(id)cKey
{
    id curValue = [self gtui_objectForKey:cKey];
    if (curValue) {
        if ([curValue isKindOfClass:[NSString class]]) {
            CGRect curRect = CGRectFromString(curValue);
            return curRect;
        }
    }
    return CGRectZero;
}


@end



/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  NSMutableDictionary
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

@implementation NSMutableDictionary (GTUISafeAccess)


- (void)gtui_setObj:(id)a forKey:(NSString *)cKey
{
    if (a != nil) {
        [self setObject:a forKey:cKey];
    }
}

- (void)gtui_setInteger:(NSInteger)a forKey:(NSString *)cKey
{
    [self setObject:@(a) forKey:cKey];
}

- (void)gtui_setUnsignedInteger:(NSUInteger)a forKey:(NSString *)cKey
{
    [self setObject:@(a) forKey:cKey];
}

- (void)gtui_setBool:(BOOL)a forKey:(NSString *)cKey
{
    [self setObject:@(a) forKey:cKey];
}

- (void)gtui_setFloat:(float)a forKey:(NSString *)cKey
{
    [self setObject:@(a) forKey:cKey];
}

- (void)gtui_setDouble:(double)a forKey:(NSString *)cKey
{
    [self setObject:@(a) forKey:cKey];
}

- (void)gtui_setCGFloat:(CGFloat)a forKey:(NSString *)cKey
{
    [self setObject:@(a) forKey:cKey];
}

- (void)gtui_setPoint:(CGPoint)a forKey:(NSString *)cKey
{
    [self setObject:NSStringFromCGPoint(a) forKey:cKey];
}

- (void)gtui_setSize:(CGSize)a forKey:(NSString *)cKey
{
    [self setObject:NSStringFromCGSize(a) forKey:cKey];
}

- (void)gtui_setRect:(CGRect)a forKey:(NSString *)cKey
{
    [self setObject:NSStringFromCGRect(a) forKey:cKey];
}


@end

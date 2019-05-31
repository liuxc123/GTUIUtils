//
//  NSArray+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "NSArray+GTUIAdditions.h"
#import "GTUIMacro.h"

@implementation NSArray (GTUIAdditions)

/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Prehash
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Prehash

- (NSString *)gtui_toString
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *anyError = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&anyError];
        if (anyError) {
            GTUILogError(@"array to string Error ⤭ %@ ⤪", anyError);
            return nil;
        }
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    } else {
        GTUILogError(@"array to string invalid Array ⤭ %@ ⤪", self);
    }
    return nil;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Operate
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Operate

- (void)gtui_each:(void (^)(id _Nonnull, NSUInteger))cb
{
    if (self.count == 0) return;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        cb(obj, idx);
    }];
}

- (void)gtui_eachReverse:(void (^)(id _Nonnull, NSUInteger))cb
{
    if (self.count == 0) return;
    [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        cb(obj, idx);
    }];
}

- (void)gtui_eachWithStop:(BOOL (^)(id _Nonnull, NSUInteger))cb
{
    if (self.count == 0) return;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BOOL toStop = cb(obj, idx);
        if (toStop) {
            *stop = YES;
        }
    }];
}

- (void)gtui_eachReverseWithStop:(BOOL (^)(id _Nonnull, NSUInteger))cb
{
    if (self.count == 0) return;
    [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BOOL toStop = cb(obj, idx);
        if (toStop) {
            *stop = YES;
        }
    }];
}

- (instancetype)gtui_map:(id  _Nonnull (^)(id _Nonnull, NSUInteger))cb
{
    if (self.count == 0) return @[];
    NSMutableArray *curAry = [NSMutableArray arrayWithCapacity:self.count];
    [self gtui_each:^(id  _Nonnull obj, NSUInteger index) {
        id returnValue = cb(obj, index);
        if (!kNilOrNull(returnValue)) {
            [curAry addObject:returnValue];
        }
    }];
    return curAry;
}

- (instancetype)gtui_filter:(BOOL (^)(id _Nonnull))cb
{
    if (self.count == 0) return @[];
    NSPredicate *curPredicate = [NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return cb(evaluatedObject);
    }];
    NSArray *curAry = [self filteredArrayUsingPredicate:curPredicate];
    return curAry;
}

- (instancetype)gtui_filterInArray:(NSArray *)array
{
    if (self.count == 0) return @[];
    NSPredicate *curPredicate = gPredicate(@"SELF in %@", array);
    NSArray *curAry = [self filteredArrayUsingPredicate:curPredicate];
    return curAry;
}

// @[@(1), @(2), @(4)] -- @[@(1), @(3)] --> @[@(2), @(4)]
- (instancetype)gtui_filterNotInArray:(NSArray *)array
{
    if (self.count == 0) return @[];
    NSPredicate *curPredicate = gPredicate(@"NOT (SELF in %@)", array);
    NSArray *curAry = [self filteredArrayUsingPredicate:curPredicate];
    return curAry;
}

- (instancetype)gtui_merge:(NSArray *)array
{
    NSMutableArray *curAry = [NSMutableArray arrayWithArray:self];
    [curAry addObjectsFromArray:array];
    return curAry;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Sequence
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Sequence


- (id)gtui_randomObject
{
    if (self.count == 0) return nil;
    NSInteger curIdx = gRandomInRange(0, self.count-1);
    id curObj = self[curIdx];
    return curObj;
}

- (instancetype)gtui_shuffledArray
{
    if (self.count == 0) return @[];
    NSMutableArray *curAry = [self mutableCopy];
    for (NSInteger idx = self.count - 1; idx > 0; idx--) {
        [curAry exchangeObjectAtIndex:arc4random_uniform((u_int32_t)idx + 1) withObjectAtIndex:idx];
    }
    return curAry;
}

- (instancetype)gtui_reverseObject
{
    if (self.count == 0) return @[];
    NSEnumerator *curEnumer = [self reverseObjectEnumerator];
    NSArray *curAry = [[NSMutableArray alloc] initWithArray:[curEnumer allObjects]];
    return curAry;
}


@end



/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  NSMutableArray
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

@implementation NSMutableArray (GTUIAdditions)


- (void)gtui_moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (toIndex != fromIndex && fromIndex < [self count] && toIndex< [self count]) {
        id obj = [self objectAtIndex:fromIndex];
        [self removeObjectAtIndex:fromIndex];
        if (toIndex >= [self count]) {
            [self addObject:obj];
        } else {
            [self insertObject:obj atIndex:toIndex];
        }
    }
}


@end

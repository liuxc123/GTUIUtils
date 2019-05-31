//
//  NSDictionary+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "NSDictionary+GTUIAdditions.h"
#import "GTUIMacro.h"

@implementation NSDictionary (GTUIAdditions)


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
            GTUILogError(@"dict to string Error ⤭ %@ ⤪", anyError);
            return nil;
        }
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    } else {
        GTUILogError(@"dict to string invalid Array ⤭ %@ ⤪", self);
    }
    return nil;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Operate
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Operate

- (BOOL)gtui_hasKey:(id)cKey
{
    id curValue = [self objectForKey:cKey];
    if (!kNilOrNull(curValue)) {
        return YES;
    }
    return NO;
}

- (void)gtui_each:(void (^)(id _Nonnull, id _Nonnull))cb
{
    if (self.count == 0) return;
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        cb(key, obj);
    }];
}

- (void)gtui_eachWithStop:(BOOL (^)(id _Nonnull, id _Nonnull))cb
{
    if (self.count == 0) return;
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        BOOL toStop = cb(key, obj);
        if (toStop) {
            *stop = YES;
        }
    }];
}

- (instancetype)gtui_map:(id  _Nonnull (^)(id _Nonnull, id _Nonnull))cb
{
    if (self.count == 0) return @{};
    NSMutableDictionary *curDict = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self gtui_each:^(id  _Nonnull key, id  _Nonnull obj) {
        id returnValue = cb(key, obj);
        if (!kNilOrNull(returnValue)) {
            [curDict setObject:returnValue forKey:key];
        }
    }];
    return curDict;
}

- (instancetype)gtui_pick:(NSArray *)cKeys
{
    if (cKeys.count == 0) return @{};
    NSMutableDictionary *curDict = [NSMutableDictionary dictionary];
    [self gtui_each:^(id  _Nonnull key, id  _Nonnull obj) {
        if ([cKeys containsObject:key]) {
            curDict[key] = obj;
        }
    }];
    return curDict;
}

- (instancetype)gtui_Omit:(NSArray *)cKeys
{
    if (self.count == 0) return @{};
    NSMutableDictionary *curDict = [NSMutableDictionary dictionary];
    [self gtui_each:^(id  _Nonnull key, id  _Nonnull obj) {
        if (![cKeys containsObject:key]) {
            curDict[key] = obj;
        }
    }];
    return curDict;
}

- (instancetype)gtui_merge:(NSDictionary *)dictionary
{
    NSMutableDictionary *curDict = [self mutableCopy];
    [curDict addEntriesFromDictionary:dictionary];
    return curDict;
}


@end


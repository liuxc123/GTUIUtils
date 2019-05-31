//
//  NSDictionary+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Prehash
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Prehash

@property (nullable,readonly,copy) NSString *gtui_toString;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Operate
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Operate

- (BOOL)gtui_hasKey:(id)cKey;

- (void)gtui_each:(void (^)(KeyType key, ObjectType obj))cb;

- (void)gtui_eachWithStop:(BOOL (^)(KeyType key, ObjectType obj))cb;

- (instancetype)gtui_map:(id (^)(KeyType key, ObjectType obj))cb;

- (instancetype)gtui_pick:(NSArray *)cKeys;

- (instancetype)gtui_Omit:(NSArray *)cKeys;

- (instancetype)gtui_merge:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END


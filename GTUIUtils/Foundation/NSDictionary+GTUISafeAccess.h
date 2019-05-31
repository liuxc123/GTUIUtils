//
//  NSDictionary+GTUISafeAccess.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (GTUISafeAccess)


- (nullable id)gtui_objectForKey:(id)cKey;

- (nullable NSString *)gtui_stringForKey:(id)cKey;

- (nullable NSNumber *)gtui_numberForKey:(id)cKey;

- (nullable NSArray *)gtui_arrayForKey:(id)cKey;

- (nullable NSMutableArray *)gtui_mutableArrayForKey:(id)cKey;

- (nullable NSDictionary *)gtui_dictionaryForKey:(id)cKey;

- (nullable NSMutableDictionary *)gtui_mutableDictionaryForKey:(id)cKey;

- (NSInteger)gtui_integerForKey:(id)cKey;

- (NSUInteger)gtui_unsignedIntegerForKey:(id)cKey;

- (BOOL)gtui_boolForKey:(id)cKey;

- (float)gtui_floatForKey:(id)cKey;

- (double)gtui_doubleForKey:(id)cKey;

- (CGFloat)gtui_CGFloatForKey:(id)cKey;

- (CGPoint)gtui_pointForKey:(id)cKey;

- (CGSize)gtui_sizeForKey:(id)cKey;

- (CGRect)gtui_rectForKey:(id)cKey;


@end



/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  NSMutableDictionary
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

@interface NSMutableDictionary(GTUISafeAccess)


- (void)gtui_setObj:(id)a forKey:(NSString *)cKey;

- (void)gtui_setInteger:(NSInteger)a forKey:(NSString *)cKey;

- (void)gtui_setUnsignedInteger:(NSUInteger)a forKey:(NSString *)cKey;

- (void)gtui_setBool:(BOOL)a forKey:(NSString *)cKey;

- (void)gtui_setFloat:(float)a forKey:(NSString *)cKey;

- (void)gtui_setDouble:(double)a forKey:(NSString *)cKey;

- (void)gtui_setCGFloat:(CGFloat)a forKey:(NSString *)cKey;

- (void)gtui_setPoint:(CGPoint)a forKey:(NSString *)cKey;

- (void)gtui_setSize:(CGSize)a forKey:(NSString *)cKey;

- (void)gtui_setRect:(CGRect)a forKey:(NSString *)cKey;


@end

NS_ASSUME_NONNULL_END

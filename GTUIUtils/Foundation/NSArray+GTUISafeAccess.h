//
//  NSArray+GTUISafeAccess.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (GTUISafeAccess)


- (nullable id)gtui_objectWithIndex:(NSUInteger)cIndex;

- (nullable NSString *)gtui_stringWithIndex:(NSUInteger)cIndex;

- (nullable NSNumber *)gtui_numberWithIndex:(NSUInteger)cIndex;

- (nullable NSArray *)gtui_arrayWithIndex:(NSUInteger)cIndex;

- (nullable NSMutableArray *)gtui_mutableArrayWithIndex:(NSUInteger)cIndex;

- (nullable NSDictionary *)gtui_dictionaryWithIndex:(NSUInteger)cIndex;

- (nullable NSMutableDictionary *)gtui_mutableDictionaryWithIndex:(NSUInteger)cIndex;

- (NSInteger)gtui_integerWithIndex:(NSUInteger)cIndex;

- (NSUInteger)gtui_unsignedIntegerWithIndex:(NSUInteger)cIndex;

- (BOOL)gtui_boolWithIndex:(NSUInteger)cIndex;

- (float)gtui_floatWithIndex:(NSUInteger)cIndex;

- (double)gtui_doubleWithIndex:(NSUInteger)cIndex;

- (CGFloat)gtui_CGFloatWithIndex:(NSUInteger)cIndex;

- (CGPoint)gtui_pointWithIndex:(NSUInteger)cIndex;

- (CGSize)gtui_sizeWithIndex:(NSUInteger)cIndex;

- (CGRect)gtui_rectWithIndex:(NSUInteger)cIndex;


@end



/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  NSMutableArray
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

@interface NSMutableArray (GTUISafeAccess)


- (void)gtui_addObj:(id)a;

- (void)gtui_addInteger:(NSInteger)a;

- (void)gtui_addUnsignedInteger:(NSUInteger)a;

- (void)gtui_addBool:(BOOL)a;

- (void)gtui_addFloat:(float)a;

- (void)gtui_addDouble:(double)a;

- (void)gtui_addCGFloat:(CGFloat)a;

- (void)gtui_addPoint:(CGPoint)a;

- (void)gtui_addSize:(CGSize)a;

- (void)gtui_addRect:(CGRect)a;


@end

NS_ASSUME_NONNULL_END

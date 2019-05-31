//
//  UINavigationController+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Relationship
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Relationship

@property (nullable,readonly,copy) __kindof UIViewController *gtui_rootVC;

@property (readonly) BOOL gtui_onlyHasRootVC;

- (nullable __kindof UIViewController *)gtui_findVC:(NSString *)className;

- (nullable __kindof UIViewController *)gtui_findReverseVC:(NSString *)className;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  StoryboardLink
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - StoryboardLink

@property (nullable,nonatomic,copy) IBInspectable NSString *gtui_storyboardNameAndID;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Pop
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Pop

- (nullable NSArray<__kindof UIViewController *> *)gtui_popToVC:(NSString *)className animated:(BOOL)animated;
- (nullable NSArray<__kindof UIViewController *> *)gtui_popToIndex:(NSUInteger)cIndex  animated:(BOOL)animated;


@end


NS_ASSUME_NONNULL_END

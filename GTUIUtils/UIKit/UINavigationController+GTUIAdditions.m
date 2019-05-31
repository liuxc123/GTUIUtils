//
//  UINavigationController+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UINavigationController+GTUIAdditions.h"
#import "GTUIMacro.h"
#import "NSArray+GTUIAdditions.h"
#import "NSObject+GTUIAdditions.h"

@implementation UINavigationController (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Relationship
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Relationship

- (UIViewController *)gtui_rootVC
{
    if (self.viewControllers.count > 0) {
        UIViewController *curVC = [self.viewControllers firstObject];
        return curVC;
    }
    return nil;
}

- (BOOL)gtui_onlyHasRootVC
{
    if (self.viewControllers.count == 1) {
        return YES;
    }
    return NO;
}

- (UIViewController *)gtui_findVC:(NSString *)className
{
    __block UIViewController *curVC = nil;
    [self.viewControllers gtui_eachWithStop:^BOOL(__kindof UIViewController * _Nonnull obj, NSUInteger index) {
        if ([obj isKindOfClass:NSClassFromString(className)]) {
            curVC = obj;
            return YES;
        }
        return NO;
    }];
    return curVC;
}

- (UIViewController *)gtui_findReverseVC:(NSString *)className
{
    __block UIViewController *curVC = nil;
    [self.viewControllers gtui_eachReverseWithStop:^BOOL(__kindof UIViewController * _Nonnull obj, NSUInteger index) {
        if ([obj isKindOfClass:NSClassFromString(className)]) {
            curVC = obj;
            return YES;
        }
        return NO;
    }];
    return curVC;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  StoryboardLink
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - StoryboardLink

- (NSString *)gtui_storyboardNameAndID
{
    return [self gtui_getAssociatedObjectWithKey:@selector(gtui_storyboardNameAndID)];
}
- (void)setGtui_storyboardNameAndID:(NSString *)gtui_storyboardNameAndID
{
    [self gtui_setAssociatedCopyObject:gtui_storyboardNameAndID key:@selector(gtui_storyboardNameAndID)];
    [self gtui_setRootViewController];
}

- (void)gtui_setRootViewController
{
    NSArray *components = [self.gtui_storyboardNameAndID componentsSeparatedByString:@"."];
    NSString *curStoryboardName = nil;
    NSString *curStoryboardID = nil;
    if (components.count > 0) {
        curStoryboardName = components[0];
        if (components.count > 1) {
            curStoryboardID = components[1];
        }
    }

    if (curStoryboardName) {
        UIViewController *curRootVC = nil;
        if (curStoryboardID) {
            curRootVC = gStoryboardInstantiate(curStoryboardName, curStoryboardID);
        } else {
            curRootVC = gStoryboardInitialViewController(curStoryboardName);
        }
        GTUIAssert(curRootVC, @"check storyboardNameAndID");
        [self setViewControllers:@[curRootVC] animated:NO];
    }
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Pop
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Pop

- (NSArray<UIViewController *> *)gtui_popToVC:(NSString *)className animated:(BOOL)animated
{
    UIViewController *curVC = [self gtui_findReverseVC:className];
    NSArray *curAry = [self popToViewController:curVC animated:animated];
    return curAry;
}

- (NSArray<UIViewController *> *)gtui_popToIndex:(NSUInteger)cIndex animated:(BOOL)animated
{
    NSUInteger curCount = self.viewControllers.count;
    if (cIndex < curCount-1) {
        UIViewController *curVC = self.viewControllers[cIndex];
        NSArray *curAry = [self popToViewController:curVC animated:animated];
        return curAry;
    }
    return self.viewControllers;
}


@end

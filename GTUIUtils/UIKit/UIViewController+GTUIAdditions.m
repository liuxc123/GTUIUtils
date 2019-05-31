//
//  UIViewController+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UIViewController+GTUIAdditions.h"
#import "GTUIMacro.h"
#import "UIView+GTUIAdditions.h"
#import "NSObject+GTUIAdditions.h"
#import "NSString+GTUIRegex.h"

@implementation UIViewController (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Relationship
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Relationship

- (NSString *)gtui_identifier
{
    NSString *curIdentifier = [self gtui_getAssociatedObjectWithKey:_cmd];
    if (curIdentifier) return curIdentifier;

    NSString *curClassName = NSStringFromClass([self class]);
    curIdentifier = [curClassName gtui_regex:@"(?<=^SUI)\\S+(?=VC$)"];
    GTUIAssert(curIdentifier, @"className should prefix with 'SUI' and suffix with 'VC'");

    if (!kNilOrNull(curClassName)) {
        [self gtui_setAssociatedCopyObject:curClassName key:_cmd];
    }
    return curIdentifier;
}

- (UITableView *)gtui_tableView
{
    UITableView *curTableView = [self gtui_getAssociatedObjectWithKey:@selector(gtui_tableView)];
    if (curTableView) return curTableView;

    if ([self isKindOfClass:[UITableViewController class]]) {
        curTableView = (UITableView *)self.view;
    } else {
        curTableView = [self.view gtui_findSubview:@"UITableView"];
    }

    if (curTableView) self.gtui_tableView = curTableView;
    return curTableView;
}
- (void)setGtui_tableView:(UITableView *)gtui_tableView
{
    gtui_tableView.gtui_vc = self;
    [self gtui_setAssociatedRetainObject:gtui_tableView key:@selector(gtui_tableView)];
}

- (UIViewController *)gtui_sourceVC
{
    __block UIViewController *curVC = [self gtui_getAssociatedObjectWithKey:@selector(gtui_sourceVC)];
    if (curVC) return curVC;

    if (self.navigationController) {
        __block BOOL curFlag = NO;
        [self.navigationController.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (curFlag) {
                curVC = obj;
                self.gtui_sourceVC = curVC;
                *stop = YES;
            }
            if (obj == self) {
                curFlag = YES;
            }
        }];
    }
    return curVC;
}
- (void)setGtui_sourceVC:(UIViewController *)gtui_sourceVC
{
    [self gtui_setAssociatedAssignObject:gtui_sourceVC key:@selector(gtui_sourceVC)];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  NavBack
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - NavBack

- (IBAction)gtui_popToLastVC:(UIStoryboardSegue *)unwindSegue {}

- (IBAction)gtui_backToLast
{
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count == 1) {
            [self.navigationController dismissViewControllerAnimated:YES completion:^{
            }];
        } else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else {
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }
}

- (IBAction)gtui_backToRoot
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  StoryboardLink
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - StoryboardLink

- (void)gtui_storyboardSegueWithIdentifier:(NSString *)cIdentifier
{
    [self performSegueWithIdentifier:cIdentifier sender:self];
}
- (void)gtui_storyboardInstantiate:(NSString *)gtui_storyboardNameAndID
{
    [self gtui_storyboardInstantiate:gtui_storyboardNameAndID segueType:GTUISegueTypePush];
}
- (void)gtui_storyboardInstantiate:(NSString *)gtui_storyboardNameAndID segueType:(GTUISegueType)cType
{
    NSArray *components = [gtui_storyboardNameAndID componentsSeparatedByString:@"."];
    NSString *curStoryboardName = nil;
    NSString *curStoryboardID = nil;
    if (components.count == 1) {
        curStoryboardID = components[0];
    } else if (components.count > 1) {
        curStoryboardName = components[0];
        curStoryboardID = components[1];
    }

    UIStoryboard *curStoryboard = nil;
    if (curStoryboardName) {
        curStoryboard = gStoryboardNamed(curStoryboardName);
    } else {
        curStoryboard = self.storyboard;
    }
    [self gtui_storyboardInstantiateWithStoryboard:curStoryboard storyboardID:curStoryboardID segueType:cType];
}
- (void)gtui_storyboardInstantiateWithStoryboard:(UIStoryboard *)cStoryboard storyboardID:(NSString *)cStoryboardID segueType:(GTUISegueType)cType
{
    UIViewController *curVC = nil;
    if (cStoryboardID) {
        curVC = [cStoryboard instantiateViewControllerWithIdentifier:cStoryboardID];
    } else {
        curVC = cStoryboard.instantiateInitialViewController;
    }

    if ([curVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *curNav = (UINavigationController *)curVC;
        curNav.topViewController.gtui_sourceVC = self;
        [self presentViewController:curVC animated:YES completion:nil];
    } else {
        curVC.gtui_sourceVC = self;
        if (cType == GTUISegueTypePush) {
            [self.navigationController pushViewController:curVC animated:YES];
        } else {
            [self presentViewController:curVC animated:YES completion:nil];
        }
    }
}

__attribute__((constructor))
void gtui_segue(void) {
    Class curClass = [UIViewController class];
    SEL originSel = @selector(prepareForSegue:sender:);
    SEL swizzSel = @selector(gtui_prepareForSegue:sender:);
    Method originMethod = class_getInstanceMethod(curClass, originSel);
    Method swizzMthod = class_getInstanceMethod(curClass, swizzSel);

    BOOL didAdd = class_addMethod(curClass,
                                  originSel,
                                  method_getImplementation(swizzMthod),
                                  method_getTypeEncoding(swizzMthod));
    if (didAdd) {
        class_replaceMethod(curClass,
                            swizzSel,
                            method_getImplementation(originMethod),
                            method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, swizzMthod);
    }
}

- (void)gtui_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self gtui_prepareForSegue:segue sender:sender];

    UIViewController *sourceVC = segue.sourceViewController;
    UIViewController *destVC = segue.destinationViewController;

    if ([destVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *curNav = (UINavigationController *)destVC;
        curNav.topViewController.gtui_sourceVC = sourceVC;
    } else {
        destVC.gtui_sourceVC = sourceVC;
        destVC.hidesBottomBarWhenPushed = YES;
    }
}

+ (UIViewController *)gtui_viewControllerWithStoryboard:(nullable NSString *)storyboard identifier:(NSString *)identifier {
    NSString *storyboardName = storyboard ?: @"Main";
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:identifier];
}

/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Geometry
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Geometry

- (CGFloat)gtui_opaqueNavBarHeight
{
    CGFloat curNavBarHeight = 0;
    UINavigationBar *curNavigationBar = self.navigationController.navigationBar;
    if (!curNavigationBar.translucent) {
        curNavBarHeight += curNavigationBar.bounds.size.height;
        if (![self prefersStatusBarHidden]) {
            curNavBarHeight += [UIApplication sharedApplication].statusBarFrame.size.height;
        }
    }
    return curNavBarHeight;
}
- (CGFloat)gtui_translucentNavBarHeight
{
    CGFloat curNavBarHeight = 0;
    UINavigationBar *curNavigationBar = self.navigationController.navigationBar;
    if (curNavigationBar.translucent) {
        curNavBarHeight += curNavigationBar.bounds.size.height;
        if (![self prefersStatusBarHidden]) {
            curNavBarHeight += [UIApplication sharedApplication].statusBarFrame.size.height;
        }
    }
    return curNavBarHeight;
}

- (CGFloat)gtui_opaqueTabBarHeight
{
    UITabBar *curTabBar = self.navigationController.tabBarController.tabBar;
    if (!curTabBar.translucent && ![self hidesBottomBarWhenPushed]) {
        return curTabBar.bounds.size.height;
    }
    return 0;
}
- (CGFloat)gtui_translucentTabBarHeight
{
    UITabBar *curTabBar = self.navigationController.tabBarController.tabBar;
    if (curTabBar.translucent && ![self hidesBottomBarWhenPushed]) {
        return curTabBar.bounds.size.height;
    }
    return 0;
}

- (CGRect)gtui_viewFrame
{
    return CGRectMake(0, 0, self.view.gtui_width, kScreenHeight-self.gtui_opaqueNavBarHeight-self.gtui_opaqueTabBarHeight);
}


@end



/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  UITableView
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

@implementation UITableView (GTUIViewController)


- (UIViewController *)gtui_vc
{
    UIViewController *curVC = [self gtui_getAssociatedObjectWithKey:@selector(gtui_vc)];
    if (curVC) return curVC;

    curVC = [self gtui_currentVC];
    if (curVC) {
        self.gtui_vc = curVC;
    }
    return curVC;
}

- (void)setGtui_vc:(UIViewController *)gtui_vc
{
    [self gtui_setAssociatedAssignObject:gtui_vc key:@selector(gtui_vc)];
}


@end

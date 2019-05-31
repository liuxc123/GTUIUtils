//
//  UIViewController+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GTUISegueType) {
    GTUISegueTypePush = 0,
    GTUISegueTypeModal = 1
};

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Relationship
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Relationship

@property (nullable,readonly,copy) NSString *gtui_identifier;
@property (nullable,nonatomic,strong) __kindof UITableView *gtui_tableView;
@property (nullable,nonatomic,weak) __kindof UIViewController *gtui_sourceVC;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  NavBack
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - NavBack

- (IBAction)gtui_backToLast;
- (IBAction)gtui_backToRoot;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  StoryboardLink
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - StoryboardLink

- (void)gtui_storyboardSegueWithIdentifier:(NSString *)cIdentifier;
- (void)gtui_storyboardInstantiate:(NSString *)gtui_storyboardNameAndID;
- (void)gtui_storyboardInstantiate:(NSString *)gtui_storyboardNameAndID segueType:(GTUISegueType)cType;
- (void)gtui_storyboardInstantiateWithStoryboard:(UIStoryboard *)cStoryboard storyboardID:(nullable NSString *)cStoryboardID segueType:(GTUISegueType)cType;

- (void)gtui_prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

/**
 *  返回storybosrd中指定identifer的控制器
 *
 *  @param storyboard     控制器所在的storyboard
 *  @param identifier     控制器在storyboard中指定的标识符
 *
 *  @return 指定identifer的控制器
 */
+ (__kindof UIViewController *)gtui_viewControllerWithStoryboard:(nullable NSString *)storyboard identifier:(NSString *)identifier;

/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Geometry
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Geometry

@property (readonly) CGFloat gtui_opaqueNavBarHeight;
@property (readonly) CGFloat gtui_translucentNavBarHeight;
@property (readonly) CGFloat gtui_opaqueTabBarHeight;
@property (readonly) CGFloat gtui_translucentTabBarHeight;
@property (readonly) CGRect gtui_viewFrame;


@end



/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  UITableView
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

@interface UITableView (GTUIViewController)


@property (nullable,nonatomic,weak) UIViewController *gtui_vc;


@end

NS_ASSUME_NONNULL_END

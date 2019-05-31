//
//  UIScrollView+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Content
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Content

@property (nonatomic) CGFloat gtui_contentWidth;
@property (nonatomic) CGFloat gtui_contentHeight;
@property (nonatomic) CGFloat gtui_contentOffsetX;
@property (nonatomic) CGFloat gtui_contentOffsetY;

@property (readonly) CGFloat gtui_contentRealTop;
@property (readonly) CGFloat gtui_contentRealBottom;
@property (readonly) CGFloat gtui_contentRealLeft;
@property (readonly) CGFloat gtui_contentRealRight;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Scroll
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Scroll

@property (readonly) BOOL gtui_isScrollToTop;
@property (readonly) BOOL gtui_isScrollToBottom;
@property (readonly) BOOL gtui_isScrollToLeft;
@property (readonly) BOOL gtui_isScrollToRight;

- (void)gtui_scrollToTopAnimated:(BOOL)animated;
- (void)gtui_scrollToBottomAnimated:(BOOL)animated;
- (void)gtui_scrollToLeftAnimated:(BOOL)animated;
- (void)gtui_scrollToRightAnimated:(BOOL)animated;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  PageIndex
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - PageIndex

@property (readonly) NSUInteger gtui_pageIndexVartical;
@property (readonly) NSUInteger gtui_pageIndexHorizontal;
@property (readonly) NSUInteger gtui_pageTotalVartical;
@property (readonly) NSUInteger gtui_pageTotalHorizontal;

- (void)gtui_scrollToPageIndexVartical:(NSUInteger)pageIndex animated:(BOOL)animated;
- (void)gtui_scrollToPageIndexHorizontal:(NSUInteger)pageIndex animated:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END

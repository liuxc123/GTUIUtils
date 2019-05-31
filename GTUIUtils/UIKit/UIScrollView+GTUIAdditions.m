//
//  UIScrollView+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UIScrollView+GTUIAdditions.h"
#import "UIView+GTUIAdditions.h"

@implementation UIScrollView (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Content
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Content

- (CGFloat)gtui_contentWidth
{
    return self.contentSize.width;
}
- (void)setGtui_contentWidth:(CGFloat)gtui_contentWidth
{
    CGSize curSize = self.contentSize;
    if (curSize.width != gtui_contentWidth) {
        curSize.width = gtui_contentWidth;
        self.contentSize = curSize;
    }
}

- (CGFloat)gtui_contentHeight
{
    return self.contentSize.height;
}
- (void)setGtui_contentHeight:(CGFloat)gtui_contentHeight
{
    CGSize curSize = self.contentSize;
    if (curSize.height != gtui_contentHeight) {
        curSize.height = gtui_contentHeight;
        self.contentSize = curSize;
    }
}

- (CGFloat)gtui_contentOffsetX
{
    return self.contentOffset.x;
}
- (void)setGtui_contentOffsetX:(CGFloat)gtui_contentOffsetX
{
    CGPoint curPoint = self.contentOffset;
    if (curPoint.x != gtui_contentOffsetX) {
        curPoint.x = gtui_contentOffsetX;
        self.contentOffset = curPoint;
    }
}

- (CGFloat)gtui_contentOffsetY
{
    return self.contentOffset.y;
}
- (void)setGtui_contentOffsetY:(CGFloat)gtui_contentOffsetY
{
    CGPoint curPoint = self.contentOffset;
    if (curPoint.y != gtui_contentOffsetY) {
        curPoint.y = gtui_contentOffsetY;
        self.contentOffset = curPoint;
    }
}

- (CGFloat)gtui_contentRealTop
{
    return -self.contentInset.top;
}
- (CGFloat)gtui_contentRealBottom
{
    return self.contentSize.height + self.contentInset.bottom - self.bounds.size.height;
}
- (CGFloat)gtui_contentRealLeft
{
    return -self.contentInset.left;
}
- (CGFloat)gtui_contentRealRight
{
    return self.contentSize.width + self.contentInset.right - self.bounds.size.width;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Scroll
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Scroll

- (BOOL)gtui_isScrollToTop
{
    return self.gtui_contentOffsetY <= self.gtui_contentRealTop;
}
- (BOOL)gtui_isScrollToBottom
{
    return self.gtui_contentOffsetY >= self.gtui_contentRealBottom;
}
- (BOOL)gtui_isScrollToLeft
{
    return self.gtui_contentOffsetX <= self.gtui_contentRealLeft;
}
- (BOOL)gtui_isScrollToRight
{
    return self.gtui_contentOffsetX >= self.gtui_contentRealRight;
}

- (void)gtui_scrollToTopAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0, self.gtui_contentRealTop) animated:animated];
}
- (void)gtui_scrollToBottomAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0, self.gtui_contentRealBottom) animated:animated];
}
- (void)gtui_scrollToLeftAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.gtui_contentRealLeft, 0) animated:animated];
}
- (void)gtui_scrollToRightAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.gtui_contentRealRight, 0) animated:animated];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  PageIndex
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - PageIndex

- (NSUInteger)gtui_pageIndexVartical
{
    NSUInteger curPageIndex = self.gtui_contentOffsetY / self.gtui_height;
    return curPageIndex;
}
- (NSUInteger)gtui_pageIndexHorizontal
{
    NSUInteger curPageIndex = self.gtui_contentOffsetX / self.gtui_width;
    return curPageIndex;
}
- (NSUInteger)gtui_pageTotalVartical
{
    NSUInteger curPageTotal = self.gtui_contentHeight / self.gtui_height;
    return curPageTotal;
}
- (NSUInteger)gtui_pageTotalHorizontal
{
    NSUInteger curPageTotal = self.gtui_contentWidth / self.gtui_width;
    return curPageTotal;
}

- (void)gtui_scrollToPageIndexVartical:(NSUInteger)pageIndex animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0, self.gtui_height * pageIndex) animated:animated];
}
- (void)gtui_scrollToPageIndexHorizontal:(NSUInteger)pageIndex animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.gtui_width * pageIndex, 0) animated:animated];
}


@end

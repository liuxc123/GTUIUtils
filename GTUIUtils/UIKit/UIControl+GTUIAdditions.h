//
//  UIControl+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (GTUIAdditions)


@property (nonatomic) BOOL gtui_enabled;
@property (nonatomic) BOOL gtui_selected;
@property (nonatomic) BOOL gtui_highlighted;

- (void)gtui_click:(void (^)(void))cb;
- (void)gtui_controlEvents:(UIControlEvents)controlEvents cb:(void (^)(void))cb;


@end

NS_ASSUME_NONNULL_END

//
//  UILabel+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (GTUIAdditions)


/**
 *  set text hex color
 */
@property (assign,nonatomic) IBInspectable NSString *gtui_textHexColor;

/**
 *  为UILabel添加中划线
 *
 *  @param lineColor     划线颜色
 *  @param lineTextColor 划线文本颜色
 *  @param range         划线范围
 */
- (void)gtui_addHorizontalLineWithColor:(UIColor *)lineColor lineTextColor:(UIColor *)lineTextColor range:(NSRange)range;

- (CGFloat)gtui_calculateHeight;

- (CGSize)gtui_calculateSize;


@end

NS_ASSUME_NONNULL_END

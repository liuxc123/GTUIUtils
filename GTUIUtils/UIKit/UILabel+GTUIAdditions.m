//
//  UILabel+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UILabel+GTUIAdditions.h"
#import "NSString+GTUIAdditions.h"
#import "UIView+GTUIAdditions.h"

@implementation UILabel (GTUIAdditions)


- (CGFloat)gtui_calculateHeight
{
    return [self.text gtui_heightWithFont:self.font constrainedToWidth:self.gtui_width];
}

- (CGSize)gtui_calculateSize
{
    return [self.text gtui_sizeWithFont:self.font constrainedToWidth:self.gtui_width];
}

#pragma mark - hexRgbColor

- (NSString *)gtui_textHexColor
{
    return @"0xffffff";
}

- (void)setGtui_textHexColor:(NSString *)gtui_textHexColor {
    NSScanner *scanner = [NSScanner scannerWithString:gtui_textHexColor];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return;
    self.textColor = [self gtui_colorWithRGBHex:hexNum];
}

- (UIColor *)gtui_colorWithRGBHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;

    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

- (void)gtui_addHorizontalLineWithColor:(UIColor *)lineColor lineTextColor:(UIColor *)lineTextColor range:(NSRange)range
{

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    UIColor *textColor = nil;
    lineTextColor == nil ? (textColor = self.textColor) : (textColor = lineTextColor);
    [attributedString addAttribute:NSForegroundColorAttributeName value:textColor range:range];
    [attributedString addAttribute:NSStrikethroughColorAttributeName value:lineColor range:range];
    self.attributedText = attributedString;
}

@end

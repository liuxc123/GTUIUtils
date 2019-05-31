//
//  UIButton+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UIButton+GTUIAdditions.h"
#import "UIImage+GTUIAdditions.h"

@implementation UIButton (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Normal
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Normal

- (NSString *)gtui_normalTitle
{
    return [self titleForState:UIControlStateNormal];
}
- (void)setGtui_normalTitle:(NSString *)gtui_normalTitle
{
    [self setTitle:gtui_normalTitle forState:UIControlStateNormal];
}

- (UIColor *)gtui_normalTitleColo
{
    return [self titleColorForState:UIControlStateNormal];
}
- (void)setGtui_normalTitleColo:(UIColor *)gtui_normalTitleColo
{
    [self setTitleColor:gtui_normalTitleColo forState:UIControlStateNormal];
}

- (UIImage *)gtui_normalImage
{
    return [self imageForState:UIControlStateNormal];
}
- (void)setGtui_normalImage:(UIImage *)gtui_normalImage
{
    [self setImage:gtui_normalImage forState:UIControlStateNormal];
}

- (UIImage *)gtui_normalBackgroundImage
{
    return [self backgroundImageForState:UIControlStateNormal];
}
- (void)setGtui_normalBackgroundImage:(UIImage *)gtui_normalBackgroundImage
{
    [self setBackgroundImage:gtui_normalBackgroundImage forState:UIControlStateNormal];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Highlighted
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Highlighted

- (NSString *)gtui_highlightedTitle
{
    return [self titleForState:UIControlStateHighlighted];
}
- (void)setGtui_highlightedTitle:(NSString *)gtui_highlightedTitle
{
    [self setTitle:gtui_highlightedTitle forState:UIControlStateHighlighted];
}

- (UIColor *)gtui_highlightedTitleColo
{
    return [self titleColorForState:UIControlStateHighlighted];
}
- (void)setGtui_highlightedTitleColo:(UIColor *)gtui_highlightedTitleColo
{
    [self setTitleColor:gtui_highlightedTitleColo forState:UIControlStateHighlighted];
}

- (UIImage *)gtui_highlightedImage
{
    return [self imageForState:UIControlStateHighlighted];
}
- (void)setGtui_highlightedImage:(UIImage *)gtui_highlightedImage
{
    [self setImage:gtui_highlightedImage forState:UIControlStateHighlighted];
}

- (UIImage *)gtui_highlightedBackgroundImage
{
    return [self backgroundImageForState:UIControlStateHighlighted];
}
- (void)setGtui_highlightedBackgroundImage:(UIImage *)gtui_highlightedBackgroundImage
{
    [self setBackgroundImage:gtui_highlightedBackgroundImage forState:UIControlStateHighlighted];

}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Selected
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Selected

- (NSString *)gtui_selectedTitle
{
    return [self titleForState:UIControlStateSelected];
}
- (void)setGtui_selectedTitle:(NSString *)gtui_selectedTitle
{
    [self setTitle:gtui_selectedTitle forState:UIControlStateSelected];
}

- (UIColor *)gtui_selectedTitleColo
{
    return [self titleColorForState:UIControlStateSelected];
}
- (void)setGtui_selectedTitleColo:(UIColor *)gtui_selectedTitleColo
{
    [self setTitleColor:gtui_selectedTitleColo forState:UIControlStateSelected];
}

- (UIImage *)gtui_selectedImage
{
    return [self imageForState:UIControlStateSelected];
}
- (void)setGtui_selectedImage:(UIImage *)gtui_selectedImage
{
    [self setImage:gtui_selectedImage forState:UIControlStateSelected];
}

- (UIImage *)gtui_selectedBackgroundImage
{
    return [self backgroundImageForState:UIControlStateSelected];
}
- (void)setGtui_selectedBackgroundImage:(UIImage *)gtui_selectedBackgroundImage
{
    [self setBackgroundImage:gtui_selectedBackgroundImage forState:UIControlStateSelected];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Disabled
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Disabled

- (NSString *)gtui_disabledTitle
{
    return [self titleForState:UIControlStateDisabled];
}
- (void)setGtui_disabledTitle:(NSString *)gtui_disabledTitle
{
    [self setTitle:gtui_disabledTitle forState:UIControlStateDisabled];
}

- (UIColor *)gtui_disabledTitleColo
{
    return [self titleColorForState:UIControlStateDisabled];
}
- (void)setGtui_disabledTitleColo:(UIColor *)gtui_disabledTitleColo
{
    [self setTitleColor:gtui_disabledTitleColo forState:UIControlStateDisabled];
}

- (UIImage *)gtui_disabledImage
{
    return [self imageForState:UIControlStateDisabled];
}
- (void)setGtui_disabledImage:(UIImage *)gtui_disabledImage
{
    [self setImage:gtui_disabledImage forState:UIControlStateDisabled];
}

- (UIImage *)gtui_disabledBackgroundImage
{
    return [self backgroundImageForState:UIControlStateDisabled];
}
- (void)setGtui_disabledBackgroundImage:(UIImage *)gtui_disabledBackgroundImage
{
    [self setBackgroundImage:gtui_disabledBackgroundImage forState:UIControlStateDisabled];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Padding & Insets
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Padding & Insets

- (CGFloat)gtui_padding
{
    UIEdgeInsets curInsets = self.contentEdgeInsets;
    if (curInsets.left == curInsets.right) {
        return curInsets.left;
    }
    return 0;
}
- (void)setGtui_padding:(CGFloat)gtui_padding
{
    self.contentEdgeInsets = UIEdgeInsetsMake(0, gtui_padding, 0, gtui_padding);
    [self sizeToFit];
}

- (UIEdgeInsets)gtui_insets
{
    return self.contentEdgeInsets;
}
- (void)setGtui_insets:(UIEdgeInsets)gtui_insets
{
    self.contentEdgeInsets = gtui_insets;
    [self sizeToFit];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  TintColor
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - TintColor

- (UIColor *)gtui_imageTintColor
{
    return nil;
}
- (void)setGtui_imageTintColor:(UIColor *)gtui_imageTintColor
{
    if (gtui_imageTintColor) {
        UIImage *curImage = [[self currentImage] gtui_imageWithGradientTintColor:gtui_imageTintColor];
        self.gtui_normalImage = curImage;
    }
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Resizable
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Resizable

- (BOOL)gtui_resizableImage
{
    self.gtui_resizableImage = YES;
    return YES;
}
- (void)setGtui_resizableImage:(BOOL)gtui_resizableImage
{
    if (gtui_resizableImage) {
        UIEdgeInsets curInsets = UIEdgeInsetsMake(self.currentImage.size.height/2-1,
                                                  self.currentImage.size.width/2-1,
                                                  self.currentImage.size.height/2,
                                                  self.currentImage.size.width/2);
        self.gtui_normalImage = [self.currentImage resizableImageWithCapInsets:curInsets resizingMode:UIImageResizingModeStretch];
    }
}

- (BOOL)gtui_resizableBackground
{
    self.gtui_resizableBackground = YES;
    return YES;
}
- (void)setGtui_resizableBackground:(BOOL)gtui_resizableBackground
{
    if (gtui_resizableBackground) {
        UIEdgeInsets curInsets = UIEdgeInsetsMake(self.currentBackgroundImage.size.height/2-1,
                                                  self.currentBackgroundImage.size.width/2-1,
                                                  self.currentBackgroundImage.size.height/2,
                                                  self.currentBackgroundImage.size.width/2);
        self.gtui_normalBackgroundImage = [self.currentBackgroundImage resizableImageWithCapInsets:curInsets resizingMode:UIImageResizingModeStretch];
    }
}

#pragma mark - hexRgbColor
- (NSString *)gtui_titleHexColor
{
    return @"0xffffff";
}

- (void)setGtui_titleHexColor:(NSString *)gtui_titleHexColor {
    NSScanner *scanner = [NSScanner scannerWithString:gtui_titleHexColor];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return;
    [self setTitleColor:[self gtui_colorWithRGBHex:hexNum] forState:UIControlStateNormal];
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


@end

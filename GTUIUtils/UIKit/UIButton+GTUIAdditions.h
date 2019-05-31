//
//  UIButton+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Normal
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Normal

@property (nullable,nonatomic,copy) NSString *gtui_normalTitle;
@property (nullable,nonatomic,copy) UIColor *gtui_normalTitleColo;
@property (nullable,nonatomic,copy) UIImage *gtui_normalImage;
@property (nullable,nonatomic,copy) UIImage *gtui_normalBackgroundImage;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Highlighted
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Highlighted

@property (nullable,nonatomic,copy) NSString *gtui_highlightedTitle;
@property (nullable,nonatomic,copy) UIColor *gtui_highlightedTitleColo;
@property (nullable,nonatomic,copy) UIImage *gtui_highlightedImage;
@property (nullable,nonatomic,copy) UIImage *gtui_highlightedBackgroundImage;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Selected
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Selected

@property (nullable,nonatomic,copy) NSString *gtui_selectedTitle;
@property (nullable,nonatomic,copy) UIColor *gtui_selectedTitleColo;
@property (nullable,nonatomic,copy) UIImage *gtui_selectedImage;
@property (nullable,nonatomic,copy) UIImage *gtui_selectedBackgroundImage;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Disabled
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Disabled

@property (nullable,nonatomic,copy) NSString *gtui_disabledTitle;
@property (nullable,nonatomic,copy) UIColor *gtui_disabledTitleColo;
@property (nullable,nonatomic,copy) UIImage *gtui_disabledImage;
@property (nullable,nonatomic,copy) UIImage *gtui_disabledBackgroundImage;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Padding & Insets
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Padding & Insets

@property (nonatomic) CGFloat gtui_padding; // left & right
@property (nonatomic) UIEdgeInsets gtui_insets;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  TintColor
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - TintColor

@property (nullable,nonatomic,copy) IBInspectable UIColor *gtui_imageTintColor;

/**
 *  set text hex color
 */
@property (nullable,assign,nonatomic) IBInspectable NSString *gtui_titleHexColor;

/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Resizable
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Resizable

@property (nonatomic) IBInspectable BOOL gtui_resizableImage;
@property (nonatomic) IBInspectable BOOL gtui_resizableBackground;


@end

NS_ASSUME_NONNULL_END

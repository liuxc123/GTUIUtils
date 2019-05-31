//
//  UIView+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Frame
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Frame

@property (nonatomic) CGFloat gtui_x;
@property (nonatomic) CGFloat gtui_y;
@property (nonatomic) CGFloat gtui_width;
@property (nonatomic) CGFloat gtui_height;
@property (nonatomic) CGPoint gtui_origin;
@property (nonatomic) CGSize gtui_size;
@property (readonly) CGFloat gtui_right; // (x + width).
@property (readonly) CGFloat gtui_bottom; // (y + height).
@property (nonatomic) CGFloat gtui_centerX; // (x + width/2).
@property (nonatomic) CGFloat gtui_centerY; // (y + height/2).


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Constraint
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Constraint

- (nullable NSLayoutConstraint *)gtui_constraintTop;
- (nullable NSLayoutConstraint *)gtui_constraintBottom;
- (nullable NSLayoutConstraint *)gtui_constraintLeading;
- (nullable NSLayoutConstraint *)gtui_constraintTrailing;
- (nullable NSLayoutConstraint *)gtui_constraintWidth;
- (nullable NSLayoutConstraint *)gtui_constraintHeight;
- (nullable NSLayoutConstraint *)gtui_constraintCenterX;
- (nullable NSLayoutConstraint *)gtui_constraintCenterY;
- (nullable NSLayoutConstraint *)gtui_constraintBaseline;
- (void)gtui_layoutPinnedToSuperview;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Nib
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Nib

@property (nonatomic) IBInspectable BOOL gtui_loadNib;

+ (instancetype)gtui_loadInstanceFromNib;
+ (instancetype)gtui_loadInstanceFromNibWithName:(NSString *)nibName;
+ (instancetype)gtui_loadInstanceFromNibWithName:(NSString *)nibName owner:(nullable id)owner;
+ (instancetype)gtui_loadInstanceFromNibWithName:(NSString *)nibName owner:(nullable id)owner bundle:(NSBundle *)bundle;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Layer
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Layer

@property (nonatomic) IBInspectable CGFloat gtui_cornerRadius; // Defaults to zero.

@property (nonatomic) CGFloat gtui_borderWidth; // Defaults to zero.
@property (nonatomic,copy) UIColor *gtui_borderColor; // Defaults to opaque black.

@property (nonatomic,copy) UIColor *gtui_shadowColor; // Defaults to opaque black
@property (nonatomic) CGFloat gtui_shadowOpacity; // Defaults to 0. [0,1]
@property (nonatomic) CGSize gtui_shadowOffset; // Defaults to (0, -3).
@property (nonatomic) CGFloat gtui_shadowRadius; // Defaults to 3.
@property (nonatomic) BOOL gtui_shadowPath; // Defaults to NO. When using animation set YES.


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Relationship
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Relationship

@property (nullable,readonly,copy) __kindof UIViewController *gtui_currentVC;

- (nullable __kindof UIView *)gtui_findSubview:(NSString *)className;
- (nullable __kindof UIView *)gtui_findSupview:(NSString *)className;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  GestureRecognizer
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - GestureRecognizer

- (void)gtui_addTapGes:(void (^)(UITapGestureRecognizer *cTapGes))cb;
- (void)gtui_addLongPressGes:(void (^)(UILongPressGestureRecognizer *cLongPressGes))cb;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Snapshot
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Snapshot

- (nullable UIView *)gtui_snapshotView:(BOOL)arterUpdates;
- (null_unspecified UIImage *)gtui_snapshotImage:(BOOL)arterUpdates;
- (null_unspecified UIImage *)gtui_snapshotWithRenderInContext;


@end

NS_ASSUME_NONNULL_END

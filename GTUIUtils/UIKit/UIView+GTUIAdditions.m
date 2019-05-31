//
//  UIView+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UIView+GTUIAdditions.h"
#import "GTUIMacro.h"
#import "NSObject+GTUIAdditions.h"

@implementation UIView (GTUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Frame
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Frame

- (CGFloat)gtui_x
{
    return self.frame.origin.x;
}
- (void)setGtui_x:(CGFloat)gtui_x
{
    CGRect curRect = self.frame;
    if (curRect.origin.x != gtui_x) {
        curRect.origin.x = gtui_x;
        self.frame = curRect;
    }
}

- (CGFloat)gtui_y
{
    return self.frame.origin.y;
}
- (void)setGtui_y:(CGFloat)gtui_y
{
    CGRect curRect = self.frame;
    if (curRect.origin.y != gtui_y) {
        curRect.origin.y = gtui_y;
        self.frame = curRect;
    }
}

- (CGFloat)gtui_width
{
    return self.frame.size.width;
}
- (void)setGtui_width:(CGFloat)gtui_width
{
    CGRect curRect = self.frame;
    if (curRect.size.width != gtui_width) {
        curRect.size.width = gtui_width;
        self.frame = curRect;
    }
}

- (CGFloat)gtui_height
{
    return self.frame.size.height;
}
- (void)setGtui_height:(CGFloat)gtui_height
{
    CGRect curRect = self.frame;
    if (curRect.size.height != gtui_height) {
        curRect.size.height = gtui_height;
        self.frame = curRect;
    }
}

- (CGPoint)gtui_origin
{
    return self.frame.origin;
}
- (void)setGtui_origin:(CGPoint)gtui_origin
{
    CGRect curRect = self.frame;
    if (!CGPointEqualToPoint(curRect.origin, gtui_origin)) {
        curRect.origin = gtui_origin;
        self.frame = curRect;
    }
}

- (CGSize)gtui_size
{
    return self.frame.size;
}
- (void)setGtui_size:(CGSize)gtui_size
{
    CGRect curRect = self.frame;
    if (!CGSizeEqualToSize(curRect.size, gtui_size)) {
        curRect.size = gtui_size;
        self.frame = curRect;
    }
}

- (CGFloat)gtui_right
{
    return CGRectGetMaxX(self.frame);
}
- (CGFloat)gtui_bottom
{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)gtui_centerX
{
    return CGRectGetMidX(self.frame);
}
- (void)setGtui_centerX:(CGFloat)gtui_centerX
{
    CGPoint curCenter = self.center;
    if (curCenter.x != gtui_centerX) {
        curCenter.x = gtui_centerX;
        self.center = curCenter;
    }
}
- (CGFloat)gtui_centerY
{
    return CGRectGetMidY(self.frame);
}
- (void)setGtui_centerY:(CGFloat)gtui_centerY
{
    CGPoint curCenter = self.center;
    if (curCenter.y != gtui_centerY) {
        curCenter.y = gtui_centerY;
        self.center = curCenter;
    }
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Constraint
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Constraint

- (NSLayoutConstraint *)gtui_constraintForAttribute:(NSLayoutAttribute)attribute
{
    NSArray *constraintArray = nil;
    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    } else {
        constraintArray = [self.superview constraints];
    }

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if (fillteredArray.count) {
        NSLayoutConstraint *curConstraint = fillteredArray.firstObject;
        return curConstraint;
    }
    return nil;
}

- (NSLayoutConstraint *)gtui_constraintTop
{
    return [self gtui_constraintForAttribute:NSLayoutAttributeTop];
}
- (NSLayoutConstraint *)gtui_constraintBottom
{
    return [self gtui_constraintForAttribute:NSLayoutAttributeBottom];
}
- (NSLayoutConstraint *)gtui_constraintLeading
{
    return [self gtui_constraintForAttribute:NSLayoutAttributeLeft];
}
- (NSLayoutConstraint *)gtui_constraintTrailing
{
    return [self gtui_constraintForAttribute:NSLayoutAttributeRight];
}
- (NSLayoutConstraint *)gtui_constraintWidth
{
    return [self gtui_constraintForAttribute:NSLayoutAttributeWidth];
}
- (NSLayoutConstraint *)gtui_constraintHeight
{
    return [self gtui_constraintForAttribute:NSLayoutAttributeHeight];
}
- (NSLayoutConstraint *)gtui_constraintCenterX
{
    return [self gtui_constraintForAttribute:NSLayoutAttributeCenterX];
}
- (NSLayoutConstraint *)gtui_constraintCenterY
{
    return [self gtui_constraintForAttribute:NSLayoutAttributeCenterY];
}
- (NSLayoutConstraint *)gtui_constraintBaseline
{
    return [self gtui_constraintForAttribute:NSLayoutAttributeBaseline];
}
- (void)gtui_layoutPinnedToSuperview
{
    GTUIAssert(self.superview, @"no superview ⤭ %@ ⤪", self);
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[self]-0-|"
                                             options:0
                                             metrics:nil
                                               views:NSDictionaryOfVariableBindings(self)]];
    [self.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[self]-0-|"
                                             options:0
                                             metrics:nil
                                               views:NSDictionaryOfVariableBindings(self)]];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Nib
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Nib

- (BOOL)gtui_loadNib
{
    UIView *curMainView = [self gtui_mainView];
    if (!curMainView) {
        [self setGtui_loadNib:YES];
    }
    return YES;
}
- (void)setGtui_loadNib:(BOOL)gtui_loadNib
{
    if (gtui_loadNib) {
        UIView *curMainView = [self gtui_mainView];
        if (!curMainView) {
            curMainView = [[NSBundle mainBundle] loadNibNamed:gClassName(self) owner:self options:nil][0];
            curMainView.frame = self.bounds;
            curMainView.backgroundColor = [UIColor clearColor];
            [self setGtui_mainView:curMainView];
            [self addSubview:curMainView];
            [curMainView gtui_layoutPinnedToSuperview];
        }
    } else {
        [self setGtui_mainView:nil];
    }
}

- (instancetype)gtui_mainView
{
    return [self gtui_getAssociatedObjectWithKey:@selector(gtui_mainView)];
}
- (void)setGtui_mainView:(UIView *)gtui_mainView
{
    [self gtui_setAssociatedRetainObject:gtui_mainView key:@selector(gtui_mainView)];
}

+ (instancetype)gtui_loadInstanceFromNib
{
    return [self gtui_loadInstanceFromNibWithName:NSStringFromClass([self class])];
}
+ (instancetype)gtui_loadInstanceFromNibWithName:(NSString *)nibName
{
    return [self gtui_loadInstanceFromNibWithName:nibName owner:nil];
}
+ (instancetype)gtui_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner
{
    return [self gtui_loadInstanceFromNibWithName:nibName owner:nil bundle:[NSBundle mainBundle]];
}
+ (instancetype)gtui_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle
{
    NSArray *nibViews = [bundle loadNibNamed:nibName owner:owner options:nil];
    UIView *curMainView = nil;
    for (id curObj in nibViews) {
        if ([curObj isKindOfClass:[self class]]) {
            curMainView = curObj;
            break;
        }
    }
    return curMainView;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Layer
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Layer

- (CGFloat)gtui_cornerRadius
{
    return self.layer.cornerRadius;
}
- (void)setGtui_cornerRadius:(CGFloat)gtui_cornerRadius
{
    self.layer.cornerRadius = gtui_cornerRadius;
    self.layer.masksToBounds = (gtui_cornerRadius > 0);
}

- (CGFloat )gtui_borderWidth
{
    return self.layer.borderWidth;
}
- (void)setGtui_borderWidth:(CGFloat)gtui_borderWidth
{
    self.layer.borderWidth = gtui_borderWidth;
}

- (UIColor *)gtui_borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
- (void)setGtui_borderColor:(UIColor *)gtui_borderColor
{
    self.layer.borderColor = [gtui_borderColor CGColor];
}

- (UIColor *)gtui_shadowColor
{
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}
- (void)setGtui_shadowColor:(UIColor *)gtui_shadowColor
{
    self.layer.shadowColor = [gtui_shadowColor CGColor];
}

- (CGFloat)gtui_shadowOpacity
{
    return self.layer.shadowOpacity;
}
- (void)setGtui_shadowOpacity:(CGFloat)gtui_shadowOpacity
{
    self.layer.shadowOpacity = gtui_shadowOpacity;
}

- (CGSize)gtui_shadowOffset
{
    return self.layer.shadowOffset;
}
- (void)setGtui_shadowOffset:(CGSize)gtui_shadowOffset
{
    self.layer.shadowOffset = gtui_shadowOffset;
}

- (CGFloat)gtui_shadowRadius
{
    return self.layer.shadowRadius;
}
- (void)setGtui_shadowRadius:(CGFloat)gtui_shadowRadius
{
    self.layer.shadowRadius = gtui_shadowRadius;
}

- (BOOL)gtui_shadowPath
{
    if (self.layer.shadowRadius) return YES;
    return NO;
}
- (void)setGtui_shadowPath:(BOOL)gtui_shadowPath
{
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:self.layer.bounds] CGPath];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Relationship
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Relationship

- (UIViewController *)gtui_currentVC
{
    Class aClass = NSClassFromString(@"UIViewController");
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:aClass]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UIView *)gtui_findSubview:(NSString *)className
{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:NSClassFromString(className)]) {
            return subView;
        }
    }
    return nil;
}
- (UIView *)gtui_findSupview:(NSString *)className;
{
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIView *curView = [next superview];
        if ([curView isKindOfClass:NSClassFromString(className)]) {
            return curView;
        }
    }
    return nil;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  GestureRecognizer
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - GestureRecognizer

- (void)gtui_addTapGes:(void (^)(UITapGestureRecognizer *cTapGes))cb
{
    if (!self.userInteractionEnabled) self.userInteractionEnabled = !self.userInteractionEnabled;
    UITapGestureRecognizer *curGesture = [self gtui_getAssociatedObjectWithKey:_cmd];
    if (!curGesture) {
        curGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gtui_handleTapGes:)];
        [self addGestureRecognizer:curGesture];
        [self gtui_setAssociatedRetainObject:curGesture key:_cmd];
    }
    [self gtui_setAssociatedCopyObject:cb key:@selector(gtui_handleTapGes:)];
}
- (void)gtui_handleTapGes:(UITapGestureRecognizer *)tapGes
{
    void (^gesBlock)(UITapGestureRecognizer *cTapGes) = [self gtui_getAssociatedObjectWithKey:_cmd];
    if (gesBlock) gesBlock(tapGes);
}

- (void)gtui_addLongPressGes:(void (^)(UILongPressGestureRecognizer *cLongPressGes))cb
{
    if (!self.userInteractionEnabled) self.userInteractionEnabled = !self.userInteractionEnabled;
    UILongPressGestureRecognizer *curGesture = [self gtui_getAssociatedObjectWithKey:_cmd];
    if (!curGesture) {
        curGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gtui_handleLongPressGes:)];
        [self addGestureRecognizer:curGesture];
        [self gtui_setAssociatedRetainObject:curGesture key:_cmd];
    }
    [self gtui_setAssociatedCopyObject:cb key:@selector(gtui_handleLongPressGes:)];
}
- (void)gtui_handleLongPressGes:(UILongPressGestureRecognizer *)longPressGes
{
    void (^gesBlock)(UILongPressGestureRecognizer *cLongPressGes) = [self gtui_getAssociatedObjectWithKey:_cmd];
    if (gesBlock) gesBlock(longPressGes);
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Snapshot
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Snapshot

- (UIView *)gtui_snapshotView:(BOOL)arterUpdates
{
    return [self snapshotViewAfterScreenUpdates:arterUpdates];
}
- (UIImage *)gtui_snapshotImage:(BOOL)arterUpdates
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0.0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:arterUpdates];
    UIImage *curImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return curImage;
}
- (UIImage *)gtui_snapshotWithRenderInContext
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *curImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return curImage;
}


@end

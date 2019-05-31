//
//  UIImage+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (GTUIAdditions)


- (UIImage * __null_unspecified)gtui_imageWithTintColor:(UIColor *)tintColo; // kCGBlendModeDestinationIn
- (UIImage * __null_unspecified)gtui_imageWithGradientTintColor:(UIColor *)tintColo; // kCGBlendModeOverlay
- (UIImage * __null_unspecified)gtui_imageWithTintColor:(UIColor *)tintColo blendMode:(CGBlendMode)blendMode;


@end

NS_ASSUME_NONNULL_END

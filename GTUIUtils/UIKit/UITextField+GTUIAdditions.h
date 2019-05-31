//
//  UITextField+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (GTUIAdditions)


@property (nonatomic) IBInspectable BOOL gtui_showKeyboard;

- (void)gtui_dismissKeyboard;


@end

NS_ASSUME_NONNULL_END

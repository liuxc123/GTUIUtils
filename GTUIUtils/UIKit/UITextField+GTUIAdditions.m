//
//  UITextField+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UITextField+GTUIAdditions.h"

@implementation UITextField (GTUIAdditions)


- (BOOL)gtui_showKeyboard
{
    if (![self isFirstResponder])
    {
        return [self becomeFirstResponder];
    }
    return YES;
}
- (void)setGtui_showKeyboard:(BOOL)gtui_showKeyboard
{
    if (gtui_showKeyboard && ![self isFirstResponder])
    {
        [self becomeFirstResponder];
    }
}

- (void)gtui_dismissKeyboard
{
    if (self.isFirstResponder)
    {
        [self resignFirstResponder];
    }
}


@end

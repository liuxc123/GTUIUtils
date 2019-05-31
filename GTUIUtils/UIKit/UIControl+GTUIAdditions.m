//
//  UIControl+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UIControl+GTUIAdditions.h"
#import "NSObject+GTUIAdditions.h"

@implementation UIControl (GTUIAdditions)


- (BOOL)gtui_enabled
{
    return self.enabled;
}
- (void)setGtui_enabled:(BOOL)gtui_enabled
{
    if (self.enabled != gtui_enabled) {
        self.enabled = gtui_enabled;
    }
}

- (BOOL)gtui_selected
{
    return self.selected;
}
- (void)setGtui_selected:(BOOL)gtui_selected
{
    if (self.selected != gtui_selected) {
        self.selected = gtui_selected;
    }
}

- (BOOL)gtui_highlighted
{
    return self.highlighted;
}
- (void)setGtui_highlighted:(BOOL)gtui_highlighted
{
    if (self.highlighted != gtui_highlighted) {
        self.highlighted = gtui_highlighted;
    }
}


- (void)gtui_click:(void (^)(void))cb
{
    [self gtui_setAssociatedCopyObject:cb key:@selector(gtui_handleClick)];
    [self addTarget:self action:@selector(gtui_handleClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)gtui_handleClick
{
    void (^clickBlock)(void) = [self gtui_getAssociatedObjectWithKey:_cmd];
    if (clickBlock) clickBlock();
}

- (void)gtui_controlEvents:(UIControlEvents)controlEvents cb:(void (^)(void))cb
{
    [self gtui_setAssociatedCopyObject:cb key:@selector(gtui_handleControlEvents)];
    [self addTarget:self action:@selector(gtui_handleClick) forControlEvents:controlEvents];
}
- (void)gtui_handleControlEvents
{
    void (^controlEventsBlock)(void) = [self gtui_getAssociatedObjectWithKey:_cmd];
    if (controlEventsBlock) controlEventsBlock();
}


@end

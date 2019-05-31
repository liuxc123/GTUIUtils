//
//  UITableViewCell+GTUIHelper.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UITableViewCell+GTUIHelper.h"
#import "NSObject+GTUIAdditions.h"

@implementation UITableViewCell (GTUIHelper)


- (NSIndexPath *)gtui_indexPath
{
    NSIndexPath *curIndexPath = [self gtui_getAssociatedObjectWithKey:@selector(gtui_indexPath)];
    return curIndexPath;
}
- (void)setGtui_indexPath:(NSIndexPath *)gtui_indexPath
{
    [self gtui_setAssociatedRetainObject:gtui_indexPath key:@selector(gtui_indexPath)];
}


@end

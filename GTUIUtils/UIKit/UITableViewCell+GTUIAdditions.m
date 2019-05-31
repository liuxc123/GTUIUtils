//
//  UITableViewCell+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UITableViewCell+GTUIAdditions.h"
#import "NSObject+GTUIAdditions.h"
#import "UIView+GTUIAdditions.h"

@implementation UITableViewCell (GTUIAdditions)


- (UITableView *)gtui_tableView
{
    UITableView *curTableView = [self gtui_getAssociatedObjectWithKey:@selector(gtui_tableView)];
    if (curTableView) return curTableView;

    curTableView = [self gtui_findSupview:@"UITableView"];
    if (curTableView) {
        self.gtui_tableView = curTableView;
    }
    return curTableView;
}
- (void)setGtui_tableView:(UITableView *)gtui_tableView
{
    [self gtui_setAssociatedAssignObject:gtui_tableView key:@selector(gtui_tableView)];
}


@end

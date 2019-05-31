//
//  UITableView+GTUIHelper.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "UITableView+GTUIHelper.h"
#import "NSObject+GTUIAdditions.h"
#import "GTUITableHelper.h"

@implementation UITableView (GTUIHelper)


- (GTUITableHelper *)gtui_tableHelper
{
    GTUITableHelper *curTableHelper = [self gtui_getAssociatedObjectWithKey:@selector(gtui_tableHelper)];
    if (curTableHelper) return curTableHelper;

    curTableHelper = [GTUITableHelper new];
    self.gtui_tableHelper = curTableHelper;
    return curTableHelper;
}
- (void)setGtui_tableHelper:(GTUITableHelper *)gtui_tableHelper
{
    [self gtui_setAssociatedRetainObject:gtui_tableHelper key:@selector(gtui_tableHelper)];
    self.delegate = gtui_tableHelper;
    self.dataSource = gtui_tableHelper;
    gtui_tableHelper.gtui_tableView = self;
}


- (BOOL)gtui_autoSizingCell
{
    return [[self gtui_getAssociatedObjectWithKey:@selector(gtui_autoSizingCell)] boolValue];
}
- (void)setGtui_autoSizingCell:(BOOL)gtui_autoSizingCell
{
    [self gtui_setAssociatedRetainObject:@(gtui_autoSizingCell) key:@selector(gtui_autoSizingCell)];
}


- (void)gtui_resetDataAry:(NSArray *)newDataAry
{
    [self gtui_resetDataAry:newDataAry forSection:0];
}
- (void)gtui_resetDataAry:(NSArray *)newDataAry forSection:(NSInteger)cSection
{
    [self.gtui_tableHelper resetDataAry:newDataAry forSection:cSection];
}
- (void)gtui_reloadDataAry:(NSArray *)newDataAry
{
    [self gtui_reloadDataAry:newDataAry forSection:0];
}
- (void)gtui_reloadDataAry:(NSArray *)newDataAry forSection:(NSInteger)cSection
{
    [self.gtui_tableHelper reloadDataAry:newDataAry forSection:cSection];
}
- (void)gtui_addDataAry:(NSArray *)newDataAry
{
    [self gtui_addDataAry:newDataAry forSection:0];
}
- (void)gtui_addDataAry:(NSArray *)newDataAry forSection:(NSInteger)cSection
{
    [self.gtui_tableHelper addDataAry:newDataAry forSection:cSection];
}
- (void)gtui_insertData:(id)cModel AtIndex:(NSIndexPath *)cIndexPath;
{
    [self.gtui_tableHelper insertData:cModel AtIndex:cIndexPath];
}
- (void)gtui_deleteDataAtIndex:(NSIndexPath *)cIndexPath
{
    [self.gtui_tableHelper deleteDataAtIndex:cIndexPath];
}


@end

//
//  GTUITableHelper.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "GTUITableHelper.h"
#import "GTUIMacro.h"
#import "UIViewController+GTUIAdditions.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "UITableViewCell+GTUIHelper.h"
#import "UITableView+GTUIHelper.h"

@interface GTUITableHelper ()

@property (nonatomic,strong) NSMutableArray<NSMutableArray *> *dataArray;
@property (nonatomic,copy) GTUITableHelperCellIdentifierBlock cellIdentifierBlock;
@property (nonatomic,copy) GTUITableHelperDidSelectBlock didSelectBlock;

@end

@implementation GTUITableHelper


- (NSString *)cellIdentifier
{
    if (_cellIdentifier == nil) {
        NSString *curVCIdentifier = self.gtui_tableView.gtui_vc.gtui_identifier;
        if (curVCIdentifier) {
            NSString *curCellIdentifier = gFormat(@"SUI%@Cell", curVCIdentifier);
            _cellIdentifier = curCellIdentifier;
        }
    }
    return _cellIdentifier;
}

- (void)registerNibs:(NSArray<NSString *> *)cellNibNames
{
    if (cellNibNames.count > 0) {
        [cellNibNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.gtui_tableView registerNib:[UINib nibWithNibName:obj bundle:nil] forCellReuseIdentifier:obj];
        }];
        if (cellNibNames.count == 1) {
            self.cellIdentifier = cellNibNames[0];
        }
    }
}

- (void)cellMultipleIdentifier:(GTUITableHelperCellIdentifierBlock)cb
{
    self.cellIdentifierBlock = cb;
}

- (void)didSelect:(GTUITableHelperDidSelectBlock)cb
{
    self.didSelectBlock = cb;
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  TableView DataSource Delegate
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - TableView DataSource Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger curNumOfSections = self.dataArray.count;
    return curNumOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger curNumOfRows = 0;
    if (self.dataArray.count > section) {
        NSMutableArray *subDataAry = self.dataArray[section];
        curNumOfRows = subDataAry.count;
    }
    return curNumOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *curCell = nil;
    id curModel = [self currentModelAtIndexPath:indexPath];
    NSString *curCellIdentifier = [self cellIdentifierForRowAtIndexPath:indexPath model:curModel];
    curCell = [tableView dequeueReusableCellWithIdentifier:curCellIdentifier forIndexPath:indexPath];
    GTUIAssert(curCell, @"cell is nil Identifier ⤭ %@ ⤪", curCellIdentifier);
    [self gtui_configureCell:curCell atIndexPath:indexPath model:curModel];
    return curCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat curHeight = 0;
    if (tableView.gtui_autoSizingCell) {
        id curModel = [self currentModelAtIndexPath:indexPath];
        NSString *curCellIdentifier = [self cellIdentifierForRowAtIndexPath:indexPath model:curModel];
        uWeakSelf
        curHeight = [tableView fd_heightForCellWithIdentifier:curCellIdentifier cacheByIndexPath:indexPath configuration:^(UITableViewCell *curCell) {
            [weakSelf gtui_configureCell:curCell atIndexPath:indexPath model:curModel];
        }];
    } else {
        curHeight = tableView.rowHeight;
    }
    return curHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.gtui_indexPath = indexPath;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.didSelectBlock) {
        id curModel = [self currentModelAtIndexPath:indexPath];
        self.didSelectBlock(indexPath, curModel);
    }
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Handler
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Handler

- (NSString *)cellIdentifierForRowAtIndexPath:(NSIndexPath *)cIndexPath model:(id)cModel
{
    NSString *curCellIdentifier = nil;
    if (self.cellIdentifierBlock) {
        curCellIdentifier = self.cellIdentifierBlock(cIndexPath, cModel);
    } else {
        curCellIdentifier = self.cellIdentifier;
    }
    return curCellIdentifier;
}

- (id)currentModel
{
    return [self currentModelAtIndexPath:self.gtui_indexPath];
}

- (id)currentModelAtIndexPath:(NSIndexPath *)cIndexPath
{
    if (self.dataArray.count > cIndexPath.section) {
        NSMutableArray *subDataAry = self.dataArray[cIndexPath.section];
        if (subDataAry.count > cIndexPath.row) {
            id curModel = subDataAry[cIndexPath.row];
            return curModel;
        }
    }
    return nil;
}

- (void)gtui_configureCell:(UITableViewCell *)cCell atIndexPath:(NSIndexPath *)cIndexPath model:(id)cModel
{
    if ([cCell respondsToSelector:@selector(gtui_cellWillDisplayWithModel:)]) {
        cCell.gtui_indexPath = cIndexPath;
        [cCell gtui_cellWillDisplayWithModel:cModel];
    }
}


- (void)resetDataAry:(NSArray *)newDataAry forSection:(NSUInteger)cSection
{
    uMainQueue
    (
     [self gtui_makeUpDataAryForSection:cSection];
     NSMutableArray *subAry = self.dataArray[cSection];
     if (subAry.count) [subAry removeAllObjects];
     if (newDataAry.count) {
         [subAry addObjectsFromArray:newDataAry];
     }
     [self.gtui_tableView reloadData];
     )
}
- (void)reloadDataAry:(NSArray *)newDataAry forSection:(NSUInteger)cSection
{
    if (newDataAry.count == 0) return;
    uMainQueue
    (
     NSIndexSet *curIndexSet = [self gtui_makeUpDataAryForSection:cSection];
     NSMutableArray *subAry = self.dataArray[cSection];
     if (subAry.count) [subAry removeAllObjects];
     [subAry addObjectsFromArray:newDataAry];

     [self.gtui_tableView beginUpdates];
     if (curIndexSet) {
         [self.gtui_tableView insertSections:curIndexSet withRowAnimation:UITableViewRowAnimationAutomatic];
     } else {
         [self.gtui_tableView reloadSections:[NSIndexSet indexSetWithIndex:cSection] withRowAnimation:UITableViewRowAnimationNone];
     }
     [self.gtui_tableView endUpdates];
     )
}
- (void)addDataAry:(NSArray *)newDataAry forSection:(NSUInteger)cSection
{
    if (newDataAry.count == 0) return;
    uMainQueue
    (
     NSIndexSet *curIndexSet = [self gtui_makeUpDataAryForSection:cSection];
     NSMutableArray *subAry = self.dataArray[cSection];
     if (curIndexSet) {
         [subAry addObjectsFromArray:newDataAry];
         [self.gtui_tableView beginUpdates];
         [self.gtui_tableView insertSections:curIndexSet withRowAnimation:UITableViewRowAnimationAutomatic];
         [self.gtui_tableView endUpdates];
     } else {
         __block NSMutableArray *curIndexPaths = [NSMutableArray arrayWithCapacity:newDataAry.count];
         [newDataAry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
             [curIndexPaths addObject:[NSIndexPath indexPathForRow:subAry.count+idx inSection:cSection]];
         }];
         [subAry addObjectsFromArray:newDataAry];
         [self.gtui_tableView beginUpdates];
         [self.gtui_tableView insertRowsAtIndexPaths:curIndexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
         [self.gtui_tableView endUpdates];
     }
     )
}
- (void)insertData:(id)cModel AtIndex:(NSIndexPath *)cIndexPath;
{
    uMainQueue
    (
     NSIndexSet *curIndexSet = [self gtui_makeUpDataAryForSection:cIndexPath.section];
     NSMutableArray *subAry = self.dataArray[cIndexPath.section];
     if (subAry.count < cIndexPath.row) return;
     [subAry insertObject:cModel atIndex:cIndexPath.row];
     if (curIndexSet) {
         [self.gtui_tableView beginUpdates];
         [self.gtui_tableView insertSections:curIndexSet withRowAnimation:UITableViewRowAnimationAutomatic];
         [self.gtui_tableView endUpdates];
     } else {
         [subAry insertObject:cModel atIndex:cIndexPath.row];
         [self.gtui_tableView beginUpdates];
         [self.gtui_tableView insertRowsAtIndexPaths:@[cIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
         [self.gtui_tableView endUpdates];
     }
     )
}
- (void)deleteDataAtIndex:(NSIndexPath *)cIndexPath
{
    uMainQueue
    (
     if (self.dataArray.count <= cIndexPath.section) return;
     NSMutableArray *subAry = self.dataArray[cIndexPath.section];
     if (subAry.count <= cIndexPath.row) return;

     [subAry removeObjectAtIndex:cIndexPath.row];
     [self.gtui_tableView beginUpdates];
     [self.gtui_tableView deleteRowsAtIndexPaths:@[cIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
     [self.gtui_tableView endUpdates];
     )
}

- (NSIndexSet *)gtui_makeUpDataAryForSection:(NSInteger)cSection
{
    NSMutableIndexSet *curIndexSet = nil;
    if (self.dataArray.count <= cSection) {
        curIndexSet = [NSMutableIndexSet indexSet];
        for (NSInteger idx=0; idx<(cSection-self.dataArray.count+1); idx++) {
            NSMutableArray *subAry = [NSMutableArray array];
            [self.dataArray addObject:subAry];
            [curIndexSet addIndex:cSection-idx];
        }
    }
    return curIndexSet;
}


- (NSMutableArray<NSMutableArray *> *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}


@end

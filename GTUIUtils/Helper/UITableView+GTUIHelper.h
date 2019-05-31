//
//  UITableView+GTUIHelper.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTUITableHelper;

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (GTUIHelper)


@property (null_resettable,strong) GTUITableHelper *gtui_tableHelper;

@property (nonatomic) IBInspectable BOOL gtui_autoSizingCell;

- (void)gtui_resetDataAry:(NSArray *)newDataAry;
- (void)gtui_resetDataAry:(NSArray *)newDataAry forSection:(NSInteger)cSection;
- (void)gtui_reloadDataAry:(NSArray *)newDataAry;
- (void)gtui_reloadDataAry:(NSArray *)newDataAry forSection:(NSInteger)cSection;
- (void)gtui_addDataAry:(NSArray *)newDataAry;
- (void)gtui_addDataAry:(NSArray *)newDataAry forSection:(NSInteger)cSection;
- (void)gtui_insertData:(id)cModel AtIndex:(NSIndexPath *)cIndexPath;
- (void)gtui_deleteDataAtIndex:(NSIndexPath *)cIndexPath;


@end

NS_ASSUME_NONNULL_END

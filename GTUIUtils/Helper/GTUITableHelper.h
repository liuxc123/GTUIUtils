//
//  GTUITableHelper.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString * __nonnull (^GTUITableHelperCellIdentifierBlock)(NSIndexPath *cIndexPath, id cModel);
typedef void (^GTUITableHelperDidSelectBlock)(NSIndexPath *cIndexPath, id cModel);

@interface GTUITableHelper : NSObject <UITableViewDataSource, UITableViewDelegate>


/**
 *  When using the storyboard and a single cell, set the property inspector same identifier
 */
@property (nullable,nonatomic,copy) NSString *cellIdentifier;

/**
 *  When using xib, all incoming nib names
 */
- (void)registerNibs:(NSArray<NSString *> *)cellNibNames;

/**
 *  When there are multiple cell, returned identifier in block
 */
- (void)cellMultipleIdentifier:(GTUITableHelperCellIdentifierBlock)cb;

/**
 *  If you override tableView:didSelectRowAtIndexPath: method, it will be invalid
 */
- (void)didSelect:(GTUITableHelperDidSelectBlock)cb;

@property (nonatomic,weak) UITableView *gtui_tableView;
@property (nonatomic,strong) NSIndexPath *gtui_indexPath;

- (void)resetDataAry:(NSArray *)newDataAry forSection:(NSUInteger)cSection;
- (void)reloadDataAry:(NSArray *)newDataAry forSection:(NSUInteger)cSection;
- (void)addDataAry:(NSArray *)newDataAry forSection:(NSUInteger)cSection;
- (void)insertData:(id)cModel AtIndex:(NSIndexPath *)cIndexPath;
- (void)deleteDataAtIndex:(NSIndexPath *)cIndexPath;

- (id)currentModel;
- (id)currentModelAtIndexPath:(NSIndexPath *)cIndexPath;


@end

NS_ASSUME_NONNULL_END

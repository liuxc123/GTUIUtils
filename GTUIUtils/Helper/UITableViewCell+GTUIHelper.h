//
//  UITableViewCell+GTUIHelper.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTUITableHelperProtocol <NSObject>
@optional

- (void)gtui_cellWillDisplayWithModel:(id)cModel;

@end

@interface UITableViewCell (GTUIHelper) <GTUITableHelperProtocol>


@property (nullable,nonatomic,strong) NSIndexPath *gtui_indexPath;


@end

NS_ASSUME_NONNULL_END

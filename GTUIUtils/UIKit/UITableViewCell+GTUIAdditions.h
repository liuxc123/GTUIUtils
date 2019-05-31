//
//  UITableViewCell+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (GTUIAdditions)

@property (nonatomic,weak) UITableView *gtui_tableView;

@end

NS_ASSUME_NONNULL_END

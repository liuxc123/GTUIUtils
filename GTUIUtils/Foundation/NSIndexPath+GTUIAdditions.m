//
//  NSIndexPath+GTUIAdditions.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "NSIndexPath+GTUIAdditions.h"
#import <UIKit/UIKit.h>

@implementation NSIndexPath (GTUIAdditions)


- (instancetype)gtui_previousRow
{
    NSIndexPath *curIndexPath = [NSIndexPath indexPathForRow:self.row-1
                                                   inSection:self.section];
    return curIndexPath;
}

- (instancetype)gtui_nextRow
{
    NSIndexPath *curIndexPath = [NSIndexPath indexPathForRow:self.row+1
                                                   inSection:self.section];
    return curIndexPath;
}

- (instancetype)gtui_previousSection
{
    NSIndexPath *curIndexPath = [NSIndexPath indexPathForRow:self.row
                                                   inSection:self.section-1];
    return curIndexPath;
}

- (instancetype)gtui_nextSection
{
    NSIndexPath *curIndexPath = [NSIndexPath indexPathForRow:self.row
                                                   inSection:self.section+1];
    return curIndexPath;
}


@end

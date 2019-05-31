//
//  NSIndexPath+GTUIAdditions.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSIndexPath (GTUIAdditions)


- (instancetype)gtui_previousRow;

- (instancetype)gtui_nextRow;

- (instancetype)gtui_previousSection;

- (instancetype)gtui_nextSection;


@end

NS_ASSUME_NONNULL_END

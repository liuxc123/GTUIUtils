//
//  GTUITool+Delay.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "GTUITool.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^GTUIToolDelayTask)(BOOL cancel);

@interface GTUITool (Delay)

+ (GTUIToolDelayTask)delay:(NSTimeInterval)delay cb:(void (^)(void))completion;

+ (void)cancelDelayTask:(GTUIToolDelayTask)cTask;

@end

NS_ASSUME_NONNULL_END

//
//  GTUITool+Delay.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "GTUITool+Delay.h"

@implementation GTUITool (Delay)

+ (GTUIToolDelayTask)delay:(NSTimeInterval)delay cb:(void (^)(void))completion;
{
    __block dispatch_block_t closure = completion;
    __block GTUIToolDelayTask currTask = nil;

    GTUIToolDelayTask delayedBlock = ^(BOOL cancel) {
        if (cancel == NO) {
            dispatch_async(dispatch_get_main_queue(), closure);
        }
        closure = nil;
        currTask = nil;
    };

    currTask = delayedBlock;

    [self gtui_delayExecutive:delay cb:^{
        if (currTask) currTask(NO);
    }];
    return currTask;
}

+ (void)cancelDelayTask:(GTUIToolDelayTask)cTask
{
    if (cTask) cTask(YES);
}

+ (void)gtui_delayExecutive:(NSTimeInterval)delayInSeconds cb:(void (^)(void))completionBlock
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), completionBlock);
}


@end

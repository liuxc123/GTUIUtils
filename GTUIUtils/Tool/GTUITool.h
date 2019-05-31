//
//  GTUITool.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, GTUILaunchedType) {
    GTUILaunchedLatestVersion = 0,
    GTUILaunchedFirstLaunched = 1,
    GTUILaunchedUpdateVersion = 2
};

@interface GTUITool : NSObject

+ (GTUILaunchedType)launchedType;

+ (nullable NSString *)previousVersion;

@end

NS_ASSUME_NONNULL_END

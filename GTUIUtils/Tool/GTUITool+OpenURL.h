//
//  GTUITool+OpenURL.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "GTUITool.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTUITool (OpenURL)

+ (BOOL)openMail:(NSString *)mail;

+ (BOOL)openPhone:(NSString *)phone;

+ (BOOL)openAppStore:(NSString *)appId;

@end

NS_ASSUME_NONNULL_END

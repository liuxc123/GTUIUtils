//
//  GTUITool+OpenURL.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "GTUITool+OpenURL.h"
#import <UIKit/UIKit.h>
#import "GTUIMacro.h"

@implementation GTUITool (OpenURL)

+ (BOOL)openMail:(NSString *)mail
{
    NSString *curURL = gFormat(@"mailto://%@", mail);
    BOOL ret =  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:curURL]];
    GTUIAssert(ret, @"open mail failed Mail ⤭ %@ ⤪", mail);
    return ret;
}

+ (BOOL)openPhone:(NSString *)phone
{
    NSString *curURL = gFormat(@"telprompt://%@", phone);
    BOOL ret =  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:curURL]];
    GTUIAssert(ret, @"open phone failed Phone ⤭ %@ ⤪", phone);
    return ret;
}

+ (BOOL)openAppStore:(NSString *)appId
{
    NSString *curURL = gFormat(@"itms-apps://itunes.apple.com/app/id%@", appId);
    BOOL ret = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:curURL]];
    GTUIAssert(ret, @"open app store failed AppId ⤭ %@ ⤪", appId);
    return ret;
}


@end

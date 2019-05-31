//
//  GTUITool.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "GTUITool.h"
#import "GTUIMacro.h"

NSString *const gtui_everLaunched = @"gtui_everLaunched";
NSString *const gtui_everVersion = @"gtui_everVersion";

@interface GTUITool ()

@property (nonatomic) GTUILaunchedType launchedType;

@end

@implementation GTUITool

uSharedInstanceWithCommonInit

- (void)commonInit
{
    [self updateVersion];
}

- (void)updateVersion
{
    if (gUserDefaultsBoolForKey(gtui_everLaunched))
    {
        NSString *cVersion = kVersion;
        NSString *eVersion = [GTUITool previousVersion];

        if ([eVersion isEqualToString:cVersion]) {
            self.launchedType = GTUILaunchedLatestVersion;
            GTUILogInfo(@"ever launched latest-version CurrVersion ⤭ %@ ⤪", cVersion);
        }
        else
        {
            [gUserDefaults setObject:cVersion forKey:gtui_everVersion];
            [gUserDefaults synchronize];

            self.launchedType = GTUILaunchedUpdateVersion;
            GTUILogInfo(@"ever launched update-version EverVersion ⤭ %@ ⤪  CurrVersion ⤭ %@ ⤪", eVersion, cVersion);
        }
    }
    else
    {
        [gUserDefaults setBool:YES forKey:gtui_everLaunched];
        [gUserDefaults setObject:kVersion forKey:gtui_everVersion];
        [gUserDefaults synchronize];

        self.launchedType = GTUILaunchedFirstLaunched;
        GTUILogInfo(@"first launched CurrVersion ⤭ %@ ⤪", kVersion);
    }
}

+ (GTUILaunchedType)launchedType
{
    return [[self sharedInstance] launchedType];
}

+ (NSString *)previousVersion
{
    return gUserDefaultsObjForKey(gtui_everVersion);
}

@end

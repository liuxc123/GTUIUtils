//
//  GTUITool+Camera.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "GTUITool.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTUITool (Camera)

+ (BOOL)cameraAvailable;

+ (BOOL)cameraRearAvailable;

+ (BOOL)cameraFrontAvailable;

+ (BOOL)photoLibraryAvailable;

@end

NS_ASSUME_NONNULL_END

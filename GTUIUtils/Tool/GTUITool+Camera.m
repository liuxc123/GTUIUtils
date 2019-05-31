//
//  GTUITool+Camera.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "GTUITool+Camera.h"
#import <UIKit/UIKit.h>
#import "GTUIMacro.h"

@implementation GTUITool (Camera)

+ (BOOL)cameraAvailable
{
    BOOL ret = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    GTUIAssert(ret, @"Camera unavailable.");
    return ret;
}

+ (BOOL)cameraRearAvailable
{
    BOOL ret = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    GTUIAssert(ret, @"Camera rear unavailable.");
    return ret;
}

+ (BOOL)cameraFrontAvailable
{
    BOOL ret = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    GTUIAssert(ret, @"Camera front unavailable.");
    return ret;
}

+ (BOOL)photoLibraryAvailable
{
    BOOL ret = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    GTUIAssert(ret, @"Photo library unavailable.");
    return ret;
}



@end

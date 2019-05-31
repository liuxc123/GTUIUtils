//
//  GTUITool+FileManager.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "GTUITool.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTUITool (FileManager)

+ (BOOL)fileCreateDirectory:(NSString *)filePath;

+ (BOOL)fileExist:(NSString *)filePath;

+ (BOOL)fileWrite:(NSData *)data toPath:(NSString *)filePath;

+ (BOOL)fileMove:(NSString *)sourcePath toPath:(NSString *)filePath;

+ (BOOL)fileCopy:(NSString *)sourcePath toPath:(NSString *)filePath;

+ (nullable NSData *)fileRead:(NSString *)filePath;

+ (NSUInteger)fileSize:(NSString *)filePath;

+ (BOOL)fileDelete:(NSString *)filePath;

@end

NS_ASSUME_NONNULL_END

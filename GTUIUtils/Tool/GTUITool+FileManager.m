//
//  GTUITool+FileManager.m
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import "GTUITool+FileManager.h"
#import "GTUIMacro.h"

@implementation GTUITool (FileManager)

+ (BOOL)fileCreateDirectory:(NSString *)filePath
{
    if (![self fileExist:filePath]) {
        NSError *anyError = nil;
        BOOL ret = [[NSFileManager defaultManager]
                    createDirectoryAtPath:filePath
                    withIntermediateDirectories:YES
                    attributes:nil
                    error:&anyError];
        GTUIAssert(ret, @"file create director Error ⤭ %@ ⤪  At ⤭ %@ ⤪", anyError, filePath);
        return ret;
    }
    return YES;
}

+ (BOOL)fileExist:(NSString *)filePath
{
    BOOL ret = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    return ret;
}

+ (BOOL)fileWrite:(NSData *)data toPath:(NSString *)filePath
{
    NSError *anyError = nil;
    BOOL ret = [data writeToFile:filePath
                         options:NSDataWritingAtomic
                           error:&anyError];
    GTUIAssert(ret, @"file write Error ⤭ %@ ⤪  To ⤭ %@ ⤪", anyError, filePath);
    return ret;
}

+ (BOOL)fileMove:(NSString *)sourcePath toPath:(NSString *)filePath
{
    NSError *anyError = nil;
    BOOL ret = [[NSFileManager defaultManager]
                moveItemAtPath:sourcePath
                toPath:filePath
                error:&anyError];
    GTUIAssert(ret, @"file move Error ⤭ %@ ⤪  Source ⤭ %@ ⤪  To ⤭ %@ ⤪", anyError, sourcePath, filePath);
    return ret;
}

+ (BOOL)fileCopy:(NSString *)sourcePath toPath:(NSString *)filePath
{
    NSError *anyError = nil;
    BOOL ret = [[NSFileManager defaultManager]
                copyItemAtPath:sourcePath
                toPath:filePath
                error:&anyError];
    GTUIAssert(ret, @"file copy Error ⤭ %@ ⤪  Source ⤭ %@ ⤪  To ⤭ %@ ⤪", anyError, sourcePath, filePath);
    return ret;
}

+ (NSData *)fileRead:(NSString *)filePath
{
    NSError *anyError = nil;
    NSData *readData = [NSData dataWithContentsOfFile:filePath
                                              options:NSDataReadingMappedIfSafe
                                                error:&anyError];
    GTUIAssert(!anyError, @"file read Error ⤭ %@ ⤪  At ⤭ %@ ⤪", anyError, filePath);
    return readData;
}

+ (NSUInteger)fileSize:(NSString *)filePath
{
    if ([self fileExist:filePath])
    {
        NSError *anyError = nil;
        NSDictionary *attributes = [[NSFileManager defaultManager]
                                    attributesOfItemAtPath:filePath
                                    error:&anyError];
        GTUIAssert(!anyError, @"file size Error ⤭ %@ ⤪  At ⤭ %@ ⤪", anyError, filePath);
        if (!anyError) {
            NSInteger fSize = [[attributes objectForKey:NSFileSize] integerValue];
            return fSize;
        }
    }
    return 0;
}

+ (BOOL)fileDelete:(NSString *)filePath
{
    if ([self fileExist:filePath])
    {
        NSError *anyError = nil;
        BOOL ret = [[NSFileManager defaultManager]
                    removeItemAtPath:filePath
                    error:&anyError];
        GTUIAssert(ret, @"file delete Error ⤭ %@ ⤪  At ⤭ %@ ⤪", anyError, filePath);
        return ret;
    }
    return YES;
}


@end

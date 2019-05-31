//
//  NSString+GTUICrypto.h
//  GTUIUtils
//
//  Created by liuxc on 2019/5/31.
//  Copyright © 2019 liuxc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (GTUICrypto)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  URL
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - URL

@property (nullable,readonly,copy) NSString *gtui_URLEncode;

@property (nullable,readonly,copy) NSString *gtui_URLDecode;

- (nullable NSString *)gtui_URLEncodeUsingEncoding:(NSStringEncoding)encoding;

- (nullable NSString *)gtui_URLDecodeUsingEncoding:(NSStringEncoding)encoding;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Base64
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Base64

@property (nullable,readonly,copy) NSString *gtui_base64Encode;

@property (nullable,readonly,copy) NSString *gtui_base64Decode;

@property (nullable,readonly,copy) NSData *gtui_base64EncodeData;

/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  SHA1 MD5 SHA224 SHA256 SHA384 SHA512
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - SHA1 MD5 SHA224 SHA256 SHA384 SHA512

- (nullable NSString *)gtui_md5Digest;

- (nullable NSString *)gtui_HMACDigestWithKey:(NSString *)cKey algorithm:(CCHmacAlgorithm)cAlgorithm;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Rc4
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Rc4

- (nullable NSData *)gtui_rc4WithKey:(NSString *)cKey;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  AES
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - AES

- (nullable NSString *)gtui_AESEncryptWithKey:(NSString *)cKey andIV:(NSData *)iv;
- (nullable NSString *)gtui_AESDecryptWithKey:(NSString *)cKey andIV:(NSData *)iv;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  3DES
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - 3DES

- (nullable NSString *)gtui_3DESEncryptWithKey:(NSString *)cKey andIV:(NSData *)iv;
- (nullable NSString *)gtui_3DESDecryptWithKey:(NSString *)cKey andIV:(NSData *)iv;


@end



/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  NSData+GTUICrypto
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

@interface NSData (GTUICrypto)


- (nullable NSData *)gtui_AESEncryptWithKey:(NSString *)cKey andIV:(NSData *)iv;

- (nullable NSData *)gtui_AESDecryptWithKey:(NSString *)cKey andIV:(NSData *)iv;

- (nullable NSData *)gtui_3DESEncryptWithKey:(NSString *)cKey andIV:(NSData *)iv;

- (nullable NSData *)gtui_3DESDecryptWithKey:(NSString *)cKey andIV:(NSData *)iv;


@end

NS_ASSUME_NONNULL_END

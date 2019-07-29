//
//  ELEncryptMD5.h
//  ELKitSDK
//
//  Created by YinLinLin on 2019/7/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ELEncryptMD5 : NSObject

#pragma mark - md5加解密
+ (NSString *)el_md5String:(NSString *)string;
+ (NSString *)el_md5Data:(NSData *)data;
+ (NSString *)el_md5File:(NSString *)filePath;
+ (NSString *)el_md5StreamFile:(NSString *)filePath;

@end

NS_ASSUME_NONNULL_END

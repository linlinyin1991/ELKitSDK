//
//  ELEncryptAES.h
//  ELKitSDK
//
//  Created by YinLinLin on 2019/7/29.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

typedef NS_ENUM(NSUInteger, ELEncryptMode) {
    ELEncryptAES128      = 0,
    ELEncryptAES192,
    ELEncryptAES256,
    ELEncryptDES,
    ELEncrypt3DES,
};


NS_ASSUME_NONNULL_BEGIN

@interface ELEncryptAES : NSObject

/**
 AES256 ECB 加密
 */
+ (nullable NSString *)stringByAes256Encrypt:(NSString *)string key:(NSString *)key;
/**
 AES256 ECB 解密
 */
+ (nullable NSString *)stringByAes256Decrypt:(NSString *)string key:(NSString *)key;

/**
 *  @abstract           AES和DES通用的加密方法
 *
 *  @param mode         算法
 *  @param data         需要加密的二进制数据
 *  @param key          密钥
 *  @param options      补码方式(PKCS7Padding/None)和加密模式(CBC/ECB，默认CBC)
 *  @param iv           向量，ECB不需要
 *
 *  @return             加密之后二进制的数据
 */
+ (nullable NSData *)el_dataByEncrypt:(NSData *)data key:(NSString *)key mode:(ELEncryptMode)mode options:(CCOptions)options iv:(nullable NSString *)iv;

/**
 *  @abstract           AES和DES通用的解密方法
 *
 *  @param mode         算法
 *  @param data         需要解密的二进制数据
 *  @param key          密钥
 *  @param options      补码方式(PKCS7Padding/None)和加密模式(CBC/ECB，默认CBC)
 *  @param iv           向量，ECB不需要
 *
 *  @return             解密之后的二进制数据
 */
+ (nullable NSData *)el_dataByDecrypt:(NSData *)data key:(NSString *)key mode:(ELEncryptMode)mode options:(CCOptions)options iv:(nullable NSString *)iv;


@end

NS_ASSUME_NONNULL_END

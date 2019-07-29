//
//  ELEncryptRSA.h
//  ELKitSDK
//
//  Created by YinLinLin on 2019/7/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ELEncryptRSA : NSObject

#pragma mark - 公钥加解密
/**
 *  @abstract             RSA公钥加密data
 *
 *  @param data           待加密二进制数据
 *  @param pubKey         RSA公钥(base64编码的PEM格式的公钥)
 *
 *  @return               RSA加密以后二进制数据
 */

+ (NSData *)el_dataByEncrypt:(NSData *)data publicKey:(NSString *)pubKey;

/**
 *  @abstract            RSA公钥解密data
 *
 *  @param data          待解密二进制数据
 *  @param pubKey        RSA公钥(base64编码的PEM格式的公钥)
 *
 *  @return              RSA解密以后二进制数据
 */
+ (NSData *)el_dataByDecrypt:(NSData *)data publicKey:(NSString *)pubKey;

#pragma mark - 私钥加解密
/**
 *  @abstract             RSA私钥加密data
 *
 *  @param data           待加密二进制数据
 *  @param privateKey     RSA私钥(base64编码的PEM格式私钥)
 *
 *  @return               RSA加密以后二进制数据
 */

+ (NSData *)el_dataByEncrypt:(NSData *)data privateKey:(NSString *)privateKey;

/**
 *  @abstract            RSA私钥解密data
 *
 *  @param data          待解密二进制数据
 *  @param privateKey    RSA私钥(base64编码的PEM格式私钥)
 *
 *  @return              RSA解密以后二进制数据
 */
+ (NSData *)el_dataByDecrypt:(NSData *)data privateKey:(NSString *)privateKey;


@end

NS_ASSUME_NONNULL_END

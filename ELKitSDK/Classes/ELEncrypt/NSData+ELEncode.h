//
//  NSData+ELEncode.h
//  ELKitSDK
//
//  Created by YinLinLin on 2019/7/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (ELEncode)

/// 转String
@property(nullable, readonly, copy) NSString *el_utf8String;
/*base64加密*/
@property(nullable, readonly, copy) NSData * el_base64Encode;
/*base64解密*/
@property(nullable, readonly, copy) NSData * el_base64Decode;

@end

NS_ASSUME_NONNULL_END

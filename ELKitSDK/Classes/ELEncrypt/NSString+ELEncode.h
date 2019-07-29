//
//  NSString+ELEncode.h
//  ELKitSDK
//
//  Created by YinLinLin on 2019/7/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ELEncode)

//转Data
@property(nullable, readonly, copy) NSData   *el_utf8Data;

/*base64加密字符串*/
@property(nullable, readonly, copy) NSString *el_base64Encode;
/*base64解密字符串*/
@property(nullable, readonly, copy) NSString *el_base64Decode;

/*url编码字符串*/
@property(nullable, readonly, copy) NSString *el_urlEncode;
/*url解码字符串*/
@property(nullable, readonly, copy) NSString *el_urlDecode;


@end

NS_ASSUME_NONNULL_END

//
//  NSString+ELEncode.m
//  ELKitSDK
//
//  Created by YinLinLin on 2019/7/29.
//

#import "NSString+ELEncode.h"
#import "NSData+ELEncode.h"
@implementation NSString (ELEncode)

- (NSData *)el_utf8Data {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData *)el_base64DecodeData {
    return [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
}

- (NSString *)el_base64Encode {
    return [self.el_utf8Data base64EncodedStringWithOptions:0];
}

- (NSString *)el_base64Decode {
    return self.el_base64DecodeData.el_utf8String;
}

- (NSString *)el_urlEncode {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (NSString *)el_urlDecode {
    return [self stringByRemovingPercentEncoding];
}

@end

//
//  NSData+ELEncode.m
//  ELKitSDK
//
//  Created by YinLinLin on 2019/7/29.
//

#import "NSData+ELEncode.h"

@implementation NSData (ELEncode)

- (NSString *)el_utf8String {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}
- (NSData *)el_base64Encode {
    return [self base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (NSData *)el_base64Decode {
    return [[NSData alloc] initWithBase64EncodedData:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
}


@end

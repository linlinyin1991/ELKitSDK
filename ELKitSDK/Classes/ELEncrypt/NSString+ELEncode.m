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

- (NSString *)el_base64Encode {
    return [self.el_utf8Data base64EncodedStringWithOptions:0];
}

- (NSString *)el_base64Decode {
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return decodedData.el_utf8String;
}

- (NSString *)el_urlEncode {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (NSString *)el_urlDecode {
    return [self stringByRemovingPercentEncoding];
}

@end

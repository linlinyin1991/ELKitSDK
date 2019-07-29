//
//  UIColor+ELExtension.m
//  ELKitSDK
//
//  Created by ElaineYin on 2018/2/6.
//

#import "UIColor+ELExtension.h"

@implementation UIColor (ELExtension)

+(nullable UIColor *)el_hexColorWithString:(nonnull NSString *)hexString {
    NSString * cString = [hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].uppercaseString;
    if (cString.length < 6) {
        NSLog(@"Warning: hexString is invalid! return [UIColor clearColor]");
        return [self.class clearColor];
    }
    if ([cString hasPrefix:@"0X"])  {cString = [cString substringFromIndex:2];}
    if ([cString hasPrefix:@"#"])   {cString = [cString substringFromIndex:1];}
    if (cString.length != 6) {
        NSLog(@"Warning: hexString is invalid! return [UIColor clearColor]");
        return [self.class clearColor];
    }
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString * rString = [cString substringWithRange:range];
    range.location = 2;
    NSString * gString = [cString substringWithRange:range];
    range.location = 4;
    NSString * bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [self.class colorWithRed:(r/255.f) green:(g/255.f) blue:(b/255.f) alpha:1.f];
}

+(UIColor *)el_hexColor:(NSInteger)hex {
    return [self el_hexColor:hex alpha:1.0];
}

+(UIColor *)el_hexColor:(NSInteger)hex alpha:(CGFloat)alpha {
    return [self.class colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:alpha];
}

+ (nullable UIColor *)el_rgbColor:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b {
    return [self.class colorWithRed:(r/255.f) green:(g/255.f) blue:(b/255.f) alpha:1.f];
}

@end

//
//  UIColor+ELExtension.h
//  ELKitSDK
//
//  Created by ElaineYin on 2018/2/6.
//

#import <UIKit/UIKit.h>

@interface UIColor (ELExtension)

/**
 *  @abstract           16进制颜色值转化颜色对象
 *
 *  @param hexString          16进制颜色值的字符串
 *
 *  @return             UIColor对象
 */
+(nullable UIColor *)el_hexColorWithString:(nonnull NSString *)hexString;

/**
 *  @abstract           16进制颜色值转化颜色对象
 *
 *  @param hex          16进制颜色值,0xffffff
 *
 *  @return             UIColor对象
 */
+(nullable UIColor *)el_hexColor:(NSInteger)hex;

/**
 *  @abstract           16进制颜色值转化颜色对象
 *
 *  @param hex          16进制颜色值
 *  @param alpha        透明度(0-1)
 *
 *  @return             UIColor对象
 */
+(nullable UIColor *)el_hexColor:(NSInteger)hex alpha:(CGFloat)alpha;

/**
 *  @abstract           rgb颜色值转化颜色对象
 *
 *  @param r            红色值(0-255)
 *  @param g            绿色值(0-255)
 *  @param b            蓝色值(0-255)
 *
 *  @return             UIColor对象
 */
+(nullable UIColor *)el_rgbColor:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b;



@end

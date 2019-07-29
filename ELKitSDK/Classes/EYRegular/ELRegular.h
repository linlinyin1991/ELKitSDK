//
//  ELRegular.h
//  ELKitSDK
//
//  Created by YinLinLin on 2019/7/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ELRegular : NSObject

/**
 @return 是否是有效的邮箱
 */
+(BOOL)isEffectiveEmail:(NSString *)value;

/**
 @return 是否是有效的身份证号
 */
+(BOOL)isEffectiveIDNumber:(NSString *)value;

/**
 @return 是否是有效的身份证号
 */
+(BOOL)isEffectiveMobileNumber:(NSString *)value;

/**
 @return 是否是有效的身份证号
 */
+(BOOL)isEffectiveLicensePlateNumber:(NSString *)value;

/**
 @return 是否是有效的身份证号
 */
+(BOOL)isAllDigitalCharacters:(NSString*)value;

/**
 @return 是否是有效的身份证号
 */
+(BOOL)isAllEnglishCharacters:(NSString *)value;

/**
 @return 是否是有效的身份证号
 */
+(BOOL)isAllChineseCharacters:(NSString *)value;


@end

NS_ASSUME_NONNULL_END

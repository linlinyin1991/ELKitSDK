//
//  ELRegular.m
//  ELKitSDK
//
//  Created by YinLinLin on 2019/7/29.
//

#import "ELRegular.h"

@implementation ELRegular

+ (BOOL)isValidateRegularExpression:(NSString *)expression ByRegex:(NSString *)regex {
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:expression];
}

+(BOOL)isEffectiveEmail:(NSString *)value {
    NSString * regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,5}";
    return [self isValidateRegularExpression:value ByRegex:regex];
}

+(BOOL)isEffectiveIDNumber:(NSString *)value {
    NSString *tmpValue = value.copy;
    // 去空格
    tmpValue = [tmpValue stringByReplacingOccurrencesOfString:@" " withString:@""];
    int length = 0;
    if (!tmpValue) {return NO;}
    length = (int)tmpValue.length;
    if (length != 18) {return NO;}
    // 省份代码
    NSArray * areasArray = @[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString * valueStart2 = [tmpValue substringToIndex:2];
    BOOL areaFlag = NO;
    for (NSString * areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag = YES;
            break;
        }
    }
    if (!areaFlag) {return NO;}
    
    NSRegularExpression * regularExpression;
    NSUInteger numberofMatch;
    
    int year = 0;
    year = [tmpValue substringWithRange:NSMakeRange(6,4)].intValue;
    if (year % 4 == 0 || (year % 100 == 0 && year % 4 == 0)) {
        regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[1-2](0|9|)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
    }else {
        regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[1-2](0|9|)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
    }
    numberofMatch = [regularExpression numberOfMatchesInString:tmpValue options:NSMatchingReportProgress range:NSMakeRange(0, tmpValue.length)];
    
    if(numberofMatch > 0) {
        int S = ([tmpValue substringWithRange:NSMakeRange(0,1)].intValue +
                 [tmpValue substringWithRange:NSMakeRange(10,1)].intValue) * 7 +
        ([tmpValue substringWithRange:NSMakeRange(1,1)].intValue +
         [tmpValue substringWithRange:NSMakeRange(11,1)].intValue) * 9 +
        ([tmpValue substringWithRange:NSMakeRange(2,1)].intValue +
         [tmpValue substringWithRange:NSMakeRange(12,1)].intValue) * 10 +
        ([tmpValue substringWithRange:NSMakeRange(3,1)].intValue +
         [tmpValue substringWithRange:NSMakeRange(13,1)].intValue) * 5 +
        ([tmpValue substringWithRange:NSMakeRange(4,1)].intValue +
         [tmpValue substringWithRange:NSMakeRange(14,1)].intValue) * 8 +
        ([tmpValue substringWithRange:NSMakeRange(5,1)].intValue +
         [tmpValue substringWithRange:NSMakeRange(15,1)].intValue) * 4 +
        ([tmpValue substringWithRange:NSMakeRange(6,1)].intValue +
         [tmpValue substringWithRange:NSMakeRange(16,1)].intValue) * 2 +
        [tmpValue substringWithRange:NSMakeRange(7,1)].intValue * 1 +
        [tmpValue substringWithRange:NSMakeRange(8,1)].intValue * 6 +
        [tmpValue substringWithRange:NSMakeRange(9,1)].intValue * 3;
        int Y = S % 11;
        NSString * M = @"F";
        NSString * JYM = @"10X98765432";
        M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
        if ([M isEqualToString:[tmpValue substringWithRange:NSMakeRange(17,1)]]) {
            return YES;// 检测ID的校验位
        }else {
            return NO;
        }
    }else {
        return NO;
    }
    
}

+(BOOL)isEffectiveMobileNumber:(NSString *)value {
    NSString *tmpValue = value.copy;
    
    // 去掉空格和-
    tmpValue = [tmpValue stringByReplacingOccurrencesOfString:@" " withString:@""];
    tmpValue = [tmpValue stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSString * regex = @"^(0|86)?(1)[0-9]{10}$";
    return [self isValidateRegularExpression:tmpValue ByRegex:regex];
}

+(BOOL)isEffectiveLicensePlateNumber:(NSString *)value {
    
    NSString * regex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    return [self isValidateRegularExpression:value ByRegex:regex];
}

+(BOOL)isAllDigitalCharacters:(NSString*)value {
    NSString * regex = @"^[0-9]*$";
    return [self isValidateRegularExpression:value ByRegex:regex];
}

+(BOOL)isAllEnglishCharacters:(NSString *)value {
    NSString * regex = @"^[a-zA-Z]*$";
    return [self isValidateRegularExpression:value ByRegex:regex];
}

+(BOOL)isAllChineseCharacters:(NSString *)value {
    NSString * regex = @"^[\u4e00-\u9fa5]*$";
    return [self isValidateRegularExpression:value ByRegex:regex];
}

@end

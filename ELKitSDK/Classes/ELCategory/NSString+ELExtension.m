//
//  NSString+ELExtension.m
//  ELKitSDK
//
//  Created by ElaineYin on 2018/2/6.
//

#import "NSString+ELExtension.h"

#ifdef  DEBUG
#define DLog(fmt, ...)      {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#else
#define DLog(...)
#endif

@implementation NSString (ELEditing)

- (NSString *)el_append:(NSString *)string {
    return [NSString stringWithFormat:@"%@%@",self,string];
}

- (NSString *)el_insert:(NSString *)string atIndex:(NSInteger)index {
    if (index < self.length) {
        NSString * prefixString = [self substringToIndex:index];
        NSString * suffixString = [self substringFromIndex:index];
        return [NSString stringWithFormat:@"%@%@%@",prefixString,string,suffixString];
    } else if (index == self.length) {
        return [self el_append:string];
    }
    DLog(@"Warning: index > string长度, return self");
    return self;
}

-(NSString *)el_removeAllSpace {
    return [self el_removeSubString:@" "];
}

-(NSString *)el_removeSubString:(NSString *)subString {
    return [self stringByReplacingOccurrencesOfString:subString withString:@""];
}

@end

@implementation NSString (ELCharacterCalculate)

-(NSUInteger)el_standardCharCount {
    NSUInteger strlength = 0;
    char * p = (char *)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (NSUInteger i = 0 ;i < [self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding]; i++) {
        if (* p) {strlength++;}
        p++;
    }
    return strlength;
}
-(NSUInteger)el_chineseCharCount {
    return (self.el_standardCharCount + 1) / 2;
}
-(NSUInteger)el_chineseWordCount {
    NSUInteger chineseWordCount = 0;
    for (NSUInteger i = 0; i < self.length; i++) {
        NSRange range = NSMakeRange(i,1);
        NSString * subString = [self substringWithRange:range];
        const char * cString = subString.UTF8String;
        if (strlen(cString) > 1) {chineseWordCount++;}
    }
    return chineseWordCount;
}

-(CGSize)el_boundingRectWithSize:(CGSize)size fontSize:(CGFloat)fontSize {
    return [self el_boundingRectWithSize:size fontName:nil fontSize:fontSize];
}

-(CGSize)el_boundingRectWithSize:(CGSize)size fontName:(NSString *)name fontSize:(CGFloat)fontSize {
    if (self.length == 0) {DLog(@"Warning: self is nil or empty!");return CGSizeZero;}
    CGFloat tmpFontSize = fontSize;
    if (tmpFontSize < 5) {tmpFontSize = 5;}
    UIFont * contentFont;
    if (name && name.length > 0) {
        contentFont = [UIFont fontWithName:name size:tmpFontSize];
    }else{
        contentFont = [UIFont systemFontOfSize:tmpFontSize];
    }
    CGSize actualSize;
    NSDictionary * contentDic = @{NSFontAttributeName:contentFont};
    actualSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:contentDic context:nil].size;
    return actualSize;
}

@end

@implementation NSString (ELAttributedString)

-(NSAttributedString *)el_AttRange:(NSRange)range color:(UIColor *)color {
    return [self el_AttRanges:@[[NSValue valueWithRange:range]] fonts:nil colors:@[color]];
}

-(NSAttributedString *)el_AttRange:(NSRange)range font:(UIFont *)font {
    return [self el_AttRanges:@[[NSValue valueWithRange:range]] fonts:@[font] colors:nil];
}

-(NSAttributedString *)el_AttRange:(NSRange)range font:(UIFont *)font color:(UIColor *)color {
    return [self el_AttRanges:@[[NSValue valueWithRange:range]] fonts:@[font] colors:@[color]];
}

-(NSAttributedString *)el_AttRanges:(NSArray *)ranges colors:(NSArray *)colors {
    return [self el_AttRanges:ranges fonts:nil colors:colors];
}

-(NSAttributedString *)el_AttRanges:(NSArray *)ranges fonts:(NSArray *)fonts {
    return [self el_AttRanges:ranges fonts:fonts colors:nil];
}

-(NSAttributedString *)el_AttRanges:(NSArray *)ranges fonts:(NSArray *)fonts colors:(NSArray *)colors {
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithString:self];
    if (attStr && ranges.count) {
        for (NSInteger i = 0; i < ranges.count; i++) {
            NSRange range = [ranges[i] rangeValue];
            if ([fonts objectAtIndex:i]) {
                [attStr addAttribute:NSFontAttributeName value:fonts[i] range:range];
            }
            if ([colors objectAtIndex:i]) {
                [attStr addAttribute:NSForegroundColorAttributeName value:colors[i] range:range];
            }
        }
    }
    return attStr;
}

@end



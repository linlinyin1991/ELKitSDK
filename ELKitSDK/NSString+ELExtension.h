//
//  NSString+ELExtension.h
//  ELKitSDK
//
//  Created by ElaineYin on 2018/2/6.
//

#import <Foundation/Foundation.h>

@interface NSString (ELEditing)

- (NSString *)el_append:(NSString *)string;
- (NSString *)el_insert:(NSString *)string atIndex:(NSInteger)index;

@end

@interface NSString (ELCharacterCalculate)

-(NSUInteger)el_standardCharCount;
-(NSUInteger)el_chineseCharCount;
-(NSUInteger)el_chineseWordCount;
-(CGSize)el_boundingRectWithSize:(CGSize)size fontSize:(CGFloat)fontSize;
-(CGSize)el_boundingRectWithSize:(CGSize)size fontName:(NSString *)name fontSize:(CGFloat)fontSize;

@end

@interface NSString (ELAttributedString)
-(NSAttributedString *)el_AttRange:(NSRange)range color:(UIColor *)color;
-(NSAttributedString *)el_AttRange:(NSRange)range font:(UIFont *)font;
-(NSAttributedString *)el_AttRange:(NSRange)range font:(UIFont *)font color:(UIColor *)color;
-(NSAttributedString *)el_AttRanges:(NSArray *)ranges colors:(NSArray *)colors;
-(NSAttributedString *)el_AttRanges:(NSArray *)ranges fonts:(NSArray *)fonts;
-(NSAttributedString *)el_AttRanges:(NSArray *)ranges fonts:(NSArray *)fonts colors:(NSArray *)colors;


@end

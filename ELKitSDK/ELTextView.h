//
//  ELTextView.h
//  ELKitSDK
//
//  Created by yin linlin on 2018/2/5.
//

#import <UIKit/UIKit.h>


@class ELTextView;

@protocol ELTextViewDelegate <NSObject>

@optional

//超出可输入字符范围
- (void)el_textViewOverInputRange:(ELTextView *)textView;

- (BOOL)el_textViewShouldBeginEditing:(UITextView *)textView;
- (BOOL)el_textViewShouldEndEditing:(UITextView *)textView;

- (void)el_textViewDidBeginEditing:(UITextView *)textView;
- (void)el_textViewDidEndEditing:(UITextView *)textView;

- (BOOL)el_textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)el_textViewDidChange:(UITextView *)textView;

@end

@interface ELTextView : UIView

@property (nonatomic, copy)       NSString *text;
@property (nonatomic, copy)       NSString *placeholder;
@property (nonatomic, strong)     UIColor  *textColor;
@property (nonatomic, strong)     UIColor  *placeholderColor;
@property (nonatomic, strong)     UIFont   *font;
@property (nonatomic, strong)     UIFont   *placeholderFont;

@property (nonatomic, assign)     BOOL     autoAdjust;//自动调整

@property (nonatomic, assign)     NSInteger maxCharacters; //最多可输入的字符数
@property (nonatomic, assign)     id<ELTextViewDelegate> delegate;

@end

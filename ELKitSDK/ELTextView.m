//
//  ELTextView.m
//  ELKitSDK
//
//  Created by yin linlin on 2018/2/5.
//

#import "ELTextView.h"
#import "UIView+ELExtension.h"

@interface ELTextView ()<UITextViewDelegate>

@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, assign) CGFloat minHeight;
@end


@implementation ELTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUI];
        
    }
    return self;
}

- (void)setUI {
    self.textView = [[UITextView alloc] initWithFrame:self.bounds];
    self.minHeight = self.height;
    [self addSubview:self.textView];
    self.textView.delegate = self;
    
    self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(2, 5, self.width - 4, 20)];
    self.placeholderLabel.font = [UIFont systemFontOfSize:14];
    self.placeholderLabel.textColor = [UIColor lightGrayColor];
    self.placeholderLabel.text = @"请输入...";
    [self.textView addSubview:self.placeholderLabel];
}



#pragma mark - set
- (void)setFont:(UIFont *)font {
    self.textView.font = font;
}

- (void)setTextColor:(UIColor *)textColor {
    self.textView.textColor = textColor;
}

- (void)setText:(NSString *)text {
    self.textView.text = text;
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.placeholderLabel.text = placeholder;
}
- (NSString *)text {
    return self.textView.text;
}
- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    self.placeholderLabel.font = placeholderFont;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setBorderColor:(UIColor *)color borderWidth:(CGFloat)width borderRadius:(CGFloat)radius {
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    self.layer.cornerRadius = radius;
    self.textView.textContainerInset = UIEdgeInsetsMake(radius, radius, radius, radius);
    self.placeholderLabel.frame = CGRectMake(radius, radius, self.textView.width - 2 * radius, 16);
}


#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if ([self.delegate respondsToSelector:@selector(el_textViewShouldBeginEditing:)]) {
        return [self.delegate el_textViewShouldBeginEditing:self.textView];
    } else {
        return YES;
    }
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    if ([self.delegate respondsToSelector:@selector(el_textViewShouldEndEditing:)]) {
        return [self.delegate el_textViewShouldEndEditing:self.textView];
    } else {
        return YES;
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([self.delegate respondsToSelector:@selector(el_textViewDidBeginEditing:)]) {
        [self.delegate el_textViewDidBeginEditing:self.textView];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([self.delegate respondsToSelector:@selector(el_textViewDidEndEditing:)]) {
        [self.delegate el_textViewDidEndEditing:self.textView];
    }
}


- (void)textViewDidChange:(UITextView *)textView {
    self.placeholderLabel.hidden = (textView.text.length > 0 ? YES : NO);
    if (self.autoAdjust) {
        static CGFloat maxHeight = MAXFLOAT;
        CGSize constraintSize = CGSizeMake(textView.width, MAXFLOAT);
        CGSize size = [textView sizeThatFits:constraintSize];
        if (size.height <= self.minHeight) {
            size.height = self.minHeight;
        }else{
            if (size.height >= maxHeight)
            {
                size.height = maxHeight;
                textView.scrollEnabled = YES;   // 允许滚动
            }
            else
            {
                textView.scrollEnabled = NO;    // 不允许滚动
            }
        }
        textView.height = size.height;
        self.height = textView.height;
    }
    if ([self.delegate respondsToSelector:@selector(el_textViewDidChange:)]) {
        [self.delegate el_textViewDidChange:self.textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([self.delegate respondsToSelector:@selector(el_textView:shouldChangeTextInRange:replacementText:)]) {
        [self.delegate el_textView:self.textView shouldChangeTextInRange:range replacementText:text];
    } else if (self.maxCharacters > 0) { //定义最大可输入字符
        if (text.length > 0) {
            NSString * contentString = textView.text;
            if (textView.text.length >= self.maxCharacters) {
                textView.text = [contentString substringToIndex:self.maxCharacters];
                if ([self.delegate respondsToSelector:@selector(el_textViewOverInputRange:)]) {
                    [self.delegate el_textViewOverInputRange:self];
                }
                return NO;
            }
        }
    }
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

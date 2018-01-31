//
//  UIView+ELExtension.m
//  ELKitSDK
//
//  Created by yin linlin on 2018/1/31.
//

#import "UIView+ELExtension.h"

@implementation UIView (ELExtension)

@end


@implementation UIView (Border)

- (CGFloat)left { return CGRectGetMinX(self.frame); }
- (void)setLeft:(CGFloat)left {
    CGRect rect = self.frame;
    rect.origin.x = left;
    self.frame = rect;
}

- (CGFloat)right {return CGRectGetMaxX(self.frame);}
- (void)setRight:(CGFloat)right {
    CGRect rect = self.frame;
    rect.origin.x = right - CGRectGetWidth(self.frame);
    self.frame = rect;
}

- (CGFloat)top {return CGRectGetMinY(self.frame);}
- (void)setTop:(CGFloat)top {
    CGRect rect = self.frame;
    rect.origin.y = top;
    self.frame = rect;
}

- (CGFloat)bottom {return CGRectGetMaxY(self.frame);}
- (void)setBottom:(CGFloat)bottom {
    CGRect rect = self.frame;
    rect.origin.x = bottom - rect.size.height;
    self.frame = rect;
}

- (CGFloat)height {return CGRectGetHeight(self.frame);}
- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (CGFloat)width {return CGRectGetWidth(self.frame);}
- (void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGPoint)origin {return self.frame.origin;}
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {return self.frame.size;}
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)centerX {return self.center.x;}
- (void)setCenterX:(CGFloat)centerX {self.center = CGPointMake(centerX, self.centerY);}

- (CGFloat)centerY {return self.center.y;}
- (void)setCenterY:(CGFloat)centerY {self.center = CGPointMake(self.centerX, centerY);}


@end


@implementation UIView (Gradient)

- (void)setGradientColors:(NSArray <UIColor *>*)colors {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    NSMutableArray * cgColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (UIColor *color in colors) {
        [cgColors addObject:(__bridge id)color.CGColor];
    }
    gradient.colors = cgColors;
    [self.layer addSublayer:gradient];
}

@end



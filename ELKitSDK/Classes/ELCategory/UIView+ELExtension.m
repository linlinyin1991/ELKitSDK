//
//  UIView+ELExtension.m
//  ELKitSDK
//
//  Created by ElaineYin on 2018/1/31.
//

#import "UIView+ELExtension.h"

@implementation UIView (ELExtension)

@end


@implementation UIView (Border)

- (CGFloat)el_left { return CGRectGetMinX(self.frame); }

- (void)setEl_left:(CGFloat)el_left {
    CGRect rect = self.frame;
    rect.origin.x = el_left;
    self.frame = rect;
}


- (CGFloat)el_right {return CGRectGetMaxX(self.frame);}
- (void)setEl_right:(CGFloat)el_right {
    CGRect rect = self.frame;
    rect.origin.x = el_right - CGRectGetWidth(self.frame);
    self.frame = rect;
}

- (CGFloat)el_top {return CGRectGetMinY(self.frame);}
- (void)setEl_top:(CGFloat)el_top {
    CGRect rect = self.frame;
    rect.origin.y = el_top;
    self.frame = rect;
}


- (CGFloat)el_bottom {return CGRectGetMaxY(self.frame);}
- (void)setEl_bottom:(CGFloat)el_bottom {
    CGRect rect = self.frame;
    rect.origin.x = el_bottom - rect.size.height;
    self.frame = rect;
}

- (CGFloat)el_height {return CGRectGetHeight(self.frame);}
- (void)setEl_height:(CGFloat)el_height {
    CGRect rect = self.frame;
    rect.size.height = el_height;
    self.frame = rect;
}


- (CGFloat)el_width {return CGRectGetWidth(self.frame);}

- (void)setEl_width:(CGFloat)el_width {
    CGRect rect = self.frame;
    rect.size.width = el_width;
    self.frame = rect;
}


- (CGPoint)el_origin {return self.frame.origin;}

- (void)setEl_origin:(CGPoint)el_origin {
    CGRect frame = self.frame;
    frame.origin = el_origin;
    self.frame = frame;
}

- (CGSize)el_size {return self.frame.size;}

- (void)setEl_size:(CGSize)el_size {
    CGRect frame = self.frame;
    frame.size = el_size;
    self.frame = frame;
}


- (CGFloat)el_centerX {return self.center.x;}

- (void)setEl_centerX:(CGFloat)el_centerX {
    self.center = CGPointMake(el_centerX, self.el_centerY);
}

- (CGFloat)el_centerY {return self.center.y;}

- (void)setEl_centerY:(CGFloat)el_centerY {
    self.center = CGPointMake(self.el_centerX, el_centerY);
}


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



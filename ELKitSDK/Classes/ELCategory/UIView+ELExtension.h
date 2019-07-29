//
//  UIView+ELExtension.h
//  ELKitSDK
//
//  Created by ElaineYin on 2018/1/31.
//

#import <UIKit/UIKit.h>

@interface UIView (ELExtension)

@end


@interface UIView (Border)

@property(nonatomic)CGFloat el_left;       /*x*/
@property(nonatomic)CGFloat el_right;      /*x+width*/
@property(nonatomic)CGFloat el_top;        /*y*/
@property(nonatomic)CGFloat el_bottom;     /*y+height*/
@property(nonatomic)CGFloat el_width;      /*width*/
@property(nonatomic)CGFloat el_height;     /*height*/
@property(nonatomic)CGPoint el_origin;     /*origin*/
@property(nonatomic)CGSize  el_size;       /*size*/
@property(nonatomic)CGFloat el_centerX;    /*centerX*/
@property(nonatomic)CGFloat el_centerY;    /*centerY*/

@end


@interface UIView (Gradient)

- (void)setGradientColors:(NSArray <UIColor *>*)colors;

@end

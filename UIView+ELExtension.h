//
//  UIView+ELExtension.h
//  ELKitSDK
//
//  Created by yin linlin on 2018/1/31.
//

#import <UIKit/UIKit.h>

@interface UIView (ELExtension)

@end


@interface UIView (Border)

@property(nonatomic)CGFloat left;       /*x*/
@property(nonatomic)CGFloat right;      /*x+width*/
@property(nonatomic)CGFloat top;        /*y*/
@property(nonatomic)CGFloat bottom;     /*y+height*/
@property(nonatomic)CGFloat width;      /*width*/
@property(nonatomic)CGFloat height;     /*height*/
@property(nonatomic)CGPoint origin;     /*origin*/
@property(nonatomic)CGSize  size;       /*size*/
@property(nonatomic)CGFloat centerX;    /*centerX*/
@property(nonatomic)CGFloat centerY;    /*centerY*/

@end


@interface UIView (Gradient)

- (void)setGradientColors:(NSArray <UIColor *>*)colors;

@end

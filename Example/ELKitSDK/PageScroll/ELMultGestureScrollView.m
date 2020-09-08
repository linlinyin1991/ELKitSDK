//
//  ELMultGestureScrollView.m
//  ELKitSDK_Example
//
//  Created by yiche on 2020/9/7.
//  Copyright © 2020 yin linlin. All rights reserved.
//

#import "ELMultGestureScrollView.h"

@implementation ELMultGestureScrollView

///允许同时识别多个手势，处理scrollView联动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


@end

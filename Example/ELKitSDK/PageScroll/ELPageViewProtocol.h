//
//  ELPageViewProtocol.h
//  ELKitSDK_Example
//
//  Created by YinLinLin on 2019/7/30.
//  Copyright © 2019 yin linlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ELPageViewProtocol <NSObject>

@required
- (UIScrollView *)pageScrollView;

/// 当前页面出现
- (void)el_viewDidAppear;

/// 当前页面消失
- (void)el_viewDidDisappear;

- (void)el_scrollViewDidScrollBlock:(void (^)(UIScrollView * _Nonnull))scrollBlock;

@end

NS_ASSUME_NONNULL_END

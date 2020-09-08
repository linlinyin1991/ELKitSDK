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

/// 子页面scrollView
- (nullable UIScrollView *)el_subPageScrollView;

/// 页面显示
- (void)el_viewDidAppear;

/// 页面消失
- (void)el_viewDidDisappear;


@optional

/// 刷新完成回调
- (void)el_refreshData:(void(^)(BOOL success))complete;

/// 子页面滚动回调
- (void)el_scrollViewDidScrollBlock:(void (^)(UIScrollView * _Nonnull))scrollBlock;

- (void)el_scrollViewWillBeginDraggingBlock:(void(^)(UIScrollView *scrollView))beginDraggingBlock;

- (void)el_scrollViewDidEndDraggingBlock:(void(^)(UIScrollView *scrollView, BOOL decelerate))endDraggingBlock;

/// 设置子页面当前选中（用于子页面含有多个子标签时使用）
- (void)el_selectWithParam:(NSDictionary *)param;

/// 设置子页面可显示高度，以及父页面是否有bottomBar，方便对safeBottom做处理
- (void)el_setSubPageViewHeight:(CGFloat)viewHeight hasBottomBar:(BOOL)hasBottomBar;


@end

NS_ASSUME_NONNULL_END

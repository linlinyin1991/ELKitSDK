//
//  ELDeviceUtility.h
//  ELKitSDK
//
//  Created by yin linlin on 2018/2/28.
//

#ifndef ELDeviceUtility_h
#define ELDeviceUtility_h


/*屏幕尺寸宏定义*/
#define kScreenWidth           [UIScreen mainScreen].bounds.size.width
#define kScreenHeight          [UIScreen mainScreen].bounds.size.height

//状态栏高度
#define kStatusHeight          CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)

//导航栏高度
#define kNavigationBarHeight   44

#define kTopHeight             kNavigationBarHeight + kStatusHeight

#define kIsBangsScreen ({\
    BOOL isBangsScreen = NO; \
    if (@available(iOS 11.0, *)) { \
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject]; \
    isBangsScreen = window.safeAreaInsets.bottom > 0; \
    } \
    isBangsScreen; \
})

//底部安全距离
#define kSafeBottom            (kIsBangsScreen?34.0:0.0)

//底部tabbar高度
#define kTabBarHeight          49.0


#endif /* ELDeviceUtility_h */

//
//  ELDeviceUtility.h
//  ELKitSDK
//
//  Created by yin linlin on 2018/2/28.
//

#ifndef ELDeviceUtility_h
#define ELDeviceUtility_h

/*判断硬件平台宏定义*/
#if TARGET_OS_IPHONE
#define TARGET_IPHONE4S   ([UIScreen mainScreen].bounds.size.height == 480.0)
#define TARGET_IPHONE5S   ([UIScreen mainScreen].bounds.size.height == 568.0)
#define TARGET_IPHONE6S   ([UIScreen mainScreen].bounds.size.height == 667.0)
#define TARGET_IPHONE6P   ([UIScreen mainScreen].bounds.size.height == 736.0)
#define TARGET_IPHONEX    ([UIScreen mainScreen].bounds.size.height == 812.0)
#define TARGET_WIDTH_320  ([UIScreen mainScreen].bounds.size.width == 320.0)
#define TARGET_WIDTH_375  ([UIScreen mainScreen].bounds.size.width == 375.0)
#define TARGET_WIDTH_414  ([UIScreen mainScreen].bounds.size.width == 414.0)
#endif

/*屏幕尺寸宏定义*/
#define KScreenWidth           [UIScreen mainScreen].bounds.size.width
#define KScreenHeight          [UIScreen mainScreen].bounds.size.height

//状态栏高度
#define KStatusHeight          CGRectGetHeight([UIAKlication sharedApplication].statusBarFrame)

//导航栏高度
#define KNavigationBarHeight   44

#define kTopHeight             KNavigationBarHeight + KStatusHeight
//底部安全距离
#define KSafeBottom            (TARGET_IPHONEX?34.0:0.0)

//底部tabbar高度
#define KTabBarHeight          49.0


#endif /* ELDeviceUtility_h */

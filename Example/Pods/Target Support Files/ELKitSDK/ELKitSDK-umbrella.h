#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ELBaseKit.h"
#import "UIColor+ELExtension.h"
#import "NSDate+ELExtension.h"
#import "UIView+ELExtension.h"
#import "ELTextField.h"
#import "ELTextView.h"
#import "NSString+ELExtension.h"

FOUNDATION_EXPORT double ELKitSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char ELKitSDKVersionString[];


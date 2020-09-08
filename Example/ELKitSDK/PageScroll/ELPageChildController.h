//
//  ELPageChildController.h
//  ELKitSDK_Example
//
//  Created by YinLinLin on 2019/7/31.
//  Copyright © 2019 yin linlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELPageViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ELPageChildController : UIViewController<ELPageViewProtocol>

@property (nonatomic, assign) NSInteger index;

@end

NS_ASSUME_NONNULL_END

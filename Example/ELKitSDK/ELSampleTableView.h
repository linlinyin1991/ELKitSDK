//
//  ELSampleTableView.h
//  ELKitSDK_Example
//
//  Created by yiche on 2020/9/8.
//  Copyright © 2020 yin linlin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ELSampleTableView : UITableView

@property (nonatomic, copy) void(^didSelectBlock)(NSInteger index);

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style titleArray:(NSArray *)titleArray;

@end

NS_ASSUME_NONNULL_END

//
//  ELBasicAnimalController.m
//  ELKitSDK_Example
//
//  Created by yiche on 2020/9/8.
//  Copyright © 2020 yin linlin. All rights reserved.
//

#import "ELBasicAnimalController.h"

@interface ELBasicAnimalController ()

@end

@implementation ELBasicAnimalController

/// 参考：https://www.jianshu.com/p/e1b1d30cd7c0
/**
 隐式动画：没有指定任何动画的类型，仅仅改变了一个属性，然后Core Animation来决定如何并且何时去做动画
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"隐式动画";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

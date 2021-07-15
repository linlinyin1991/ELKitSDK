//
//  ELBasicTestController.m
//  ELKitSDK_Example
//
//  Created by yiche on 2021/7/15.
//  Copyright © 2021 yin linlin. All rights reserved.
//

#import "ELBasicTestController.h"

@interface ELBasicTestController ()

@end

@implementation ELBasicTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"Basic test";
    [self sortTest];
}

// 排序
- (void)sortTest {
    /*
     NSOrderedAscending = -1L,表示两个比较的对象前者小于后置
     NSOrderedSame, 表示比较的对象相等
     NSOrderedDescending表示两个比较的对象前者大于后者
     1.sortedArrayUsingComparator这个方法本身就是按递增的方式排序。
     2.返回的返回值（NSOrderedAscending 不交换，NSOrderedSame 不交换，NSOrderedDescending 交换）。
     例如：object1 < object2 返回：NSOrderedDescending 则交换（变为object2，object1），以保证安方法本身升序。返回NSOrderedAscending，两者不交换。
    */
    NSArray *array = @[@5, @3, @100, @13, @87, @10];
    NSArray *sortArray = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        NSInteger num1 = obj1.integerValue;
        NSInteger num2 = obj2.integerValue;
        // 当返回值为NSOrderedDescending时，obj2的位置就会移动到obj1前面
        return (num1 > num2)?NSOrderedDescending:NSOrderedAscending;
    }];
    NSLog(@"sortArray = %@", sortArray);
    array = @[@"adf", @"ert", @"czx", @"uy"];
    sortArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    NSLog(@"sortArray = %@", sortArray);
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

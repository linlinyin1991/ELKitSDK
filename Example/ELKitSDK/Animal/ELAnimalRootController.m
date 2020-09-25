//
//  ELAnimalRootController.m
//  ELKitSDK_Example
//
//  Created by yiche on 2020/9/8.
//  Copyright © 2020 yin linlin. All rights reserved.
//

#import "ELAnimalRootController.h"
#import "ELSampleTableView.h"
#import "ELBasicAnimalController.h"

@interface ELAnimalRootController ()

@property (nonatomic, strong) ELSampleTableView *tableView;

@end

@implementation ELAnimalRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    NSArray *titleArray = @[@"隐式动画", @"显式动画", @"关键帧动画"];
    _tableView = [[ELSampleTableView alloc] initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight - kTopHeight) style:UITableViewStylePlain titleArray:titleArray];
    [self.view addSubview:_tableView];
    __weak typeof(self) weakSelf = self;
    _tableView.didSelectBlock = ^(NSInteger index) {
        [weakSelf selectAtIndex:index];
    };
}

- (void)selectAtIndex:(NSInteger)index {
    switch (index) {
        case 0: {
            ELBasicAnimalController *baseAnimalVC = [[ELBasicAnimalController alloc] init];
            [self.navigationController pushViewController:baseAnimalVC animated:YES];
        }
            break;
        case 1: {
//            ELPageRootController *pageVC = [[ELPageRootController alloc] init];
//            [self.navigationController pushViewController:pageVC animated:YES];
        }
            break;
            
        default:
            break;
    }
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

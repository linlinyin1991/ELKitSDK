//
//  ELPageScrollViewController.m
//  ELKitSDK_Example
//
//  Created by YinLinLin on 2019/7/30.
//  Copyright © 2019 yin linlin. All rights reserved.
//

#import "ELPageScrollViewController.h"

@interface ELPageScrollViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UISegmentedControl *segment;

@end

@implementation ELPageScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        _headerView.backgroundColor = [UIColor cyanColor];
    }
    return _headerView;
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

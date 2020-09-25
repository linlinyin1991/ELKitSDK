//
//  ELViewController.m
//  ELKitSDK
//
//  Created by ElaineYin on 01/31/2018.
//  Copyright (c) 2018 ElaineYin. All rights reserved.
//

#import "ELViewController.h"
#import "ELEncryptViewController.h"
#import "ELPageRootController.h"
#import "ELSampleTableView.h"
#import "ELAnimalRootController.h"

@interface ELViewController ()

@property (nonatomic, strong) ELSampleTableView *tableView;

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ELViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _titleArray = @[@"Encrypt", @"pageView", @"Animal"];
    [self.view addSubview:self.tableView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)selectAtIndex:(NSInteger)index {
    switch (index) {
        case 0: {
            ELEncryptViewController *encryptVC = [[ELEncryptViewController alloc] init];
            [self.navigationController pushViewController:encryptVC animated:YES];
        }
            break;
        case 1: {
            ELPageRootController *pageVC = [[ELPageRootController alloc] init];
            [self.navigationController pushViewController:pageVC animated:YES];
        }
            break;
        case 2: {
            ELAnimalRootController *animalVC = [[ELAnimalRootController alloc] init];
            [self.navigationController pushViewController:animalVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (ELSampleTableView *)tableView {
    if (!_tableView) {
        _tableView = [[ELSampleTableView alloc] initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight - kTopHeight) style:UITableViewStylePlain titleArray:self.titleArray];
        __weak typeof(self) weakSelf = self;
        _tableView.didSelectBlock = ^(NSInteger index) {
            [weakSelf selectAtIndex:index];
        };
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

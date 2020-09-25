//
//  ELSampleTableView.m
//  ELKitSDK_Example
//
//  Created by yiche on 2020/9/8.
//  Copyright © 2020 yin linlin. All rights reserved.
//

#import "ELSampleTableView.h"

@interface ELSampleTableView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *titleArray;

@end

@implementation ELSampleTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style titleArray:(NSArray *)titleArray {
    if (self = [super initWithFrame:frame style:style]) {
        self.backgroundColor = UIColor.whiteColor;
        self.titleArray = titleArray;
        self.delegate = self;
        self.dataSource = self;
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        self.estimatedRowHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.tableFooterView = [UIView new];
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.textColor = UIColor.blackColor;
        cell.backgroundColor = UIColor.whiteColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectBlock) {
        self.didSelectBlock(indexPath.row);
    }
}

@end

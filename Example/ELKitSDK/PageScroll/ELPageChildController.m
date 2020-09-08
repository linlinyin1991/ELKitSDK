//
//  ELPageChildController.m
//  ELKitSDK_Example
//
//  Created by YinLinLin on 2019/7/31.
//  Copyright © 2019 yin linlin. All rights reserved.
//

#import "ELPageChildController.h"


@interface ELPageChildController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) CGFloat viewHeight;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, copy) void(^scrollBlock)(UIScrollView *scrollView);
@end

@implementation ELPageChildController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 30; i ++) {
        [_titleArray addObject:[NSString stringWithFormat:@"title:%ld-%ld",self.index, i]];
    }
    [self.view addSubview:self.tableView];
}

    
#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PageCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PageCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollBlock) {
        self.scrollBlock(scrollView);
    }
}
#pragma mark - ELPageViewProtocol

- (UIScrollView *)el_subPageScrollView {
    return self.tableView;
}

- (void)el_viewDidAppear {
}

- (void)el_viewDidDisappear {
    
}

- (void)el_scrollViewDidScrollBlock:(nonnull void (^)(UIScrollView * _Nonnull))scrollBlock {
    self.scrollBlock = scrollBlock;
}

- (void)el_setSubPageViewHeight:(CGFloat)viewHeight hasBottomBar:(BOOL)hasBottomBar {
    self.viewHeight = viewHeight;
}
#pragma mark - property

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.viewHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
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

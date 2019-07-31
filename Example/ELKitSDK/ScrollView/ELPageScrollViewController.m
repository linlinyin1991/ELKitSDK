//
//  ELPageScrollViewController.m
//  ELKitSDK_Example
//
//  Created by YinLinLin on 2019/7/30.
//  Copyright © 2019 yin linlin. All rights reserved.
//

#import "ELPageScrollViewController.h"
#import "ELPage1ViewController.h"
#import "ELPageViewProtocol.h"

@interface ELRootTableView : UITableView

@end

@implementation ELRootTableView

///允许同时识别多个手势，处理scrollView联动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end

@interface ELPageScrollViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) ELRootTableView *tableView;

@property (nonatomic, strong) UIScrollView *pageScrollView;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UISegmentedControl *segment;

@property (nonatomic, strong) ELPage1ViewController *page1VC;

@property (nonatomic, strong) ELPage1ViewController *page2VC;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, assign) CGFloat pageViewHeight;
@property (nonatomic, assign) CGFloat headerViewHeight;

/// 默认为YES
@property (nonatomic, assign) BOOL scrollEnabled;

@end

@implementation ELPageScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[@"page1",@"page2"];
    self.headerViewHeight = 200;
    _pageViewHeight = kScreenHeight - kTopHeight - self.segment.el_height;
    self.scrollEnabled = YES;
    [self.view addSubview:self.tableView];
    self.segment.selectedSegmentIndex = 1;
    [self selectAtIndex:1];
}

- (void)selectAtIndex:(NSInteger)index {
    if (index == 0) {
        if (![self.childViewControllers containsObject:self.page1VC]) {
            [self addChildViewController:self.page1VC];
            self.page1VC.view.frame = CGRectMake(0, 0, kScreenWidth, self.pageViewHeight);
            [self.pageScrollView addSubview:self.page1VC.view];
        }
        [self.pageScrollView scrollRectToVisible:self.page1VC.view.frame animated:NO];
    } else {
        if (![self.childViewControllers containsObject:self.page2VC]) {
            [self addChildViewController:self.page2VC];
            self.page2VC.view.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, self.pageViewHeight);
            [self.pageScrollView addSubview:self.page2VC.view];
        }
        [self.pageScrollView scrollRectToVisible:self.page2VC.view.frame animated:NO];
    }
}

- (void)selectItem:(UISegmentedControl *)sender {
    [self selectAtIndex:sender.selectedSegmentIndex];
}
#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return _pageViewHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PageCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PageCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:self.pageScrollView];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.segment.el_height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.segment;
}

    
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat changeScrollHeight = self.headerView.el_height;
    CGFloat offset = scrollView.contentOffset.y;
    if (self.scrollEnabled) {
        if (offset > changeScrollHeight) {
            [self.tableView setContentOffset:CGPointMake(0, changeScrollHeight)];
            self.scrollEnabled = NO;
        }
    } else {
        [self.tableView setContentOffset:CGPointMake(0, changeScrollHeight)];
    }
}
    
- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.headerViewHeight)];
        _headerView.backgroundColor = [UIColor cyanColor];
    }
    return _headerView;
}

- (UIScrollView *)pageScrollView {
    if (!_pageScrollView) {
        _pageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.pageViewHeight)];
        _pageScrollView.contentSize = CGSizeMake(kScreenWidth *self.titleArray.count, self.pageViewHeight);
        _pageScrollView.pagingEnabled = YES;
        _pageScrollView.delegate = self;
        _pageScrollView.showsHorizontalScrollIndicator = NO;
        _pageScrollView.showsVerticalScrollIndicator = NO;
    }
    return _pageScrollView;
}

- (ELRootTableView *)tableView {
    if (!_tableView) {
        _tableView = [[ELRootTableView alloc] initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight - kTopHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

- (UISegmentedControl *)segment {
    if (!_segment) {
        
        _segment = [[UISegmentedControl alloc] initWithItems:self.titleArray];
        _segment.frame = CGRectMake(0, 0, kScreenWidth, 50);
        _segment.tintColor = [UIColor blueColor];
        // 设置分段名的字体
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blueColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName ,nil];
        [_segment setTitleTextAttributes:dic forState:UIControlStateNormal];
        
        // 设置初始选中项
        _segment.selectedSegmentIndex = 0;
        
        [_segment addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventValueChanged];// 添加响应方法
    }
    return _segment;
}

- (ELPage1ViewController *)page1VC {
    if (!_page1VC) {
        _page1VC = [[ELPage1ViewController alloc] init];
        _page1VC.index = 0;
        _page1VC.view.backgroundColor = [UIColor purpleColor];
        [_page1VC el_scrollViewDidScrollBlock:^(UIScrollView * scrollView) {
            if (!self.scrollEnabled) {
                CGFloat offset = scrollView.contentOffset.y;
                if (offset <= 0) {
                    self.scrollEnabled = YES;
                    [scrollView setContentOffset:CGPointMake(0, 0)];
                }
            } else {
                [scrollView setContentOffset:CGPointMake(0, 0)];
            }
        }];
    }
    return _page1VC;
}


- (ELPage1ViewController *)page2VC {
    if (!_page2VC) {
        _page2VC = [[ELPage1ViewController alloc] init];
        _page2VC.index = 1;
        _page2VC.view.backgroundColor = [UIColor grayColor];
        [_page2VC el_scrollViewDidScrollBlock:^(UIScrollView * scrollView) {
            if (!self.scrollEnabled) {
                CGFloat offset = scrollView.contentOffset.y;
                if (offset <= 0) {
                    self.scrollEnabled = YES;
                    [scrollView setContentOffset:CGPointMake(0, 0)];
                }
            } else {
                [scrollView setContentOffset:CGPointMake(0, 0)];
            }
        }];
    }
    return _page2VC;
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

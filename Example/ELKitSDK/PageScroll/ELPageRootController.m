//
//  ELPageRootController.m
//  ELKitSDK_Example
//
//  Created by yiche on 2020/9/7.
//  Copyright © 2020 yin linlin. All rights reserved.
//

#import "ELPageRootController.h"
#import "ELPageChildController.h"
#import "ELMultGestureScrollView.h"
#import "ELPageViewProtocol.h"
#import "UIColor+ELExtension.h"

@interface ELPageRootController ()<UIScrollViewDelegate>

@property (nonatomic, strong) ELMultGestureScrollView *rootScrollView;
/// 是否可以滚动
@property (nonatomic, assign) BOOL rootPageScrollEnabled;
@property (nonatomic, strong) UIScrollView *pageScrollView;
@property (nonatomic, assign) CGFloat pageViewHeight;
/// 头部区域
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, assign) CGFloat segmentHeight;
///// 底部区域
//@property (nonatomic, strong) UIView *bottomView;
//@property (nonatomic, assign) CGFloat bottomHeight;

/// segment标题
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, copy) NSArray<UIColor *> *originColors;

@end

@implementation ELPageRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rootPageScrollEnabled = YES;
    [self layoutUI];
    [self createChildVC];
    [self selectAtIndex:0];
}



- (void)layoutUI {
    self.view.backgroundColor = UIColor.whiteColor;
    self.titleArray = @[@"childPage1", @"childPage2", @"childPage3"];
    self.headerHeight = 300;
    self.segmentHeight = 40;
    self.pageViewHeight = kScreenHeight - kTopHeight - self.segmentHeight;
    [self.view addSubview:self.rootScrollView];
    [self.rootScrollView addSubview:self.headerView];
    [self.rootScrollView addSubview:self.pageScrollView];
}

- (void)createChildVC {
    [self.titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ELPageChildController *childVC = [[ELPageChildController alloc] init];
        childVC.index = idx;
        if ([childVC respondsToSelector:@selector(el_setSubPageViewHeight:hasBottomBar:)]) {
            [childVC el_setSubPageViewHeight:self.pageViewHeight hasBottomBar:NO];
        }
        [self addChildViewController:childVC];
        [childVC didMoveToParentViewController:self];
        __weak typeof(self) weakSelf = self;
        [childVC el_scrollViewDidScrollBlock:^(UIScrollView * scrollView) {
            [weakSelf configChildScrollView:scrollView];
        }];
    }];
}


#pragma mark - Actions

- (void)segmentDidChanged:(UISegmentedControl *)sender {
    [self selectAtIndex:sender.selectedSegmentIndex];
}

- (void)selectAtIndex:(NSInteger)index {
    if (self.childViewControllers.count > index) {
        if ([self.childViewControllers[index] conformsToProtocol:@protocol(ELPageViewProtocol)]) {
            ELPageChildController *vc = self.childViewControllers[index];
            if (![vc.view isDescendantOfView:self.pageScrollView]) {
                vc.view.frame = CGRectMake(kScreenWidth * index, 0, kScreenWidth, self.pageViewHeight);
                vc.view.backgroundColor = self.originColors[index];
                [self.pageScrollView addSubview:vc.view];
            }
            [self.pageScrollView setContentOffset:CGPointMake(kScreenWidth*index, 0) animated:YES];
            for (NSInteger i = 0; i < self.childViewControllers.count; i ++) {
                ELPageChildController *childVC = self.childViewControllers[i];
                if (i == index) { // 选中
                    [childVC el_viewDidAppear];
                } else { // 消失
                    [childVC el_viewDidDisappear];
                }
            }
        }
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.rootScrollView) {
        if (self.childViewControllers.count > 0) {
            // 整体滚动时，设置childVC中显示的位置
            CGFloat changeScrollHeight = self.headerHeight - self.segmentHeight;
            CGFloat offset = scrollView.contentOffset.y;
            if (self.rootPageScrollEnabled) {
                if (offset > changeScrollHeight) {
                    [self.rootScrollView setContentOffset:CGPointMake(0, changeScrollHeight)];
                    self.rootPageScrollEnabled = NO;
                }
            } else {
                [self.rootScrollView setContentOffset:CGPointMake(0, changeScrollHeight)];
            }
        } else {
            self.rootPageScrollEnabled = YES;
        }
    }
}

- (void)configChildScrollView:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    if (!self.rootPageScrollEnabled) {
        if (offset <= 0) {
            self.rootPageScrollEnabled = YES;
            for (UIViewController<ELPageViewProtocol> *vc in self.childViewControllers) {
                if ([vc isViewLoaded]) {
                    [vc.el_subPageScrollView setContentOffset:CGPointMake(0, 0)];
                }
            }
        }
    } else {
        [scrollView setContentOffset:CGPointMake(0, 0)];
    }
}

#pragma mark - Property

- (ELMultGestureScrollView *)rootScrollView {
    if (!_rootScrollView) {
        _rootScrollView = [[ELMultGestureScrollView alloc] initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, kScreenHeight - kTopHeight)];
        _rootScrollView.contentSize = CGSizeMake(kScreenWidth, self.headerHeight + kScreenHeight);
        _rootScrollView.delegate = self;
        _rootScrollView.showsVerticalScrollIndicator = NO;
        _rootScrollView.showsHorizontalScrollIndicator = NO;
        _rootScrollView.scrollsToTop = NO;
        if (@available(iOS 11.0, *)) {
            _rootScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _rootScrollView;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.headerHeight)];
        _headerView.backgroundColor = UIColor.cyanColor;
        [_headerView addSubview:self.segment];
    }
    return _headerView;
}

- (UIScrollView *)pageScrollView {
    if (!_pageScrollView) {
        _pageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.headerHeight, kScreenWidth, self.pageViewHeight)];
        _pageScrollView.contentSize = CGSizeMake(kScreenWidth * self.titleArray.count, self.pageViewHeight);
        _pageScrollView.showsHorizontalScrollIndicator = NO;
        _pageScrollView.showsVerticalScrollIndicator = NO;
        _pageScrollView.delegate = self;
        _pageScrollView.pagingEnabled = YES;
        _pageScrollView.scrollsToTop = NO;
        if (@available(iOS 11.0, *)) {
            _pageScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _pageScrollView;
}

- (UISegmentedControl *)segment {
    if (!_segment) {
        _segment = [[UISegmentedControl alloc] initWithItems:self.titleArray];
        _segment.frame = CGRectMake(0, self.headerHeight - self.segmentHeight, kScreenWidth, self.segmentHeight);
        _segment.backgroundColor = UIColor.whiteColor;
        _segment.tintColor = [UIColor blueColor];
        // 设置分段名的字体
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:UIColor.blackColor,NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName ,nil];
        [_segment setTitleTextAttributes:dic forState:UIControlStateNormal];
        NSDictionary *selectDic = [NSDictionary dictionaryWithObjectsAndKeys:UIColor.blueColor,NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName ,nil];
        [_segment setTitleTextAttributes:selectDic forState:UIControlStateSelected];
        // 设置初始选中项
        _segment.selectedSegmentIndex = 0;
        
        [_segment addTarget:self action:@selector(segmentDidChanged:) forControlEvents:UIControlEventValueChanged];// 添加响应方法
    }
    return _segment;
}

- (NSArray<UIColor *> *)originColors {
    if (!_originColors) {
        _originColors = @[
                          [UIColor el_hexColorWithString:@"#53F3FF"],
                          [UIColor el_hexColorWithString:@"#9361F5"],
                          [UIColor el_hexColorWithString:@"#FA7164"],
                          [UIColor el_hexColorWithString:@"#FFDE5C"],
                          [UIColor el_hexColorWithString:@"#62CFFF"],
                          [UIColor el_hexColorWithString:@"#65FFDB"],
                          [UIColor el_hexColorWithString:@"#5890FF"],
                          [UIColor el_hexColorWithString:@"#FACC8A"]];
        
    }
    return _originColors;
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

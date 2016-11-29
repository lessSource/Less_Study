//
//  BaseTabelView.m
//  Less_Study
//
//  Created by Lj on 2016/10/23.
//  Copyright © 2016年 Lj. All rights reserved.
//

#import "BaseTabelView.h"

@interface BaseTabelView()

@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, strong) MJRefreshNormalHeader *refreshHeader;
@property (nonatomic, strong) MJRefreshBackNormalFooter *refreshFooter;
@property (nonatomic, strong) NSArray *imageArr;
@end

@implementation BaseTabelView


//- (void)layoutSubviews {
//    self.tableFooterView = [[UIView alloc]init];
//}

- (void)setIsRefresh:(BOOL)isRefresh {
    if (isRefresh)
        [self tabelViewSetupRefresh];
    else
        return;
}

- (void)setIsFooterView:(BOOL)isFooterView {
    if (isFooterView)
        self.tableFooterView = [[UIView alloc]init];
    else
        return;
}

- (void)refreshImageArr:(NSArray *)dataArray {
    _imageArr = dataArray;
}


// 马上进入刷新状态
- (void)beginRefreshing {
    [self.mj_header beginRefreshing];
}

- (void)setIsLastUpdateTime:(BOOL)isLastUpdateTime {
    self.refreshHeader.lastUpdatedTimeLabel.hidden = isLastUpdateTime;
}

- (void)tabelViewSetupRefresh {
    self.refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    self.refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    self.mj_header = self.refreshHeader;
    self.mj_footer = self.refreshFooter;
}

//下拉刷新
- (void)headerRefresh {
    self.pageCount = 1;
    [self.refreshDelegate tableViewRefresh:YES PageCount:self.pageCount];
    [self.mj_header endRefreshing];
}

//上拉加载
- (void)footerRefresh {
    self.pageCount ++;
    [self.refreshDelegate tableViewRefresh:NO PageCount:self.pageCount];
    [self.mj_footer endRefreshing];
}


@end

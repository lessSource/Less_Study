//
//  BaseTabelView.h
//  Less_Study
//
//  Created by Lj on 2016/10/23.
//  Copyright © 2016年 Lj. All rights reserved.
//
////////////////////////////////////////////////////010011000110010101110011011100110101111101010011011101000111010101100100011110010010000010011100000110111000001111001110011100000101011100111110110100100000111010100011111101010001111101100111000001101110000001101111001000001100010100110001000000101111110100111000001101110101101100010
////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@protocol TabelViewRefreshDelegate <NSObject>

@required
- (void)tableViewRefresh:(BOOL)refresh PageCount:(NSInteger)pageCount;

@end

@interface BaseTabelView : UITableView
@property (nonatomic, assign) NSObject<TabelViewRefreshDelegate> *refreshDelegate;
//是否刷新
@property (nonatomic, assign) BOOL isRefresh;
//是否显示没有数据的单元格
@property (nonatomic, assign) BOOL isFooterView;
//隐藏时间
@property (nonatomic, assign) BOOL isLastUpdateTime;

// 马上进入刷新状态
- (void)beginRefreshing;
//下拉刷新动画图片
- (void)refreshImageArr:(NSArray *)dataArray;
@end

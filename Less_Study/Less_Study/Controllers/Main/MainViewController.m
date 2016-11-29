//
//  MainViewController.m
//  Less_Study
//
//  Created by Lj on 2016/10/30.
//  Copyright © 2016年 Lj. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()<TabelViewRefreshDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) BaseTabelView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    self.title = @"首页";
    
    self.tableView = [[BaseTabelView alloc]initWithFrame:CGRectMake(0, 0, App_Frame_Width, App_Frame_Height - kNavbarAndStatusBar) style:UITableViewStylePlain];
    self.tableView.isRefresh = YES;
    self.tableView.refreshDelegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.isFooterView = YES;
    [self.view addSubview:self.tableView];
}

- (void)tableViewRefresh:(BOOL)refresh PageCount:(NSInteger)pageCount {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifire = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifire];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifire];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"测试";
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

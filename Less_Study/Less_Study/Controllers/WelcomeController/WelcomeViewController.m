//
//  WelcomeViewController.m
//  Less_Study
//
//  Created by Lj on 2016/10/30.
//  Copyright © 2016年 Lj. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@property (nonatomic, strong) UIScrollView *imageScrollView; //滚动视图
@property (nonatomic, strong) UIButton *jumpButton;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"欢迎";
    // Do any additional setup after loading the view.
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

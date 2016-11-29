//
//  DPTabBarController.m
//  DP
//
//  Created by xy_ios on 15/6/9.
//  Copyright (c) 2015年 dp. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "MainViewController.h"
#import "WelcomeViewController.h"
#import "UserViewController.h"

#define TabBarItem_FontSize 12.0
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initControllers];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tabBar setBackgroundColor:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initControllers {
    UIViewController *mianVC = [self createController:[MainViewController new] normalImg:@"tab_w_unsel_50" selectImg:@"tab_w_sel_50" title:@"首页"];
    UIViewController *welcomeVC = [self createController:[WelcomeViewController new] normalImg:@"tab_w_unsel_50" selectImg:@"tab_w_sel_50" title:nil];
    UIViewController *userVC = [self createController:[UserViewController new] normalImg:@"tab_w_unsel_50" selectImg:@"tab_w_sel_50" title:@"我的"];
    self.viewControllers = @[mianVC,welcomeVC,userVC];
    [[UITabBar appearance] setBarTintColor:TabBar_TintColor];
}

- (UIViewController *)createController:(UIViewController *)controller normalImg:(NSString *)normalImg selectImg:(NSString *)selectImg title:(NSString *)title {
    UINavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:controller];
    nav.tabBarItem = [BaseTabBarController createTabbarItemTitle:title ForImage:[UIImage imageNamed:normalImg] ForSelectImage:[UIImage imageNamed:selectImg]];
    [nav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TabBar_NormalColor,NSForegroundColorAttributeName,[UIFont systemFontOfSize:TabBarItem_FontSize],NSFontAttributeName, nil]forState:UIControlStateNormal];
    [nav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:TabBar_SelectColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    return nav;
}

#pragma mark - class method
+ (UITabBarItem *)createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image {
    UIImage *oImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:oImage tag:0];
    return item;
}

+ (UITabBarItem *)createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image ForSelectImage:(UIImage *)sImage {
    UIImage *oImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *osImage = [sImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:oImage selectedImage:osImage];
    if (title == nil) {
        CGFloat offset = 5.0;
        item.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
    }
    return item;
}

@end

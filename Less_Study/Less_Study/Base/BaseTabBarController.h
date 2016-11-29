//
//  DPTabBarController.h
//  DP
//
//  Created by xy_ios on 15/6/9.
//  Copyright (c) 2015年 dp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarController : UITabBarController 
+ (UITabBarItem *)createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image;

+ (UITabBarItem *)createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image ForSelectImage:(UIImage *)sImage;

@end

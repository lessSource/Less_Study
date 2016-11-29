//
//  SmHudUtil.h
//  SmKit
//
//  Created by fanshijian on 15/9/24.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface SmHudUtil : NSObject

/**
 *  显示HUD
 *
 *  @param title    主标题
 *  @param subTitle 副标题
 */
+ (void)showHUDWithTitle:(NSString *)title subtitle:(NSString *)subTitle;

/**
 *  显示等待HUD
 *
 *  @param msg 等待提示消息
 */
+ (void)showWaitHUDWithMsg:(NSString *)msg;

/**
 *  显示等待HUD，自定义loading
 *
 *  @param loadImg loading图片
 *  @param msg 等待提示消息
 */
+ (void)showWaitHUDWithImage:(UIImageView *)loadImg msg:(NSString *)msg;

/**
 *  显示成功HUD
 *
 *  @param msg 成功提示消息
 */
+ (void)showSuccHUDwithMsg:(NSString *)msg;

/**
 *  显示失败HUD
 *
 *  @param msg 失败提示消息
 */
+ (void)showFailHUDwithMsg:(NSString *)msg;

/**
 *  隐藏等待HUD
 */
+ (void)hideHUD;


/**
 * 进度条
 **/
+ (void)showProgressModel:(MBProgressHUDMode)model block:(void (^)(MBProgressHUD *hud))pBlock;

@end

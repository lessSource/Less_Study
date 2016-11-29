//
//  SmHudUtil.m
//  SmKit
//
//  Created by fanshijian on 15/9/24.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import "SmHudUtil.h"

static MBProgressHUD *loadingHUD;
static MBProgressHUD *_porgessHUD;

@implementation SmHudUtil

/**
 *  显示HUD
 *
 *  @param title    主标题
 *  @param subTitle 副标题
 */
+ (void)showHUDWithTitle:(NSString *)title subtitle:(NSString *)subTitle {
//    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].delegate.window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];

    
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    hud.detailsLabelText = subTitle;
    
    [[UIApplication sharedApplication].delegate.window addSubview:hud];
    [[UIApplication sharedApplication].delegate.window bringSubviewToFront:hud];
    
    [hud show:YES];
    [hud hide:YES afterDelay:2];
}

/**
 *  显示等待HUD
 *
 *  @param msg 等待提示消息
 */
+ (void)showWaitHUDWithMsg:(NSString *)msg {
    if (loadingHUD == nil) {
        loadingHUD = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].delegate.window];
        loadingHUD.removeFromSuperViewOnHide = YES;
    }
    loadingHUD.labelText = msg;
    [[UIApplication sharedApplication].delegate.window addSubview:loadingHUD];
    [[UIApplication sharedApplication].delegate.window bringSubviewToFront:loadingHUD];
    
    [loadingHUD show:YES];
}


/**
 *  显示等待HUD，自定义loading
 *
 *  @param loadImg loading图片
 *  @param msg 等待提示消息
 */
+ (void)showWaitHUDWithImage:(UIImageView *)loadImg msg:(NSString *)msg {
    if (loadingHUD == nil) {
        loadingHUD = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].delegate.window];
        loadingHUD.removeFromSuperViewOnHide = YES;
    }
    // 设置不让点击，显示时，可以点击后面的界面
    loadingHUD.userInteractionEnabled = YES;
    
//    loadingHUD.customView = loadImg;
//    loadingHUD.mode = MBProgressHUDModeCustomView;
    //    loadingHUD.color = [UIColor clearColor];
    loadingHUD.labelText = msg;
    
    [[UIApplication sharedApplication].delegate.window addSubview:loadingHUD];
    [[UIApplication sharedApplication].delegate.window bringSubviewToFront:loadingHUD];
    
    [loadingHUD show:YES];
}

/**
 *  显示成功HUD
 *
 *  @param msg 成功提示消息
 */
+ (void)showSuccHUDwithMsg:(NSString *)msg {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].delegate.window];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success-white"]];
    hud.labelText = msg;
    
    [[UIApplication sharedApplication].delegate.window addSubview:hud];
    [[UIApplication sharedApplication].delegate.window bringSubviewToFront:hud];
    
    [hud show:YES];
    [hud hide:YES afterDelay:1];
}

/**
 *  显示失败HUD
 *
 *  @param msg 失败提示消息
 */
+ (void)showFailHUDwithMsg:(NSString *)msg {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].delegate.window];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error-white"]];
    hud.labelText = msg;
    
    [[UIApplication sharedApplication].delegate.window addSubview:hud];
    [[UIApplication sharedApplication].delegate.window bringSubviewToFront:hud];
    
    [hud show:YES];
    [hud hide:YES afterDelay:1];
}

/**
 *  隐藏等待HUD
 */
+ (void)hideHUD {
    if (loadingHUD) {
        [loadingHUD hide:YES];
    }
}


/**
 * 进度条
 **/
+ (void)showProgressModel:(MBProgressHUDMode)model block:(void (^)(MBProgressHUD *hud))pBlock {
    if (! _porgessHUD) {
        _porgessHUD = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].delegate.window];
        _porgessHUD.removeFromSuperViewOnHide = YES;
    }
    
    [[UIApplication sharedApplication].delegate.window addSubview:_porgessHUD];
    [[UIApplication sharedApplication].delegate.window bringSubviewToFront:_porgessHUD];
    
    _porgessHUD.mode = model;
    
    [_porgessHUD showAnimated:YES whileExecutingBlock:^{
        
//        float progress = 0.0f;
//        
//        while (progress < 1.0f) {
//            
//            progress += 0.01f;
//            
//            _porgessHUD.progress = progress;
//            
//            usleep(50000);
//            
//        }
//
        if (pBlock) {
            pBlock(_porgessHUD);
        }
    } completionBlock:^{
        [_porgessHUD removeFromSuperview];
        
        _porgessHUD = nil;
        
    }];
}

@end

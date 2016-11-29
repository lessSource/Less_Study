//
//  SGAlertUtil.m
//  SGShow
//
//  Created by fanshijian on 15-3-10.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import "SGAlertUtil.h"
#import "Toast+UIView.h"

@implementation SGAlertUtil
@synthesize isShow;

+ (id)alertManager {
    static SGAlertUtil *alertUtil;
    if (!alertUtil) {
        @synchronized(self) {
            if (!alertUtil) {
                alertUtil = [[SGAlertUtil alloc] init];
            }
        }
    }
    return alertUtil;
}

- (id)init {
    self = [super init];
    if (self) {
        isShow = YES;
    }
    return self;
}

// 显示提示语，一闪而逝
- (void)showPromptInfo:(NSString *)info {
    if (self.isShow) {
        isShow = NO;
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        UIView *aview = [window.subviews lastObject];
        [[UIApplication sharedApplication].delegate.window addSubview:aview];
        
        [aview makeToast:info duration:1.0 position:@"center"];
        
        [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.4];
    }
}

- (void)delayMethod {
    isShow = YES;
}

- (void)myTask {
    // Do something usefull in here instead of sleeping ...
    sleep(1);
}

/**FunctionRef
 *  @Author 小凡
 *  @Brief  显示loading
 *  @Todo   数据请求时间很长时，加loading显示
 */
- (void)showLoading:(ATShowType)type {
    if (loadingHUD == nil) {
        loadingHUD = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].delegate.window];
        loadingHUD.removeFromSuperViewOnHide = YES;
    }
    switch (type) {
        case ATShowTypeLoading:
            
            loadingHUD.labelText = @"Loading...";
            
            break;
            
        case ATShowTypeWaiting:
            
            loadingHUD.labelText = nil;
            
        default:
            break;
    }
    
    [[UIApplication sharedApplication].delegate.window addSubview:loadingHUD];
    [[UIApplication sharedApplication].delegate.window bringSubviewToFront:loadingHUD];
    
    [loadingHUD show:YES];
}

/**FunctionRef
 *  @Author 小凡
 *  @Brief  隐藏loading
 *  @Todo   隐藏loading
 */
- (void)hiddenLoading {
    if (loadingHUD) {
        [loadingHUD hide:YES];
    }
}

@end

//
//  SGAlertUtil.h
//  SGShow
//
//  Created by fanshijian on 15-3-10.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//  提示语类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

/** 加载等待的类型 **/
typedef enum : NSUInteger {
    /** 请求列表或信息加载 **/
    ATShowTypeLoading,
    /** 创建时等待 **/
    ATShowTypeWaiting,
    
} ATShowType;


@interface SGAlertUtil : NSObject {
    MBProgressHUD *loadingHUD;
}

@property (nonatomic,assign)BOOL isShow;  // 控制是否重复显示

+ (id)alertManager;

// 显示提示语，一闪而逝
- (void)showPromptInfo:(NSString *)info;

/**FunctionRef
 *  @Author 小凡
 *  @Brief  显示loading
 *  @Todo   数据请求时间很长时，加loading显示
 */
- (void)showLoading:(ATShowType)type;

/**FunctionRef
 *  @Author 小凡
 *  @Brief  隐藏loading
 *  @Todo   隐藏loading
 */
- (void)hiddenLoading;

@end

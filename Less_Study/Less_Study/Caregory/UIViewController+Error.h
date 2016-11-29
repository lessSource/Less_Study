//
//  UIViewController+Error.h
//  NoteDome
//
//  Created by Lj on 2016/10/16.
//  Copyright © 2016年 Lj. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (Error)

//文字
@property (nonatomic, strong) NSString *errorTitle;
//图片
@property (nonatomic, strong) UIImage *errorImage;
@property (nonatomic, assign) BOOL showError;



@end

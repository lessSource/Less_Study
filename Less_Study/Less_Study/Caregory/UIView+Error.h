//
//  UIView+Error.h
//  Less_Study
//
//  Created by Lj on 2016/12/1.
//  Copyright © 2016年 lj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Error)

//文字
@property (nonatomic, strong) NSString *errorTitle;
//图片
@property (nonatomic, strong) UIImage *errorImage;
@property (nonatomic, assign) BOOL showError;

@end

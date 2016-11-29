//
//  UIViewController+Error.m
//  NoteDome
//
//  Created by Lj on 2016/10/16.
//  Copyright © 2016年 Lj. All rights reserved.
//

#define errorTag 2345679

#import "UIViewController+Error.h"
#import <objc/runtime.h>
#import "Masonry.h"

@implementation UIViewController (Error)

- (void)setShowError:(BOOL)showError {
    if (showError)
        [self showErrorPrompt];
    else
        [self removeErrorPrompt];
}

- (BOOL)showError {
    return YES;
}

- (NSString *)errorTitle {
    return @"";
}

- (UIImage *)errorImage {
    return nil;
}


- (void)setErrorTitle:(NSString *)errorTitle {
    UIView *error_View = [self getErrorView];
    if (error_View) {
        UILabel *lable = [error_View viewWithTag:errorTag + 1];
        lable.text = errorTitle;
    }
}

- (void)setErrorImage:(UIImage *)errorImage {
    UIView *error_View = [self getErrorView];
    if (error_View) {
        UIImageView *imageView = [error_View viewWithTag:errorTag + 2];
        imageView.image = errorImage;
    }
}

- (void)showErrorPrompt{
    UIView *error_view = [self errorView];
    if ( [self.view isKindOfClass:[UIScrollView class]] ) {
        [(UIScrollView *)self.view setScrollEnabled:NO];
    }
    if ( self.view.subviews.count > 0 ) {
        UIView *t_v = self.view;
        for (UIView *v in self.view.subviews) {
            if ( [v isKindOfClass:[UITableView class]] ) {
                t_v = v;
            }
        }
        [t_v insertSubview:error_view aboveSubview:t_v.subviews[0]];
        error_view.backgroundColor = t_v.backgroundColor;
        }
    else{
        [self.view addSubview:error_view];
    }
    
}

- (void)removeErrorPrompt{
    UIView *error_view = [self getErrorView];
    if (error_view) {
        if ( [self.view isKindOfClass:[UIScrollView class]] ) {
            [(UIScrollView *)self.view setScrollEnabled:YES];
        }
        [error_view removeFromSuperview];
    }
}


- (UIView *)getErrorView {
    UIView *error_View = objc_getAssociatedObject(self, @selector(errorView));
    return error_View;
}

- (UIView *)setErrorView {
    UIView *error_View = objc_getAssociatedObject(self, @selector(errorView));
    return error_View;
}

- (void)setErrorView:(UIView *)view {
    objc_setAssociatedObject(self, @selector(errorView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIView *)errorView {
    UIView *error_View = [self getErrorView];
    if (error_View) {
        return error_View;
    }
    error_View = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    error_View.backgroundColor = [UIColor clearColor];
    [self setErrorView:error_View];
    
    
    UIImageView *error_Image = [[UIImageView alloc]initWithFrame:CGRectMake(error_View.frame.size.width/2 - 155/2 + 10, 150, 150, 150)];
    error_Image.image = [UIImage imageNamed:@"iconfont-kafei"];
    error_Image.tag = errorTag + 2;
    [error_View addSubview:error_Image];
    
    UILabel *error_title = [[UILabel alloc]init];
    error_title.text = @"暂无数据";
    error_title.textColor = [UIColor redColor];
    error_title.textAlignment = NSTextAlignmentCenter;
    error_title.tag = errorTag + 1;
    [error_View addSubview:error_title];
    [error_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(error_Image.mas_bottom).offset(10);
        make.centerX.equalTo(error_Image.mas_centerX).offset(-8);
    }];
    return error_View;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"ds");
//    [self.selectedDelegate SelectedViewController];
}


@end

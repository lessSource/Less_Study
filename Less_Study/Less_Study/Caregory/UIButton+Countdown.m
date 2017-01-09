//
//  UIButton+Countdown.m
//  Dome
//
//  Created by Lj on 16/5/12.
//  Copyright © 2016年 Lj. All rights reserved.
//

#import "UIButton+Countdown.h"

@implementation UIButton (Countdown)

-(void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color{
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        //倒计时结束 关闭
        if (timeOut <= 0){
            [self stopWithButton:_timer mainColor:mColor title:title];
        }else {
            int seconds = timeOut % 120;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = color;
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

//停止倒计时
- (void)stopWithButton:(dispatch_source_t)timer mainColor:(UIColor *)mColor title:(NSString *)title {
    dispatch_source_cancel(timer);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.backgroundColor = mColor;
        [self setTitle:title forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
    });
}





@end

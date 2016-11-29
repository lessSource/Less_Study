//
//  LSTextView.h
//  NoteDome
//
//  Created by Lj on 16/9/16.
//  Copyright © 2016年 Lj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LS_TextHeightChangeBlock)(NSString *text, CGFloat textHeight);


@interface LSTextView : UITextView

/**
 *  占位文字
 */
@property (nonatomic, strong) NSString *placeholder;

/**
 * 占位文字颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;

/**
 * 占位符字体大小
 */
@property (nonatomic,strong) UIFont *placeholderFont;

/*
 * textView最大行数
 */
@property (nonatomic, assign) NSUInteger numberOfLines;


@property (nonatomic, strong) LS_TextHeightChangeBlock textChangedBlock;

/**
 *  设置圆角
 */
@property (nonatomic, assign) NSUInteger cornerRadius;

- (void)textValueDidChanged:(LS_TextHeightChangeBlock)block;


@end

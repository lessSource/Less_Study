//
//  SGSettingUtil.h
//  SGShow
//
//  Created by fanshijian on 15-3-13.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NULL_STR @""

extern NSString* Safe_string(id expect_type);

extern NSString* Service_interface(NSString *inter);

@interface SGSettingUtil : NSObject

// 判断数据是否为空或空对象
+ (BOOL)dataIsNull:(id)string;

// 判断数据是否为空或空对象(如果字符串的话是否为@"")
+ (BOOL)dataAndStringIsNull:(id)string;

// 判断字符串为空或者全为空格
+ (BOOL)isBlankString:(NSString *)string;

// 给某个view添加手势
+ (void)addTapGestureInView:(UIView *)inView addTarget:(id)target action:(SEL)action withTag:(NSInteger)viewTag;

//  绘制有色矩形view
+ (UIView *)drawColorViewWithRect:(CGRect)rect withColor:(UIColor *)color;

//  生成UILabel对象
+ (UILabel *)allocLabelWithRect:(CGRect)rect
                  withTextColor:(UIColor *)color
               withTextAligment:(NSTextAlignment)textAlignment
               withTextFontSize:(CGFloat)fontSize
                      withTitle:(NSString *)title;

// 根据frame加线
+ (void)addLineWithView:(UIView *)view withLineFrame:(CGRect)lineFrame withColor:(UIColor *)color;

// 设置label的 部分字体颜色
+ (void)setAttributeLabel:(UILabel *)label font:(UIFont *)font color:(UIColor *)color rangeArray:(NSArray *)array;

+ (void)setAttributeLabel:(UILabel *)label font:(UIFont *)font keyFont:(UIFont *)kFont key:(NSString *)key;

+ (NSString *)translation:(NSString *)arebic;

// 设置label的attributedText行间距
+ (NSMutableAttributedString *)allocLabelattributedTextLineSpace:(CGFloat)lineSpace withLabelText:(NSString *)labelText;

// 改变resultView的center.y等于basicView的center.y
+ (void)changeCenterYWithBasicView:(UIView *)basicView withResultView:(UIView *)resultView;

//计算Label的宽度
+ (CGFloat)widthForText:(NSString *)string;

//获取label的高度
+ (CGFloat)HeightForText:(NSString *)text withFontSize:(CGFloat)fontSize withTextWidth:(CGFloat)textWidth withTextLineSpace:(CGFloat)textLineSpace;


/**
*  根据NSDate转化成String (yyyy-MM-dd)
*
*  @return 字符串
**/
+ (NSString *)conversionTime:(NSString *)string dateFormat:(NSString *)format;

/**
 *  时间戳转时间
 *
 *  @param string /Date(1472027638000)/
 *
 *  @return return value description
 */
+ (NSDate *)getConversionTime:(NSString *)string;

//设置金额
+ (NSString *)amountConversion:(NSString *)price;

// 唯一标示
+ (NSString *)uucode;

//改变字符串里某些字符的颜色
+ (NSMutableAttributedString *)editStringColor:(NSString *)string editStr:(NSString *)editStr color:(UIColor *)color;

//获取本月第一天
+ (NSString *)getCurrentMonthFirstDay;

//获取当天
+ (NSString *)getCurrentDay;

// 去掉字符串中用括号包括的内容
+ (NSString *)handleStringWithString:(NSString *)str;

@end



//
//  SGSettingUtil.m
//  SGShow
//
//  Created by fanshijian on 15-3-13.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import "SGSettingUtil.h"
#import <AddressBook/AddressBook.h>
#include <math.h>

NSString* Safe_string(id expect_type)
{
    if ( !expect_type ) {
        return NULL_STR;
    }
    
    if ( ![expect_type isKindOfClass:[NSString class]] ) {
        if ( [expect_type isKindOfClass:[NSNumber class]] ) {
            return [expect_type stringValue];
        }
    }
    
    if ( [SGSettingUtil isBlankString:expect_type] ) {
        return NULL_STR;
    }
    
    return expect_type;
}

@implementation SGSettingUtil

// 判断数据是否为空或空对象
+ (BOOL)dataIsNull:(id)string {
    if ([string isEqual:[NSNull null]] || string == nil) {
        return YES;
    }
    return NO;
}

// 判断数据是否为空或空对象(如果字符串的话是否为@"")
+ (BOOL)dataAndStringIsNull:(id)string {
//    return [string isNullAndEmpty];
    if ([string isEqual:[NSNull null]] || string == nil || [string isEqual:@""]) {
        return YES;
    }
    return NO;
}

// 判断字符串为空或者全为空格
+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}


// 给某个view添加手势
+ (void)addTapGestureInView:(UIView *)inView addTarget:(id)target action:(SEL)action withTag:(NSInteger)viewTag {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [tapGesture setCancelsTouchesInView:NO];
    tapGesture.numberOfTapsRequired = 1;
    inView.tag = viewTag;
    [inView addGestureRecognizer:tapGesture];
}


//  绘制有色矩形view
+ (UIView *)drawColorViewWithRect:(CGRect)rect withColor:(UIColor *)color {
    UIView *colorView = [[UIView alloc] initWithFrame:rect];
    colorView.backgroundColor = color;
    return colorView;
}

//  生成UILabel对象
+ (UILabel *)allocLabelWithRect:(CGRect)rect
                  withTextColor:(UIColor *)color
               withTextAligment:(NSTextAlignment)textAlignment
               withTextFontSize:(CGFloat)fontSize
                      withTitle:(NSString *)title {
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = textAlignment;
    label.textColor = color;
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    label.text = title;
    return label;
}

// 根据frame加线
+ (void)addLineWithView:(UIView *)view withLineFrame:(CGRect)lineFrame withColor:(UIColor *)color {
    UILabel *line = [[UILabel alloc] initWithFrame:lineFrame];
    line.backgroundColor = color;
    [view addSubview:line];
}

// 设置label的 部分字体颜色
+ (void)setAttributeLabel:(UILabel *)label font:(UIFont *)font color:(UIColor *)color rangeArray:(NSArray *)array {
    if (label.text != nil) {
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
        for (NSString *string in array) {
            NSRange range = [label.text rangeOfString:string];
            //设置字号
            [str addAttribute:NSFontAttributeName value:font range:range];
            //设置文字颜色
            [str addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        label.attributedText = str;
    }
}

+ (void)setAttributeLabel:(UILabel *)label font:(UIFont *)font keyFont:(UIFont *)kFont key:(NSString *)key {
    if (label.text != nil) {
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
        NSRange range = [label.text rangeOfString:key];
        //设置字号
        [str addAttribute:NSFontAttributeName value:kFont range:range];
        
        label.attributedText = str;
    }
}

+ (NSString *)translation:(NSString *)arebic

{   NSString *str = arebic;
    NSArray *arabic_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chinese_numerals forKeys:arabic_numerals];
    
    NSMutableArray *sums = [NSMutableArray array];
    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *a = [dictionary objectForKey:substr];
        NSString *b = digits[str.length -i-1];
        NSString *sum = [a stringByAppendingString:b];
        if ([a isEqualToString:chinese_numerals[9]])
        {
            if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
            {
                sum = b;
                if ([[sums lastObject] isEqualToString:chinese_numerals[9]])
                {
                    [sums removeLastObject];
                }
            }else
            {
                sum = chinese_numerals[9];
            }
            
            if ([[sums lastObject] isEqualToString:sum])
            {
                continue;
            }
        }
        
        [sums addObject:sum];
    }
    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
    return chinese;
}

// 设置label的attributedText行间距
+ (NSMutableAttributedString *)allocLabelattributedTextLineSpace:(CGFloat)lineSpace withLabelText:(NSString *)labelText {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    return attributedString;
}

// 改变resultView的center.y等于basicView的center.y
+ (void)changeCenterYWithBasicView:(UIView *)basicView withResultView:(UIView *)resultView {
    CGPoint basicViewCenter = basicView.center;
    CGPoint resultViewCenter;
    resultViewCenter.x = resultView.center.x;
    resultViewCenter.y = basicViewCenter.y;
    resultView.center = resultViewCenter;
}

//计算Label的宽度
+ (CGFloat)widthForText:(NSString *)string{
   CGSize size =[string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    return size.width + 20;
}

#pragma mark - 计算内容文本的高度方法
+ (CGFloat)HeightForText:(NSString *)text withFontSize:(CGFloat)fontSize withTextWidth:(CGFloat)textWidth withTextLineSpace:(CGFloat)textLineSpace {
    NSMutableAttributedString *attrStr;
    if (textLineSpace == 0)
        attrStr = [[NSMutableAttributedString alloc] initWithString:text];
    else
        attrStr = [self allocLabelattributedTextLineSpace:textLineSpace withLabelText:text];
    NSRange allRange = [text rangeOfString:text];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:fontSize]
                    range:allRange];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor darkGrayColor]
                    range:allRange];
    CGFloat titleHeight;
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                        options:options
                                        context:nil];
    titleHeight = ceilf(rect.size.height);
    return titleHeight;
}

//时间戳转换成时间字符串
+ (NSString *)conversionTime:(NSString *)string dateFormat:(NSString *)format{
    if ([SGSettingUtil dataAndStringIsNull:string]) {
        return @"";
    }else if ([string rangeOfString:@"Date"].location != NSNotFound) {
        
        NSRange start = [string rangeOfString:@"("];
        NSRange end = [string rangeOfString:@")"];
        
        NSString *sub = [string substringWithRange:NSMakeRange(start.location + 1, end.location - start.location - 4)];
        NSTimeInterval time = [sub doubleValue];
        NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateFormat:format];
        NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
        return currentDateStr;
    }
    return string;
}
+ (NSDate *)getConversionTime:(NSString *)string {
    if ([SGSettingUtil dataAndStringIsNull:string]) {
        return nil;
    }else if ([string rangeOfString:@"Date"].location != NSNotFound) {

        NSRange start = [string rangeOfString:@"("];
        NSRange end = [string rangeOfString:@")"];

        NSString *sub = [string substringWithRange:NSMakeRange(start.location + 1, end.location - start.location - 4)];
        NSTimeInterval time = [sub doubleValue];
        NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
        return detaildate;
    }
    return nil;
}

//设置金额
+ (NSString *)amountConversion:(NSString *)price {
    if ([self dataIsNull:price]) {
        return nil;
    }
    NSString *setPrice;
    CGFloat getPrice = [price floatValue];
    if (getPrice >= 0.0f && getPrice < 10000.0f) {
        setPrice = [NSString stringWithFormat:@"%.f元",getPrice];
    }
    else if (getPrice >= 10000.f && getPrice < powf(10, 8)) {
        if ((int)getPrice%10000 == 0) {
            setPrice = [NSString stringWithFormat:@"%.f万",getPrice/10000.f];
        }else
            setPrice = [NSString stringWithFormat:@"%.2f万",getPrice/10000.f];
    }
    else if (getPrice >= powf(10, 8) && getPrice < powf(10, 12)) {
        setPrice = [NSString stringWithFormat:@"%.2f亿",getPrice/100000000.f];
    }
    return setPrice;
}

// 唯一标示
+ (NSString *)uucode {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    NSString *stampStr = [NSString stringWithFormat:@"%.0f",time*1000000];
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString *name = [NSString stringWithFormat:@"%@%@",stampStr,idfv];
    return name;
}

+ (NSMutableAttributedString *)editStringColor:(NSString *)string editStr:(NSString *)editStr color:(UIColor *)color {
    //string为整体字符串，editStr为需要修改的字符串
    NSRange range = [string rangeOfString:editStr];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:string];
    //设置属性修改字体颜色UIColor与大小UIFount
    [attribute addAttributes:@{NSForegroundColorAttributeName:color} range:range];
    return attribute;
}

//获取本月第一天
+ (NSString *)getCurrentMonthFirstDay {
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    NSString *beginDate = [dateString stringByReplacingCharactersInRange:NSMakeRange(8, 8) withString:@"01 00:00"];
    return beginDate;
}
//获取当天
+ (NSString *)getCurrentDay {
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];

    return dateString;
}

// 去掉字符串中用括号包括的内容
+ (NSString *)handleStringWithString:(NSString *)str {
    NSMutableString * muStr = [NSMutableString stringWithString:str];
    while (1) {
        NSRange range = [muStr rangeOfString:@"("];
        NSRange range1 = [muStr rangeOfString:@")"];
        if (range.location != NSNotFound) {
            NSInteger loc = range.location;
            NSInteger len = range1.location - range.location;
            [muStr deleteCharactersInRange:NSMakeRange(loc, len + 1)];
        }else{
            break;
        }
    }
    
    return muStr;
}

@end

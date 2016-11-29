//
//  SGColorUtil.h
//  SGShow
//
//  Created by fanshijian on 15-7-8.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import "UIColor+ext.h"

// 颜色方法RGB
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
// 颜色方法HEX
#define ColorWithHexStr(Hex) [UIColor colorWithHexString:Hex]
//tabBar点击时字体的颜色
#define TabBar_SelectColor [UIColor redColor]
//tabBar未点击时字体的颜色
#define TabBar_NormalColor [UIColor blueColor]
//tabBar背景颜色
#define TabBar_TintColor [UIColor whiteColor]

#pragma mark - 字体大小
#define SGFont_Size_10 [UIFont systemFontOfSize:10.0]

#define SGFont_Size_11 [UIFont systemFontOfSize:11.0]

#define SGFont_Size_12 [UIFont systemFontOfSize:12.0]

#define SGFont_Size_13 [UIFont systemFontOfSize:13.0]

#define SGFont_Size_14 [UIFont systemFontOfSize:14.0]

#define SGFont_Size_15 [UIFont systemFontOfSize:15.0]

#define SGFont_Size_16 [UIFont systemFontOfSize:16.0]

#define SGFont_Size_17 [UIFont systemFontOfSize:17.0]

#define SGFont_Size_18 [UIFont systemFontOfSize:18.0]



#pragma mark - 线的高度
#define SGHeight_Line 0.5




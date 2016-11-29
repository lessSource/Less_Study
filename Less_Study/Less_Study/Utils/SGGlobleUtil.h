//
//  SGGlobleUtil.h
//  SGShow
//
//  Created by fanshijian on 15/10/13.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

// 日志方法
#ifdef DEBUG
#define DLog(...) NSLog(__VA_ARGS__)
#define DMethod() NSLog(@"%s", __func__)
#else
#define DLog(...)
#define DMethod()
#endif

#define VIEW_TX(view) (view.frame.origin.x)
#define VIEW_TY(view) (view.frame.origin.y)
#define VIEW_BX(view) (view.frame.origin.x + view.frame.size.width)
#define VIEW_BY(view) (view.frame.origin.y + view.frame.size.height)
#define VIEW_W(view)  (view.frame.size.width)
#define VIEW_H(view)  (view.frame.size.height)

#define FRAME_TX(frame)  (frame.origin.x)
#define FRAME_TY(frame)  (frame.origin.y)
#define FRAME_W(frame)  (frame.size.width)
#define FRAME_H(frame)  (frame.size.height)

// 改变坐标
#define ChangeViewX(view,x) [view setFrame:CGRectMake(x, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
#define ChangeViewY(view,y) [view setFrame:CGRectMake(view.frame.origin.x, y, view.frame.size.width, view.frame.size.height)];
#define ChangeViewW(view,w) [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, w, view.frame.size.height)];
#define ChangeViewH(view,h) [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, h)];
#define ChangeViewYH(view,y,h) [view setFrame:CGRectMake(view.frame.origin.x, y, view.frame.size.width, h)];
#define ChangeViewXW(view,x,w) [view setFrame:CGRectMake(x, view.frame.origin.y, w, view.frame.size.height)];
#define ChangeViewXY(view,x,y) [view setFrame:CGRectMake(x, y, view.frame.size.width, view.frame.size.height)];
#define ChangeViewXYWH(view,x,y,w,h) [view setFrame:CGRectMake(x, y, w, h)];

// 本地数据库路径
#define DATABASE_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]stringByAppendingString:@"/SGShow.db"]
#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); abort(); } }

// 计算字符串size
#define SG_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#define SG_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;


#define IOS_7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7)
#define IOS_8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8)
#define IOS_9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9)
#define kStatusHeight           (20.f)
#define kNavbarAndStatusBar     (64.f)
#define kTopBarHeight           (44.f)
#define kBottomBarHeight        (49.f)
#define Is3x ([UIScreen mainScreen].scale == 3)
#define Scale3xMultiple 1.375 // plus显示icon的放大倍数
#define kAddScale(f) (Is3x ? f*Scale3xMultiple : f)

// 已iphone6为基准 375/667  (4s:320/480) (5s:320/568) (6:375/667) (6+:414/736)
#define kiPhone6RatioH(f) (App_Frame_Width == 320 ? f/667.0f*568 : f/667.0f*App_Frame_Height)
#define kiPhone6RatioW(f) (App_Frame_Width == 320 ? f/375.0f*320 : f/375.0f*App_Frame_Width)

#define App_Frame_Height    [[UIScreen mainScreen] bounds].size.height
#define App_Frame_Width     [[UIScreen mainScreen] bounds].size.width


// api key 定义
//#define kBMapApiKey       @"wnbK30ptjhGOH2mAAeLAjNZM"            // 百度地图 com.xygame.sgshow
#define kBMapApiKey       @"xyLcYHPpurgpZIDGjxSWnfYU"            // com.xygame.moofans

#define kSMSAppKey        @"610e5e8c6ba0"
#define kSMSSecret        @"f6330457151bafecf6ba7e09c6c5cb11"    // 短信验证

#define kUmengApiKey      @"53edc75afd98c5cf3302a42a"            // 友盟

#define kPasswordKey      @"sgappkey"                            // 密码key

/** 友盟API KEY **/
#define UMENG_APPKEY      @"555aa84667e58e4c0c006914"

//
//  NTHttpRequest.h
//  Less_Study
//
//  Created by Lj on 2016/12/23.
//  Copyright © 2016年 lj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HTTPRequestMethod) {
    POST = 0,
    GET,
    PUT,
    DELETE,
};

@interface NTHttpRequest : NSObject

+ (id)sharedInstance;

/**
 *  HTTP请求
 *
 *  @param url      服务器提供的接口，
 *  @param param    传的参数
 *  @param method   GET,POST,DELETE,PUT方法
 *  @param success  请求完成
 *  @param failure  请求失败
 *  @param showView 界面上显示的网络加载进度状态(nil为不显示)
 */
+ (void)createRequest:(NSString *)url requestName:(NSDictionary *)param method:(HTTPRequestMethod)methodType success:(void(^)(id result))success failure:(void(^)(NSError *error))failure showHUD:(UIView *)showView;


@end

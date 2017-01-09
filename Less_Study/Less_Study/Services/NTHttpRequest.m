//
//  NTHttpRequest.m
//  Less_Study
//
//  Created by Lj on 2016/12/23.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "NTHttpRequest.h"
#import "AFNetworking.h"


#define TIME_NETOUT 20.0f

@implementation NTHttpRequest {
    AFHTTPSessionManager *_HTTPmanager;
}

- (id)init {
    if (self = [super init]) {
        _HTTPmanager = [AFHTTPSessionManager manager];
        _HTTPmanager.requestSerializer.HTTPShouldHandleCookies = YES;
        _HTTPmanager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _HTTPmanager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [_HTTPmanager.requestSerializer setTimeoutInterval:TIME_NETOUT];
        
        //版本号信息请求头
        [_HTTPmanager.requestSerializer setValue:[NSString stringWithFormat:@"iOS-%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]] forHTTPHeaderField:@"MM-Version"];
        
        [_HTTPmanager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        _HTTPmanager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain", nil];
    }
    return self;
}

+ (id)sharedInstance {
    static NTHttpRequest *HttpRequest;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        HttpRequest = [[NTHttpRequest alloc]init];
    });
    return HttpRequest;
}

+ (void)createRequest:(NSString *)url requestName:(NSDictionary *)param method:(HTTPRequestMethod)methodType success:(void (^)(id))success failure:(void (^)(NSError *))failure showHUD:(UIView *)showView {
    
    [[NTHttpRequest sharedInstance]createUnloginedRequest:url requestName:param method:methodType success:success failure:failure showHUD:showView];
}


- (void)createUnloginedRequest:(NSString *)url requestName:(NSDictionary *)param method:(HTTPRequestMethod)methodType success:(void (^)(id))success failure:(void (^)(NSError *))failure showHUD:(UIView *)showView {
    
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    
    /*
     * 请求的时候给一个转圈状态
     */
    showView?[MBProgressHUD showHUDAddedTo:showView animated:YES]:nil;
    
    /*
     * 将cookie通过请求头的形式传到服务器，比较是否和服务器一致
     */
    
    NSData *cookiesData = [[NSUserDefaults standardUserDefaults] objectForKey:@"Cookie"];
    if ([cookiesData length]) {
        /*
         * 拿到所有的cookies
         */
        NSArray *coolies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesData];
        for (NSHTTPCookie *cookie in coolies) {
            /*
             * 判断cookie是否等于服务器约定的ECM_ID
             */
            if ([cookie.name isEqualToString:@"ECM_ID"]) {
                //实现了一个管理cookie的单例对象,每个cookie都是NSHTTPCookie类的实例,将cookies传给服务器
                [[NSHTTPCookieStorage sharedHTTPCookieStorage]setCookie:cookie];
            }
        }
    }
    
    NSMutableURLRequest *request = [_HTTPmanager.requestSerializer requestWithMethod:[self getStringForRequestType:methodType] URLString:[[NSURL URLWithString:url relativeToURL:_HTTPmanager.baseURL] absoluteString] parameters:param error:nil];
    
    NSURLSessionDataTask *dataTask = [_HTTPmanager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            if (showView) {
                [MBProgressHUD hideHUDForView:showView animated:YES];
            }
//            UIWindow *window = [[UIApplication sharedApplication]keyWindow];
            failure == nil?:failure(error);
        }else {
        
        }
    }];
//    dataTask = nil;
}

#pragma mark - GET Request type as string
-(NSString *)getStringForRequestType:(HTTPRequestMethod)type {
    NSString *requestTypeString;
    switch (type) {
        case POST:
            requestTypeString = @"POST";
            break;
        case GET:
            requestTypeString = @"GET";
            break;
        case PUT:
            requestTypeString = @"PUT";
            break;
        case DELETE:
            requestTypeString = @"DELETE";
            break;
        default:
            requestTypeString = @"POST";
            break;
    }
    return requestTypeString;
}

@end

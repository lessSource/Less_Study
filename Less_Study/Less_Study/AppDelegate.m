//
//  AppDelegate.m
//  Less_Study
//
//  Created by Lj on 2016/11/29.
//  Copyright © 2016年 lj. All rights reserved.
//

/*
 /////////////////////////////////////////////////////////010011000110010101110011011100110101111101010011011101000111010101100100011110010010000010011100000110111000001111001110011100000101011100111110110100100000111010100011111101010001111101100111000001101110000001101111001000001100010100110001000000101111110100111000001101110101101100010
 /////////////////////////////////////////////////////////
 */

#import "AppDelegate.h"
#import "BaseTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self gotoMian];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)gotoMian {
    BaseTabBarController *tabBarController = [[BaseTabBarController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    [nav setNavigationBarHidden:YES];
    self.window.rootViewController = nav;
}

//void UncaughtExceptionHandler(NSException *exception){
//
//    // 可以通过exception对象获取一些崩溃信息，我们就是通过这些崩溃信息来进行解析的，例如下面的symbols数组就是我们的崩溃堆栈。
//    NSArray *symbols = [exception callStackSymbols];
//    NSString *reason = [exception reason];
//    NSString *name = [exception name];
//
//    NSLog(@"symbols = %@, reasom = %@, name = %@",symbols,reason,name);
//}

@end

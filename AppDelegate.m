//
//  AppDelegate.m
//  DJSuperScrollView
//
//  Created by 刘文江 on 2016/11/10.
//  Copyright © 2016年 刘文江. All rights reserved.
//

/*
 ********************************************************************************
 *                                                                               *
 * 在您使用此封装的滚动视图的过程中如果出现bug请及时以以下任意一种方式联系我们，                *
 * 我们会及时修复bug并帮您解决问题。                                                    *
 * QQ    : 464280789                                                               *
 * Email : 464280789@qq.com  || wenjiang555@gmail.com                              *
 * GitHub: https://github.com/DJdajiang/SuperScrollView                            *
 * 新浪微博: http://blog.sina.com.cn/u/5996203625                                   *
 *                                                                                *
 *********************************************************************************
 */

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ViewController *view = [[ViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:view];
    
    self.window.rootViewController = nav;
    
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


@end

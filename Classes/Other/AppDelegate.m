//
//  AppDelegate.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "AppDelegate.h"
#import "SWOAuthViewController.h"
#import "SWAccount.h"
#import "SWAccountTool.h"
#import "SWNewAndTabChangeTool.h"
#import "SWNewfeatureViewController.h"
#import "SDWebImageManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    SWAccount *account = [SWAccountTool getAccount];
      /**
       查看是否已经登录过
       */
    if(account){
        //有帐号，判断是否第一次使用软件
        [SWNewAndTabChangeTool NewOrTab];
       }else {
        //没有帐号，调到授权的页面去授权
       self.window.rootViewController = [[SWOAuthViewController alloc] init];
    }
 
    return YES;
//
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
//    // 这种方式被中断是随机的
//    [application beginBackgroundTaskWithExpirationHandler:^{
//        
//    }];
    
//    [UILocalNotification
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    //取消所有下载
    [[SDWebImageManager sharedManager] cancelAll];
    
    //清理内存
    [[SDWebImageManager sharedManager].imageCache clearMemory];
    
}
@end

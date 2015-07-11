//
//  SWNewAndTabChangeTool.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-23.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWNewAndTabChangeTool.h"
#import "SWTabBarViewController.h"
#import "SWNewfeatureViewController.h"

@implementation SWNewAndTabChangeTool
+(void)NewOrTab
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults stringForKey:@"CFBundleVersion"];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    if([lastVersion isEqualToString:currentVersion]){
        // 版本号相同，已经使用过，直接来到主页
        [UIApplication sharedApplication].keyWindow.rootViewController = [[SWTabBarViewController alloc] init];
    }else{
        // 版本号不相同，有更新，来到新版本界面
        [UIApplication sharedApplication].keyWindow.rootViewController = [[SWNewfeatureViewController alloc] init];
        [defaults setObject: currentVersion forKey:@"CFBundleVersion"];
        [defaults synchronize];
    }


}

@end

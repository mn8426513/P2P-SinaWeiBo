//
//  SWSystemViewController.m
//  P2P-SinaWeibo
//
//  Created by Mac on 15-1-1.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import "SWSystemViewController.h"
#import "SWSettingItem.h"
#import "SWSettingArrowItem.h"
#import "SWSettingLabelItem.h"
#import "SWSettingItemSection.h"
#import "SWAccountManagerViewController.h"
#import "SWNoticeAndRemindViewController.h"
#import "SWGeneralSettingViewController.h"
#import "SWSecurityViewController.h"
#import "SWAboutWeiboViewController.h"


@implementation SWSystemViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
  

}

-(void)setupGroup0
{
    SWSettingItemSection *section =  [self addSettingItemSectionToGroup];
    
    SWAccountManagerViewController *managerVC = [[SWAccountManagerViewController alloc] init];
    SWSettingArrowItem *AccountManager = [SWSettingArrowItem arrowItemTitle:@"帐号管理" destVC:managerVC];
    section.items = @[AccountManager];
}


-(void)setupGroup1
{
    SWSettingItemSection *section  =  [self addSettingItemSectionToGroup];
    SWNoticeAndRemindViewController *noticeVC = [[SWNoticeAndRemindViewController alloc] init];
    SWSettingArrowItem *remindAndNotice = [SWSettingArrowItem arrowItemTitle:@"提醒和通知" destVC:noticeVC];
    
    SWGeneralSettingViewController *generalSettingVC = [[SWGeneralSettingViewController alloc] init];
    SWSettingArrowItem *generalSetting = [SWSettingArrowItem arrowItemTitle:@"通用设置" destVC:generalSettingVC];
    
    SWSecurityViewController *securityVC = [[SWSecurityViewController alloc] init];
    SWSettingArrowItem *security = [SWSettingArrowItem arrowItemTitle:@"隐私和安全" destVC:securityVC];
    
    section.items = @[remindAndNotice,generalSetting,security];
    
}


-(void)setupGroup2
{
    SWSettingItemSection *section  =  [self addSettingItemSectionToGroup];
    
    UIViewController *adviceVC  = [[UIViewController alloc] init];
    SWSettingArrowItem *adivceBack = [SWSettingArrowItem arrowItemTitle:@"意见反馈" destVC:adviceVC];
    
    UIViewController *about = [[UIViewController alloc] init];
    SWSettingArrowItem *aboutWeibo = [SWSettingArrowItem arrowItemTitle:@"关于微博" destVC:about];
    
    
    section.items = @[adivceBack,aboutWeibo];
    
    
}


-(void)setupGroup3
{
    SWSettingItemSection *section  =  [self addSettingItemSectionToGroup];
    SWSettingArrowItem *nightMode = [SWSettingArrowItem arrowItemTitle:@"意见反馈" destVC:nil];
    
    SWSettingArrowItem *removeCache = [SWSettingArrowItem arrowItemTitle:@"关于微博" destVC:nil];
    section.items = @[nightMode,removeCache];
    
}

@end

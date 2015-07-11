//
//  SWMeController.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWMeController.h"
#import "SWSettingItemSection.h"
#import "SWSettingItem.h"
#import "SWSettingArrowItem.h"
#import "SWSettingLabelItem.h"
#import "NewFriendViewController.h"
#import "WeiboRankViewController.h"
#import "MyAlbumViewController.h"
#import "MyCollectionViewController.h"
#import "MyLikeViewController.h"
#import "PayViewController.h"
#import "CharaterViewController.h"
#import "MyCardViewController.h"
#import "DraftViewController.h"
#import "SWSystemViewController.h"

@interface SWMeController ()

@end

@implementation SWMeController

- (void)viewDidLoad {
    
  
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
    
    [self  setupGroup0];
    [self  setupGroup1];
    [self  setupGroup2];
    [self  setupGroup3];
    
    [super viewDidLoad];
}

-(void)setting
{
    SWSystemViewController *systemSetting = [[SWSystemViewController alloc] init];
    [self.navigationController pushViewController:systemSetting animated:YES];
}
- (void)setupGroup0
{
    SWSettingItemSection *section =  [self addSettingItemSectionToGroup];
    
    NewFriendViewController *friendVC = [[NewFriendViewController alloc] init];
    
    SWSettingArrowItem *newFriend = [SWSettingArrowItem  arrowItemWithIcon:@"new_friend" title:@"新的好友" destVC:friendVC];
//    newFriend.badgeValue = @"111";
    newFriend.subTitle = @"111";

    PayViewController *payVC = [[PayViewController alloc] init];
    SWSettingArrowItem *pay= [SWSettingArrowItem arrowItemWithIcon:@"card" title:@"微博支付" destVC:payVC];
    section.items = @[newFriend,pay];

}



-(void)setupGroup1
{
    SWSettingItemSection *section =  [self addSettingItemSectionToGroup];
    
    MyAlbumViewController *album = [[MyAlbumViewController alloc] init];
    SWSettingArrowItem *myPhotos =[SWSettingArrowItem arrowItemWithIcon:@"album" title:@"我的相册" destVC:album];
   
    MyCollectionViewController *collectionVC = [[MyCollectionViewController alloc] init];
    SWSettingArrowItem *myCollection= [SWSettingArrowItem arrowItemWithIcon:@"collect" title:@"我的收藏" destVC:collectionVC];
    
    MyCollectionViewController *likeVC = [[MyCollectionViewController alloc] init];
    SWSettingArrowItem *zan = [SWSettingArrowItem arrowItemWithIcon:@"like" title:@"赞" destVC:likeVC];
    
    section.items = @[myPhotos,myCollection,zan];
}


-(void)setupGroup2
{
    SWSettingItemSection *section =  [self addSettingItemSectionToGroup];
    
    
    PayViewController *payVC = [[PayViewController alloc] init];
    SWSettingArrowItem *weiboPay= [SWSettingArrowItem arrowItemWithIcon:@"pay" title:@"微博支付" destVC:payVC];
    
    CharaterViewController *charaterVC = [[CharaterViewController alloc] init];
    SWSettingArrowItem *character = [SWSettingArrowItem arrowItemWithIcon:@"vip" title:@"个性化" destVC:charaterVC];

    section.items = @[weiboPay,character];
}


-(void)setupGroup3
{
    SWSettingItemSection *section =  [self addSettingItemSectionToGroup];
    
    MyCardViewController *cardVC = [[MyCardViewController alloc] init];
    SWSettingArrowItem *myCard = [SWSettingArrowItem arrowItemWithIcon:@"card" title:@"我的名片" destVC:cardVC];
    
    DraftViewController *draftVC = [DraftViewController alloc];
    SWSettingArrowItem *editing = [SWSettingArrowItem arrowItemWithIcon:@"draft" title:@"草稿箱" destVC:draftVC];

    section.items = @[myCard,editing];
}
@end

//
//  SWSquareController.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWSquareController.h"
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
#import "MNViewController.h"

@interface SWSquareController ()

@end

@implementation SWSquareController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self  setupGroup0];
    [self  setupGroup1];
    [self  setupGroup2];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupGroup0
{
    SWSettingItemSection *section =  [self addSettingItemSectionToGroup];
    
    NewFriendViewController *friendVC = [[NewFriendViewController alloc] init];
    
    SWSettingArrowItem *newFriend = [SWSettingArrowItem  arrowItemWithIcon:@"new_friend" title:@"热门微博" destVC:friendVC];
    //    newFriend.badgeValue = @"111";
    newFriend.subTitle = @"111";
    
    PayViewController *payVC = [[PayViewController alloc] init];
    SWSettingArrowItem *pay= [SWSettingArrowItem arrowItemWithIcon:@"card" title:@"新春红包" destVC:payVC];
    
    PayViewController *findPeople = [[PayViewController alloc] init];
    SWSettingArrowItem *find= [SWSettingArrowItem arrowItemWithIcon:@"album" title:@"找人" destVC:findPeople];
    
    section.items = @[newFriend,pay,find];
    
}



-(void)setupGroup1
{
    SWSettingItemSection *section =  [self addSettingItemSectionToGroup];
    
    MyAlbumViewController *album = [[MyAlbumViewController alloc] init];
    SWSettingArrowItem *myPhotos =[SWSettingArrowItem arrowItemWithIcon:@"pay" title:@"游戏中中心" destVC:album];
    
    MyCollectionViewController *collectionVC = [[MyCollectionViewController alloc] init];
    SWSettingArrowItem *myCollection= [SWSettingArrowItem arrowItemWithIcon:@"vip" title:@"应用" destVC:collectionVC];
    
    MyCollectionViewController *likeVC = [[MyCollectionViewController alloc] init];
    SWSettingArrowItem *zan = [SWSettingArrowItem arrowItemWithIcon:@"collect" title:@"周边" destVC:likeVC];
    
    section.items = @[myPhotos,myCollection,zan];
}


-(void)setupGroup2
{
    SWSettingItemSection *section =  [self addSettingItemSectionToGroup];
    
    
    PayViewController *payVC = [[PayViewController alloc] init];
    SWSettingArrowItem *weiboPay= [SWSettingArrowItem arrowItemWithIcon:@"card" title:@"电影" destVC:payVC];
    
    MNViewController *musicController = [[MNViewController alloc] init];
    SWSettingArrowItem *character = [SWSettingArrowItem arrowItemWithIcon:@"draft" title:@"听歌" destVC:musicController];
   
    MyCardViewController *cardVC = [[MyCardViewController alloc] init];
    SWSettingArrowItem *myCard = [SWSettingArrowItem arrowItemWithIcon:@"like" title:@"购物" destVC:cardVC];
    
    DraftViewController *draftVC = [DraftViewController alloc];
    SWSettingArrowItem *editing = [SWSettingArrowItem arrowItemWithIcon:@"album" title:@"更多频道" destVC:draftVC];
    
    section.items = @[weiboPay,character,myCard,editing];
}



@end

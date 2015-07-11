//
//  SWMessageItem.m
//  P2P-SinaWeibo
//
//  Created by Mac on 15-2-27.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import "SWMessageItem.h"

@implementation SWMessageItem

+(instancetype)messageItem
{
    return  [[SWMessageItem alloc] init];
  
}
+ (instancetype)itemWithName:(NSString *)name icon:(NSString *)icon descVC:(UITableViewController *)descVC
{
    SWMessageItem *item = [SWMessageItem messageItem];
    item.name = name;
    item.icon = icon;
    item.descVC = descVC;
    return item;
}

@end

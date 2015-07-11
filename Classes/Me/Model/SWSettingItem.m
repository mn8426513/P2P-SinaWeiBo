//
//  SWSettingItem.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-23.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWSettingItem.h"

@implementation SWSettingItem


+(instancetype)item
{
    return  [[SWSettingItem alloc] init];
}

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    SWSettingItem *item = [self item];
    item.icon = icon;
    item.title = title;
    return item;
}

+(instancetype)itemWithTitle:(NSString *)title
{
    SWSettingItem *item =[self item];
    item.title = title;
    return item;
}
@end

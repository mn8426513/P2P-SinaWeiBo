//
//  SWMessageArrowItem.m
//  P2P-SinaWeibo
//
//  Created by Mac on 15-2-27.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import "SWMessageArrowItem.h"

@implementation SWMessageArrowItem


+ (instancetype)messageArrowItem
{
    return [[SWMessageArrowItem alloc] init];
}
+(instancetype)arrowItemWithName:(NSString *)name icon:(NSString *)icon descVC:(UITableViewController *)descVC
{
    SWMessageArrowItem *arrowItem = [SWMessageArrowItem messageArrowItem];
    arrowItem.name = name;
    arrowItem.icon = icon;
    arrowItem.descVC = descVC;
    return arrowItem;
}


@end

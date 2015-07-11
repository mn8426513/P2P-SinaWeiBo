//
//  SWMessageLabelItem.m
//  P2P-SinaWeibo
//
//  Created by Mac on 15-2-27.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import "SWMessageLabelItem.h"

@implementation SWMessageLabelItem



+ (instancetype)messageLabelItem
{
     return  [[SWMessageLabelItem alloc] init];
}

+ (instancetype)labelItemWithName:(NSString *)name icon:(NSString *)icon  detailText:(NSString *)detailText descVC:(UITableViewController *)descVC
{
    SWMessageLabelItem *labelItem = [SWMessageLabelItem messageLabelItem];
    labelItem.name = name;
    labelItem.icon = icon;
    labelItem.descVC = descVC;
    labelItem.detailText = detailText;
    return labelItem;
}
@end

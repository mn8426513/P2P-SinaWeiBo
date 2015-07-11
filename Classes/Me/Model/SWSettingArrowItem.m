//
//  SWSettingArrowItem.m
//  P2P-SinaWeibo
//
//  Created by No.2 iMac on 14/12/29.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWSettingArrowItem.h"

@implementation SWSettingArrowItem


+ (instancetype)arrowItemTitle:(NSString *)title destVC:(UIViewController *)destVC
{
    SWSettingArrowItem *arrowItem = [[SWSettingArrowItem alloc] init];
    arrowItem.title = title;
    arrowItem.destVC = destVC;
    return arrowItem;
}

+ (instancetype)arrowItemWithIcon:(NSString *)icon title:(NSString *)title destVC:(UIViewController *)destVC;
{
    SWSettingArrowItem *arrowItem = [[SWSettingArrowItem alloc] init];
    arrowItem.title = title;
    arrowItem.icon = icon;
    arrowItem.destVC = destVC;
    return arrowItem;
}
@end

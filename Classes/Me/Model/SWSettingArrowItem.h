//
//  SWSettingArrowItem.h
//  P2P-SinaWeibo
//
//  Created by No.2 iMac on 14/12/29.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWSettingItem.h"
#import <UIKit/UIKit.h>
@interface SWSettingArrowItem : SWSettingItem

@property(nonatomic,strong) UIViewController *destVC;

+(instancetype)arrowItemWithIcon:(NSString *)icon title:(NSString *)title destVC:(UIViewController *)destVC;
+(instancetype)arrowItemTitle:(NSString *)title destVC:(UIViewController *)destVC;
@end

//
//  SWMessageArrowItem.h
//  P2P-SinaWeibo
//
//  Created by Mac on 15-2-27.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWMessageItem.h"

@interface SWMessageArrowItem : SWMessageItem


+ (instancetype)messageArrowItem;
+ (instancetype)arrowItemWithName:(NSString *)name icon:(NSString *)icon descVC:(UITableViewController *)descVC;


@end

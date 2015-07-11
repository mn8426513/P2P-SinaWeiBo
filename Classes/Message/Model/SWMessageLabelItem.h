//
//  SWMessageLabelItem.h
//  P2P-SinaWeibo
//
//  Created by Mac on 15-2-27.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWMessageItem.h"

@interface SWMessageLabelItem : SWMessageItem
@property(nonatomic,copy)NSString *detailText;

+(instancetype)messageLabelItem;

+ (instancetype)labelItemWithName:(NSString *)name icon:(NSString *)icon  detailText:(NSString *)detailText descVC:(UITableViewController *)descVC;


@end

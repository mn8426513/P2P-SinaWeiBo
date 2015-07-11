//
//  SWMessageItem.h
//  P2P-SinaWeibo
//
//  Created by Mac on 15-2-27.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef  void (^myBlock)();


@class UITableViewController;

@interface SWMessageItem : NSObject

@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property (nonatomic,strong) UITableViewController *descVC;
@property (nonatomic,copy) myBlock option;


+ (instancetype)messageItem;
+ (instancetype)itemWithName:(NSString *)name icon:(NSString *)icon descVC:(UITableViewController *)descVC;
@end

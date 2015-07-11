//
//  SWBaseViewController.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-23.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWSettingItemSection;
@interface SWBaseViewController : UITableViewController
@property(nonatomic,strong) NSMutableArray *settingItemGroup;
- (SWSettingItemSection *)addSettingItemSectionToGroup;
@end

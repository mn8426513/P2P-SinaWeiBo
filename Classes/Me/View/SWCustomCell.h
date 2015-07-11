//
//  SWCustomCell.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-29.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWSettingItem;

@interface SWCustomCell : UITableViewCell

@property (nonatomic,strong) SWSettingItem *cellItem;

+ (instancetype)cellWithTableView:(UITableView *)tableview indexPath:(NSIndexPath *)indexPath;

@end

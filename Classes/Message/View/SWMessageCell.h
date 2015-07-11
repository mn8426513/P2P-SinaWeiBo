//
//  SWMessageCell.h
//  P2P-SinaWeibo
//
//  Created by Mac on 15-2-27.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWMessageItem;
@interface SWMessageCell : UITableViewCell
@property(nonatomic,strong) SWMessageItem *item;

+ (SWMessageCell *)messageCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end

//
//  SWStatusCellTableViewCell.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-28.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWCellFrame;
@interface SWStatusCellTableViewCell : UITableViewCell
@property (nonatomic ,strong) SWCellFrame *cellFrame;

+ (instancetype)cellWithTablbView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

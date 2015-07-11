//
//  MNMusicCell.h
//  63-音乐播放器
//
//  Created by Mac on 15-2-11.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJMusic;

@interface MNMusicCell : UITableViewCell

@property (nonatomic,strong) MJMusic *music;

+ (MNMusicCell *)cellWithTablewView:(UITableView *)tableView;
@end

//
//  SWFirstView.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-8.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWFirstView.h"
#import "UIImage+MN.h"
#import "SWCellFrame.h"
#import "SWStatus.h"
#import "SWUser.h"
#import "UIImageView+WebCache.h"
#import "SWRetweetView.h"
#import "SWRetweetView.h"
#import "SWPhoto.h"
#import "SWPhotosView.h"
#define SWColor(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0];
@interface SWFirstView ()
@property (nonatomic,weak) UIImageView *firstView;
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *nameLabel;
@property (nonatomic,weak) UIImageView *vipView;
@property (nonatomic,weak) UILabel *timeLabel;
@property (nonatomic,weak) UILabel *sourceLabel;
@property (nonatomic,weak) UILabel *myTextLabel;
@property (nonatomic,weak) SWPhotosView *photoView;
@property (nonatomic,weak) SWRetweetView *retweetView;

@end

@implementation SWFirstView

-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled =YES;
       
        // 添加第一个背景
        self.image = [UIImage resizeImageWithName:@"timeline_card_top_background"];
        self.highlightedImage = [UIImage resizeImageWithName:@"timeline_card_top_background_highlighted"];
        
        // 添加头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        // 添加名字
        UILabel *nameLabel = [[UILabel alloc] init];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        self.nameLabel.textColor = SWColor(234,103,7);
        self.nameLabel.font = SWNameFont;
        
        // VIP
        UIImageView *vipView = [[UIImageView alloc] init];
        [self addSubview:vipView];
        
        vipView.contentMode =    UIViewContentModeCenter;
        vipView.hidden =YES;
        self.vipView = vipView;
        
        // 添加转发时间
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = SWTimeFont;
        timeLabel.textColor = SWColor(230, 100, 28);
        self.timeLabel = timeLabel;
        [self addSubview: timeLabel];
        
        // 添加来源
        UILabel *sourceLabel = [[UILabel alloc] init];
        [self addSubview: sourceLabel];
        self.sourceLabel = sourceLabel;
        self.sourceLabel.font = SWSourceFont;
        
        // 添加正文
        UILabel *myTextLabel = [[UILabel alloc] init];
        [self addSubview:myTextLabel];
        self.myTextLabel = myTextLabel;
        self.myTextLabel.font = SWMycontentFont;
        self.myTextLabel.numberOfLines = 0;
        
        // 添加正文图片
//        UIImageView *photoView = [[UIImageView alloc] init];
//        photoView.hidden = YES;
//        [self addSubview:photoView];
//        self.photoView = photoView;
         SWPhotosView *photosView = [[SWPhotosView alloc] init];
         photosView.hidden = YES;
         [self addSubview:photosView];
         self.photoView = photosView;
        
        
        
        // 添加转发的View
        SWRetweetView *retweetView = [[SWRetweetView alloc] init];
        self.retweetView = retweetView;
        [self addSubview:retweetView];
        
    }
    return  self;
}


- (void)setStatusFrame:(SWCellFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 取出模型数据
    SWStatus *status = statusFrame.status;
    SWUser *user = status.user;

    //头像
    [self.iconView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithName:@"avatar_default_small"]];
    self.iconView.frame = statusFrame.iconViewF;
    
    
    //昵称
    self.nameLabel.text = user.name;
    self.nameLabel.frame = statusFrame.nameLabelF;
    
    //vip
     if(user.mbtype >2){
        self.vipView.hidden = NO;
        NSString *vipImageName = [NSString stringWithFormat:@"common_icon_membership_level%d",user.mbrank];
        self.vipView.image = [UIImage imageWithName:vipImageName];
        self.vipView.frame = statusFrame.vipViewF;
        self.nameLabel.textColor = [UIColor orangeColor];
     }else{
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipView.hidden = YES;
     }
   
    //时间
    self.timeLabel.text = [statusFrame.status created_at];
    self.timeLabel.frame = statusFrame.timeLabelF;
    CGFloat timeLabelX = statusFrame.nameLabelF.origin.x;
    CGFloat timeLabelY = CGRectGetMaxY(statusFrame.nameLabelF) + SWStatusCellBorder;
    CGSize timeLabelSize = [statusFrame.status.created_at sizeWithFont:SWTimeFont];
    self.timeLabel.frame = (CGRect){{timeLabelX, timeLabelY}, timeLabelSize};
    
    //来源
    self.sourceLabel.text = statusFrame.status.source;
    CGFloat sourceLabelX = CGRectGetMaxX(_timeLabel.frame) + SWStatusCellBorder;
    CGFloat sourceLabelY = timeLabelY;
    CGSize sourceLabelSize = [statusFrame.status.source sizeWithFont:SWSourceFont];
    self.sourceLabel.frame = (CGRect){{sourceLabelX, sourceLabelY}, sourceLabelSize};
  
    // 我的正文
    self.myTextLabel.text = statusFrame.status.text;
    self.myTextLabel.frame = statusFrame.myTextLabelF;
    
    //配图
    if (statusFrame.status.pic_urls.count) {
        self.photoView.hidden = NO;
        self.photoView.frame = statusFrame.photoViewF;
//        SWPhoto *photo = statusFrame.status.pic_urls[0];      
//        [self.photoView setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
        self.photoView.photos = statusFrame.status.pic_urls;
    }
    //转发的微博
    SWStatus *retweet = status.retweeted_status;
    if(retweet){
        self.retweetView.hidden = NO;
        self.retweetView.cellFrame = statusFrame;
        self.retweetView.frame = _statusFrame.retweetViewF;
    }else{
        self.retweetView.hidden = YES;
    }
}

@end

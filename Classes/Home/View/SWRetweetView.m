//
//  SWRetweetView.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-8.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWRetweetView.h"
#import "UIImage+MN.h"
#import "SWCellFrame.h"
#import "SWStatus.h"
#import "SWUser.h"
#import "UIImageView+WebCache.h"
#import "SWPhoto.h"
#import "SWPhotosView.h"

#define SWColor(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0];

@interface SWRetweetView ()
@property (nonatomic,weak) UILabel *retweetName;
@property (nonatomic,weak) UILabel *retweetTextLabel;
@property (nonatomic,weak) SWPhotosView *retweetImageView;

@end

@implementation SWRetweetView


-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        self.userInteractionEnabled = YES;
      
        self.image = [UIImage  resizeImageWithName:@"timeline_retweet_background" left:0.9 top:0.5];
        
        // 添加被转发的人
        UILabel *retweetName = [[UILabel alloc] init];
        [self addSubview:retweetName];
        retweetName.textColor = SWColor(3, 49, 164);
        self.retweetName = retweetName;
        self.retweetName.font = SWRetweetNameLabeFont;
        
        // 添加转发的振文
        UILabel *retweetTextLabel = [[UILabel alloc] init];
        [self addSubview:retweetTextLabel];
        self.retweetTextLabel = retweetTextLabel;
        self.retweetTextLabel.font = SWRetweetContentFont;
        self.retweetTextLabel.numberOfLines = 0 ;
        
        // 添加转发的图片
        SWPhotosView *retweetImageView = [[SWPhotosView alloc] init];
        retweetImageView.hidden =YES;
        [self addSubview:retweetImageView];
        self.retweetImageView = retweetImageView;
      }
   
    return self;
 
}

-(void)setCellFrame:(SWCellFrame *)cellFrame
{
    _cellFrame = cellFrame;
    
    NSString *string = [NSString stringWithFormat:@"@%@",cellFrame.status.retweeted_status.user.name];
    self.retweetName.text = string;
    self.retweetName.frame = cellFrame.retweetNameF;
    
    
    
    self.retweetTextLabel.text = cellFrame.status.retweeted_status.text;
    self.retweetTextLabel.frame = cellFrame.retweetTextLabelF;
    
    
    if(cellFrame.status.retweeted_status.pic_urls.count){
        self.retweetImageView.hidden = NO;
//        SWPhoto *photo = cellFrame.status.retweeted_status.pic_urls[0];
//    [self.retweetImageView setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
        
        NSArray  *retweetViewArray = cellFrame.status.retweeted_status.pic_urls;
        self.retweetImageView.photos = retweetViewArray;
        
        
     self.retweetImageView.frame = self.cellFrame.retweetImageViewF;
    }
}

@end

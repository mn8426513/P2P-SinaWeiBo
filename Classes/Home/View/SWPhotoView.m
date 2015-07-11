//
//  SWPhotoView.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-9.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWPhotoView.h"
#import "UIImage+MN.h"
#import "SWPhoto.h"
#import "UIImageView+WebCache.h"

@interface SWPhotoView ()
@property (nonatomic,weak) UIImageView *gifView;
@end

@implementation SWPhotoView
-(instancetype)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    if(self){
        
        self.userInteractionEnabled =YES;
        // 添加一个GIF小图片
        UIImage *image = [UIImage imageWithName:@"timeline_image_gif"];
        UIImageView *gifView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:gifView];
        self.gifView = gifView;
    }
    return self;
}

-(void)setPhoto:(SWPhoto *)photo
{
    _photo =photo;
    // 控制gif的可见性
    self.gifView.hidden = ![photo.thumbnail_pic hasPrefix:@"gif"];
    
    //下载图片
    [self setImageWithURL:[NSURL URLWithString:_photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
 
}

-(void)layoutSubviews
{
    
    self.gifView.layer.anchorPoint = CGPointMake(1, 1);
    self.gifView.layer.position = CGPointMake(self.frame.size.width, self.frame.size.height);
    [super layoutSubviews];
}
@end

//
//  MiddleButton.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-19.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "MiddleButton.h"
#define SWTitleButtonImageW 20
#import "UIImage+MN.h"
@implementation MiddleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 背景
        [self setBackgroundImage:[UIImage resizeImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = SWTitleButtonImageW;
    CGFloat imageX = contentRect.size.width - (imageW +5);
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width - SWTitleButtonImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    CGFloat btnW = [title sizeWithFont:self.titleLabel.font].width + SWTitleButtonImageW + 10;
    CGRect tempFrame = self.frame;
    tempFrame.size.width = btnW;
    self.frame = tempFrame;
}

@end

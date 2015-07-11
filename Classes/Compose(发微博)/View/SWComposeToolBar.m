//
//  SWComposeToolBar.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-13.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWComposeToolBar.h"
#import "UIImage+MN.h"

@implementation SWComposeToolBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self= [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"compose_toolbar_background"]];
        
        [self setupButtonWithName:@"compose_toolbar_picture" highName:@"compose_toolbar_picture_highlighted" tag:SWComposeToolBarPictureButton];
        [self setupButtonWithName:@"compose_camerabutton_background" highName:@"compose_camerabutton_background_highlighted" tag:SWComposeToolBarCameraButton];
        [self setupButtonWithName:@"compose_mentionbutton_background" highName:@"compose_mentionbutton_background_highlighted" tag:SWComposeToolBarMentionButton];
        [self setupButtonWithName:@"compose_trendbutton_background" highName:@"compose_trendbutton_background_highlighted" tag:SWComposeToolBarTrendbutton];
        [self setupButtonWithName:@"compose_emoticonbutton_background" highName:@"compose_emoticonbutton_background_highlighted" tag:SWComposeToolBarEmotionButton];
  
 
        
    }
    return self;
}

-(void)setupButtonWithName:(NSString *)name highName:(NSString *)highName tag:(SWComposeToolBarButton)tag
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageWithName:name] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:highName] forState:UIControlStateHighlighted];
    button.tag = tag;
    [button addTarget:self action:@selector(btnClick:)  forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

-(void)btnClick:(UIButton *)button
{
    if([self.delegate respondsToSelector:@selector(composeToolBarDidClickButton:button:)]){
        [self.delegate composeToolBarDidClickButton:self button:button];
    }
}





-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    CGFloat buttonW =self.frame.size.width / self.subviews.count;
    for (int i = 0;i<self.subviews.count; i++) {
        UIButton *button = self.subviews[i];
        CGFloat buttonX = buttonW * i;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

@end

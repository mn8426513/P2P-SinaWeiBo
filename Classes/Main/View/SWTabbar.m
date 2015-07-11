//
//  SWTabbar.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-17.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWTabbar.h"
#import "SWTabbarButton.h"
#import "UIImage+MN.h"
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
@interface SWTabbar ()
@property (nonatomic,strong) NSMutableArray *tabbarButtons;
@property (nonatomic,strong) UIButton *selectedButton;
@property (nonatomic,weak)   UIButton *addButton;

@end

@implementation SWTabbar

-(NSMutableArray *)tabbarButtons
{
    if(!_tabbarButtons){
        _tabbarButtons = [NSMutableArray array];
    }
    return _tabbarButtons;
}

- (instancetype)initWithFrame:(CGRect)frame
{     self = [super initWithFrame:frame];
    if(self){
       if(!iOS7){
           self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background" ]];
          }
        
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [addButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        
        [addButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [addButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [addButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        addButton.bounds = CGRectMake(0, 0, addButton.currentBackgroundImage.size.width, addButton.currentBackgroundImage.size.height);
        [addButton addTarget:self action:@selector(compose) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:addButton];
        self.addButton = addButton;
     }
   return  self;
}

- (void)compose
{
    if([self.delegate respondsToSelector:@selector(tabbarDidClickAddButton:)]){
        [self.delegate tabbarDidClickAddButton:self];
    }

}


- (void)addTabButton:(UITabBarItem *)barItem
{
    SWTabbarButton *barButton = [[SWTabbarButton alloc] init];
    barButton.tabbarItem = barItem;
    [self addSubview:barButton];
    [self.tabbarButtons addObject:barButton];
    [barButton addTarget: self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    if(self.tabbarButtons.count==1){
        [self btnClick:barButton];
    }
    
}


- (void)layoutSubviews
{
    self.addButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    for(int i = 0;i < self.tabbarButtons.count;i++){
    SWTabbarButton *button = self.tabbarButtons[i];
        CGFloat buttonW = self.frame.size.width / self.subviews.count;
        CGFloat buttonX = i * buttonW;
    if(i>1){
          buttonX += buttonW;
            }
        CGFloat buttonY = 0;
        CGFloat buttonH = self.frame.size.height;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = i;
  }

}

- (void)btnClick:(UIButton *)button
{
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    if([self.delegate respondsToSelector:@selector(tabbar:from:to:)]){
        [self.delegate tabbar:self from: self.selectedButton.tag to:button.tag];
     }
    
    
}
@end

//
//  SWTabbarButton.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-17.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWTabbarButton.h"
#import "SWBadgeButton.h"
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

#define colorWithRGB(r,g,b) ([UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0])
#define SWTabbarButtonTitleColor   (iOS7? colorWithRGB(117,117,117): [UIColor whiteColor])
#define SWTabbarButtonSelectedTitleColor   (iOS7? colorWithRGB(235,103,7): colorWithRGB(248,139,0))


@interface SWTabbarButton ()
@property (nonatomic,weak) SWBadgeButton *badge;

@end
@implementation SWTabbarButton

- (void)setHighlighted:(BOOL)highlighted
{}

- (instancetype)initWithFrame:(CGRect)frame
{     self = [super initWithFrame:frame];
     if(self){
         self.imageView.contentMode = UIViewContentModeCenter;
         self.titleLabel.textAlignment = NSTextAlignmentCenter;
         self.titleLabel.font  = [UIFont systemFontOfSize:12];
         [self setTitleColor: SWTabbarButtonTitleColor forState:UIControlStateNormal];
         [self setTitleColor:SWTabbarButtonSelectedTitleColor forState:UIControlStateSelected];
         
         //添加一个badge按钮
          SWBadgeButton *badge = [[SWBadgeButton alloc] init];
         [self addSubview:badge];
          self.badge = badge;
      }
    return  self;
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 5, contentRect.size.width, contentRect.size.height * 0.6);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
   return CGRectMake(0, contentRect.size.height * 0.6, contentRect.size.width  , contentRect.size.height * 0.5);
}


- (void)setTabbarItem:(UITabBarItem *)tabbarItem
{
    _tabbarItem = tabbarItem;
        [tabbarItem addObserver:self forKeyPath:@"title" options:0 context:nil];
        [tabbarItem addObserver:self forKeyPath:@"image" options:0 context:nil];
        [tabbarItem addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
        [tabbarItem addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    
      [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
}


-(void)dealloc
{
    [self.tabbarItem removeObserver:self forKeyPath:@"title"];
    [self.tabbarItem removeObserver:self forKeyPath:@"image" ];
    [self.tabbarItem removeObserver:self forKeyPath:@"selectedImage"];
    [self.tabbarItem removeObserver:self forKeyPath:@"badgeValue"];
 
}
/**
    监听某个对象的属性发生改变的时候就调用
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.tabbarItem.title forState:UIControlStateNormal];
    [self setTitle:self.tabbarItem.title forState:UIControlStateSelected];
    [self setImage:self.tabbarItem.image forState:UIControlStateNormal];
    [self setImage:self.tabbarItem.selectedImage forState:UIControlStateSelected];
    self.badge.badgeValue = self.tabbarItem.badgeValue;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect tempFrame = self.badge.frame;
    CGFloat badgeX = self.frame.size.width * 0.5 + 3;
    CGFloat badgeY = 1;
    tempFrame.origin.x = badgeX;
    tempFrame.origin.y = badgeY;
    self.badge.frame = tempFrame;
}


@end

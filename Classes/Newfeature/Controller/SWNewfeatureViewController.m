//
//  SWNewfeatureViewController.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-22.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWNewfeatureViewController.h"
#import "UIImage+MN.h"
#import "SWTabBarViewController.h"
#define  SWPageNO 3

#define SWColor(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0];
@interface SWNewfeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic,weak)  UIPageControl *pageControl;
@end

@implementation SWNewfeatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupScrollView];
    [self setupPageControl];
}

-(void)setupPageControl
{      //添加
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.bounds = (CGRect){CGPointZero,CGSizeMake(100, 10)};
        pageControl.numberOfPages = SWPageNO;
        pageControl.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height -30);
    
       //设置圆点的颜色
        pageControl.pageIndicatorTintColor = SWColor(189,189,189);
        pageControl.currentPageIndicatorTintColor = SWColor(252, 98, 43);
        self.pageControl = pageControl;
        [self.view addSubview:pageControl];
    
}

-(void)setupScrollView
{       //  1.添加scrollview
        UIScrollView *scrollView = [[UIScrollView alloc] init];
            scrollView.frame = self.view.frame;
            [self.view addSubview: scrollView];
            scrollView.delegate = self;
        // 2.添加图片
            CGFloat imageW = scrollView.frame.size.width;
            CGFloat imageH = scrollView.frame.size.height;
            for (int i = 0; i < SWPageNO; i++) {
                UIImageView *imageView  = [[UIImageView alloc] init];
                
                NSString *imageName = nil;
                if ([UIScreen mainScreen].bounds.size.height == 568) {
                    imageName = [NSString stringWithFormat:@"new_feature_%d-586h@2x",i+1];
                }else{
                    imageName = [NSString stringWithFormat:@"new_feature_%d",i+1];
                }
                imageView.image = [UIImage imageWithName:imageName];
                CGFloat imageX = i * imageW;
                imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
                [scrollView addSubview:imageView];
                
                if (i == SWPageNO - 1) {
                    [self setupLastImageView:imageView];
                }

            }
          // 3.设置滚动的内容尺寸
            scrollView.contentSize =  CGSizeMake(imageW * 3, 0);
            scrollView.pagingEnabled = YES;
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView.bounces = NO;
}


- (void)setupLastImageView:(UIImageView *)imageView
{
    // 0.让imageView能跟用户交互
    imageView.userInteractionEnabled = YES;
    
    // 1.添加开始按钮
    UIButton *startButton = [[UIButton alloc] init];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    
    // 2.设置frame
    CGFloat centerX = imageView.frame.size.width * 0.5;
    CGFloat centerY = imageView.frame.size.height * 0.6;
    startButton.center = CGPointMake(centerX, centerY);
    startButton.bounds = (CGRect){CGPointZero, startButton.currentBackgroundImage.size};
    
    // 3.设置文字
    [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startButton];
    
    // 4.添加checkbox
    UIButton *checkbox = [[UIButton alloc] init];
    checkbox.selected = YES;
    [checkbox setTitle:@"分享给大家" forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    checkbox.bounds = CGRectMake(0, 0, 200, 50);
    CGFloat checkboxCenterX = centerX;
    CGFloat checkboxCenterY = imageView.frame.size.height * 0.5;
    checkbox.center = CGPointMake(checkboxCenterX, checkboxCenterY);
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    checkbox.titleLabel.font = [UIFont systemFontOfSize:15];
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 调整按钮内部的偏移
    //    checkbox.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    checkbox.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0,10);
    //    checkbox.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [imageView addSubview:checkbox];
}

- (void)start
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    self.view.window.rootViewController = [[SWTabBarViewController alloc] init];
}

- (void)checkboxClick:(UIButton *)checkbox
{
    checkbox.selected = !checkbox.isSelected;
}


//  只要UIScrollView 滚动了，就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    double pageNo =  offsetX / scrollView.frame.size.width ;
    int  intPage = (int)(pageNo + 0.5);
    self.pageControl.currentPage = intPage;
}

@end

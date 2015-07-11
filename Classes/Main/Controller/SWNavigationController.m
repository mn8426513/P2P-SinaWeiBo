//
//  SWNavigationController.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-19.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWNavigationController.h"
#import "UIImage+MN.h"
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
@interface SWNavigationController ()

@end

@implementation SWNavigationController


+(void)initialize
{

    [self setNavBar];
    [self setButtonItem];
     
    
}

+(void)setButtonItem
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    if(!iOS7){
 
    [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_send_background_disabled"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
     }
    
    NSMutableDictionary *buttonAttr = [NSMutableDictionary dictionary];
    buttonAttr[UITextAttributeTextColor] = iOS7?[UIColor orangeColor]:[UIColor grayColor];
    buttonAttr[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    buttonAttr[UITextAttributeFont] =  iOS7?[UIFont systemFontOfSize:15]:[UIFont systemFontOfSize:16];
    [item setTitleTextAttributes:buttonAttr forState:UIControlStateNormal];
    [item setTitleTextAttributes:buttonAttr forState:UIControlStateHighlighted];
    
    //设置不能点的状态下的barbutton的颜色
     NSMutableDictionary *disabledButtonAttr = [NSMutableDictionary dictionary];
    disabledButtonAttr[UITextAttributeTextColor] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:disabledButtonAttr forState:UIControlStateDisabled];
 
}



+ (void)setNavBar
{
     UINavigationBar *navBar = [UINavigationBar appearance];
    if(!iOS7) {
        [navBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
//        UIStatusBarStyleDefault                                     = 0, // Dark content, for use on light backgrounds
//        UIStatusBarStyleLightContent     NS_ENUM_AVAILABLE_IOS(7_0) = 1, // Light content, for use on dark backgrounds     
//        UIStatusBarStyleBlackTranslucent NS_ENUM_DEPRECATED_IOS(2_0, 7_0, "Use UIStatusBarStyleLightContent") = 1,
//        UIStatusBarStyleBlackOpaque
      }
    
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[UITextAttributeTextColor] = [UIColor blackColor];
    titleAttr[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    titleAttr[UITextAttributeFont] = [UIFont systemFontOfSize:19];
    [navBar setTitleTextAttributes:titleAttr];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{   if(self.viewControllers.count == 0){
    viewController.hidesBottomBarWhenPushed = NO;
        }else {
            viewController.hidesBottomBarWhenPushed = YES;
        }
   [super pushViewController:viewController animated:YES];

}
@end

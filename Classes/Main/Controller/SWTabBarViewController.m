//
//  SWViewController.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//
#import "SWNavigationController.h"
#import "SWTabBarViewController.h"
#import "SWHomeController.h"
#import "SWMessageController.h"
#import "SWSquareController.h"
#import "SWMeController.h"
#import "SWTabbar.h"
#import "SWTabbarButton.h"
#import "UIImage+MN.h"
#import "SWComposeViewController.h"
#import "SWGetMessageCountParameter.h"
#import "SWCountResult.h"
#import "SWGetCountTool.h"
#import "SWAccount.h"
#import "SWAccountTool.h"

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
@interface SWTabBarViewController () <SWTabbarDelegate>


@property (nonatomic,weak) SWTabbar *customTabbar;

@property (nonatomic,strong) SWHomeController *home;

@property (nonatomic,strong) SWMessageController *message;

@property (nonatomic,strong) SWSquareController *square;

@property (nonatomic,strong) SWMeController *me;

@end

@implementation SWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSWTabbar];
    [self addController];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(getMessageCount) userInfo:nil repeats:YES];
    [[NSRunLoop  alloc] addTimer:timer forMode:NSRunLoopCommonModes];

}

- (void)getMessageCount
{
    NSLog(@"----");
    SWGetMessageCountParameter *parameter = [[SWGetMessageCountParameter alloc] init];
    parameter.uid = @([SWAccountTool getAccount].uid);
    
    [SWGetCountTool getUnreadCountWithParameter:parameter success:^(SWCountResult *result) {
       //主页未读微博数
    self.home.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.status];
       //消息未读总数
    self.message.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",[result messageUnreadCount]];
       //粉我的微博数
    self.me.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.follower];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = [result totalUnreadCount];
   } failure:^(NSError *error) {
       
}];

}



- (void)addSWTabbar
{
    SWTabbar *tabbar = [[SWTabbar alloc] init];
    tabbar.delegate = self;
    tabbar.frame = [self.tabBar bounds];
    [self.tabBar addSubview:tabbar];
    self.customTabbar = tabbar;
}

-(void)tabbar:(SWTabbar *)tabbar from:(int)from to:(int)to
{
     self.selectedIndex = to;
     if(0==to){
         [self.home ClickHomeButton];
         self.home.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for(UIView *child in self.tabBar.subviews){
        if([child isKindOfClass:[UIControl class]]){
            [child removeFromSuperview];
        }
     }
  
}

- (void)tabbarDidClickAddButton:(SWTabbar *)tabbar
{
    SWComposeViewController *compose = [[SWComposeViewController alloc] init];
    SWNavigationController *nav = [[SWNavigationController alloc] initWithRootViewController:compose];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)addController
{
   SWHomeController *home = [[SWHomeController alloc] init];
    self.home = home;
    [self setupChildViewControllerWithController:home title:@"首页" image:@"tabbar_home"     selected:@"tabbar_home_selected"];
    
    SWMessageController *message = [[SWMessageController alloc] init];
    self.message = message;
    [self setupChildViewControllerWithController:message title:@"消息" image:@"tabbar_message_center" selected:@"tabbar_message_center_selected"];

    
    SWSquareController *square = [[SWSquareController alloc] init];
    self.square = square;
    [self setupChildViewControllerWithController:square title:@"广场" image:@"tabbar_discover" selected:@"tabbar_discover_selected"];

    SWMeController *me = [[SWMeController alloc] init];
    self.me = me;
    [self setupChildViewControllerWithController:me title:@"我" image:@"tabbar_profile"
        selected:@"tabbar_profile_selected"];
 
}


- (void)setupChildViewControllerWithController:(UIViewController *)VC  title:(NSString *)title image:(NSString *)image selected:(NSString *)selectedImage
{
    
    VC.title = title;
    VC.tabBarItem.title = title;
    VC.tabBarItem.image = [UIImage imageWithName:image];
    if(iOS7){
          VC.tabBarItem.selectedImage = [[UIImage imageWithName:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else {
          VC.tabBarItem.selectedImage = [UIImage imageWithName:selectedImage];
    }
    
    SWNavigationController *nav = [[SWNavigationController alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
    
    [self.customTabbar addTabButton:VC.tabBarItem];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

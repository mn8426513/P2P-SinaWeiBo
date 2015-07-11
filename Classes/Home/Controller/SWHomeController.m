//
//  SWHomeController.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWHomeController.h"
#import "UIBarButtonItem+MN.h"
#import "SWLoadStatusTool.h"
#import "MiddleButton.h"
#import "UIImage+MN.h"
#import "SWAccountTool.h"
#import "SWAccount.h"
#import "SWStatus.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "SWUser.h"
#import "SWStatusCellTableViewCell.h"
#import "SWCellFrame.h"
#import "MJRefresh.h"
#import "SWStatusParameter.h"
#import "SWStatusResult.h"
#import "SWUserParameter.h"
#import "SWUserResult.h"
#define SWSWStatusPercentFrequency 10
#define SWColor(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0]

@interface SWHomeController ()
@property (nonatomic,strong) NSMutableArray *statusFrameArray;
@property (nonatomic,weak) MiddleButton *middleButton;

@end
@implementation SWHomeController

//-(void)loadView
//{
//    
//}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    /**  1.设置导航栏的样式*/
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self setupNavBar];
    
    [self setupFefreshControl];
    [self setUserData];

}



- (void)setUserData
{
    SWUserParameter *parameter = [[SWUserParameter alloc] init];
    //取出帐号中的access_token
    SWAccount *account = [SWAccountTool getAccount];
    parameter.uid =  @(account.uid);
    
    [SWLoadStatusTool getUserInfoWithParameter:parameter success:^(SWUserResult *result) {
        // 取出用户的名字
        [self.middleButton setTitle:result.name forState:UIControlStateNormal];
        ///将用户归档
        account.name = result.name;
        [SWAccountTool saveAccount:account];
        [self.tableView reloadData];
        
       } failure:^(NSError *error) {
           
    }];
}


- (void)setupFefreshControl
{
    //系统自带的刷新框架
//    // 1. 下拉刷新
//    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
//     // 监听刷新控件的状态改变
//    [refreshControl addTarget:self action:@selector(refreshData:) forControlEvents:UIControlEventValueChanged];
//    [self.tableView addSubview:refreshControl];
//     // 自动进入刷新状态(不会触发监听方法)
//    [refreshControl beginRefreshing];
//     // 直接加载数据
//    [self refreshData:refreshControl];
    
    //第三方框架
    //1.下拉刷新
    [self.tableView  addHeaderWithTarget:self action:@selector(headerRefresh)];
    [self.tableView  headerBeginRefreshing];
    
    //2.  上拉刷新
    [self.tableView  addFooterWithTarget:self action:@selector(footerRefresh)];
    
}





//下拉刷新
- (void)headerRefresh
{
    self.tabBarItem.badgeValue = nil;
    // 2.封装请求参数
    SWStatusParameter *parameter = [[SWStatusParameter alloc] init];
    parameter.count = @(SWSWStatusPercentFrequency);
    if(self.statusFrameArray.count){
        SWCellFrame *frame = self.statusFrameArray[0];
       parameter.since_id =  @(frame.status.idstr);
    }
    // 3.发送请求
    [SWLoadStatusTool getStatusWithParameter:parameter success:^(SWStatusResult *result) {
        NSArray *statusArray = result.statuses;

        NSMutableArray *statusFrame = [NSMutableArray array];
        for(SWStatus *status in statusArray){
            SWCellFrame  *cellFrame = [[SWCellFrame alloc] init];
            cellFrame.status =status;
            [statusFrame  addObject:cellFrame];
        }
        
        NSMutableArray *tempArray = [NSMutableArray array];
        [tempArray addObjectsFromArray:statusFrame];
        [tempArray addObjectsFromArray:self.statusFrameArray];
        self.statusFrameArray = tempArray;
        [self.tableView headerEndRefreshing];
        [self.tableView reloadData];
        [self setupFreshCountRemind:(int)statusArray.count];
        
    } failure:^(NSError *error) {
            [self.tableView headerEndRefreshing];
    }];
}

//上拉刷新
- (void)footerRefresh
{
    // 2.封装请求参数
    SWStatusParameter *parameter = [[SWStatusParameter alloc] init];
    parameter.count = @(SWSWStatusPercentFrequency);
    if(self.statusFrameArray.count){
        SWCellFrame *frame = [self.statusFrameArray lastObject];
        parameter.max_id= @(frame.status.idstr - 1);
    }
    // 3.发送请求
    [SWLoadStatusTool getStatusWithParameter:parameter success:^(SWStatusResult *result) {
        NSMutableArray *statusFrame = [NSMutableArray array];
        NSArray *statusArray = result.statuses;
        for (SWStatus *status  in statusArray) {
            SWCellFrame *cellFrame = [[SWCellFrame alloc] init];
            cellFrame.status = status;
            [statusFrame  addObject:cellFrame];
        }
        [self.statusFrameArray addObjectsFromArray:statusFrame];
        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
    } failure:^(NSError *error) {
        [self.tableView footerEndRefreshing];
    }];
}

-(void)ClickHomeButton
{
    [self headerRefresh];
}


-(void)setupFreshCountRemind:(int)count
{
   // 1.创建按钮
    UIButton *remind = [[UIButton alloc] init];
   // 2.添加到navigationController的view上面去
    [self.navigationController.view insertSubview:remind belowSubview:self.navigationController.navigationBar];
   // 3.设置显示的样式
    [remind setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    remind.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [remind setBackgroundImage:[UIImage resizeImageWithName:@"timeline_new_status_background"] forState:UIControlStateNormal];
    if(count){
        NSString *title = [NSString stringWithFormat:@"共有%d条新微博",count];
        [remind setTitle:title forState:UIControlStateNormal];
    }else{
        [remind setTitle:@"没有新的微博" forState:UIControlStateNormal];
    }
    // 4.设置frame和动画
    CGFloat remindH = 30;
    CGFloat remindW = self.view.frame.size.width;
    CGFloat remindX = 0;
    CGFloat remindY = 64 - remindH;
    remind.frame = CGRectMake(remindX, remindY, remindW, remindH);
    
    [UIView animateWithDuration:0.7 animations:^{
        remind.transform = CGAffineTransformMakeTranslation(0,remindH + 2 );
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.7 delay:0.5 options:UIViewAnimationOptionCurveLinear  animations:^{
            remind.transform =CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [remind removeFromSuperview];
        }];
    }];
}

- (void)setupNavBar
{
     //  设置tableview的背景颜色
//    [self.tableView setBackgroundColor: SWColor(221, 221, 224)];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 8, 0);
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch" highIcon:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_pop" highIcon:@"navigationbar_pop_highlighted"target:self action:@selector(pop)];
    
    MiddleButton *middleButton = [[MiddleButton alloc] init];
    [middleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
       if([SWAccountTool getAccount].name){
            [middleButton setTitle:[SWAccountTool getAccount].name forState:UIControlStateNormal];
        } else {
            [middleButton setTitle:@"首页" forState:UIControlStateNormal];
        }
 
    [middleButton setTitleColor:[UIColor colorWithRed:234/255.0 green:107/255.0 blue:12/255.0 alpha:1.0] forState:UIControlStateNormal];
    [middleButton setTitleColor:[UIColor colorWithRed:117/255.0 green:61/255.0 blue:16/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    middleButton.frame = CGRectMake(0, 0, 100, 40);
    [middleButton addTarget:self action:@selector(middleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = middleButton;
    self.middleButton = middleButton;
    
}


- (void)middleClick:(UIButton*)button
{
       if (button.currentImage == [UIImage imageWithName:@"navigationbar_arrow_up"]) {
            [button setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        } else {
            [button setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        }
}


-(void)pop
{


}
-(void)friendSearch
{
    self.tabBarItem.badgeValue = @"10";

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.statusFrameArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   SWStatusCellTableViewCell *cell =  [SWStatusCellTableViewCell cellWithTablbView:tableView cellForRowAtIndexPath:indexPath];
    
    cell.cellFrame = self.statusFrameArray[indexPath.row];
    
    return  cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  [self.statusFrameArray[indexPath.row] cellHeight];
}


@end

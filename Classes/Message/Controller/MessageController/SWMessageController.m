//
//  SWMessageController.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWMessageController.h"
#import "SWMessageItemSection.h"
#import "SWMessageItem.h"
#import "SWMessageLabelItem.h"
#import "SWMessageArrowItem.h"


#define KRowHeight 60
@interface SWMessageController ()

@end

@implementation SWMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:self action:@selector(privateMessage)];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"messages_tableview_background"]];
    self.tableView.rowHeight = KRowHeight;
    
    
    [self setupItem];
    
}

-(void)setupItem
{
    SWMessageItem *item0  = [SWMessageArrowItem arrowItemWithName:@"@我的" icon:@"messagescenter_at" descVC:nil];
    SWMessageItem *item1 = [SWMessageArrowItem arrowItemWithName:@"评论" icon:@"messagescenter_comments" descVC:nil];
    SWMessageItem *item2 = [SWMessageArrowItem arrowItemWithName:@"赞" icon:@"messagescenter_good" descVC:nil];
    SWMessageItem *item3 = [SWMessageArrowItem arrowItemWithName:@"未关注私信" icon:@"messagescenter_messagebox" descVC:nil];
    
    SWMessageItemSection *section = [self  addSectionToSectionArray];
    section.items = @[item0,item1,item2,item3];
}



-(void)privateMessage
{


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
}


@end

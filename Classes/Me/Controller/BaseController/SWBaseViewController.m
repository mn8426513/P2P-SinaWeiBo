//
//  SWBaseViewController.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-23.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWBaseViewController.h"
#import "SWSettingItemSection.h"
#import "SWSettingArrowItem.h"
#import "UIImage+MN.h"
#import "SWCustomCell.h"

@interface SWBaseViewController ()

@end

@implementation SWBaseViewController

- (NSMutableArray *)settingItemGroup
{
    if(_settingItemGroup==nil){
        _settingItemGroup = [NSMutableArray array];
    }
    return _settingItemGroup;
}


- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if(self = [super initWithStyle:UITableViewStyleGrouped]){
        self.tableView.sectionHeaderHeight = 0;
        self.tableView.sectionFooterHeight = 1;
        
    }
    return self;
}

- (SWSettingItemSection *)addSettingItemSectionToGroup
{
    SWSettingItemSection *section = [SWSettingItemSection section];
    [self.settingItemGroup addObject:section];
    return section;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.settingItemGroup.count;
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.settingItemGroup[section] items].count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWSettingItemSection *section = self.settingItemGroup[indexPath.section];
    SWSettingItem *item = section.items[indexPath.row];
    SWCustomCell *cell = [SWCustomCell cellWithTableView:tableView indexPath:indexPath];
    cell.cellItem = item;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //取出模型
    SWSettingItemSection *section = self.settingItemGroup[indexPath.section];
    SWSettingItem *item = section.items[indexPath.row];
    
    //跳转
    if([item isKindOfClass:[SWSettingArrowItem class]]){
        SWSettingArrowItem *arrowItem = (SWSettingArrowItem *)item;
        if (arrowItem.destVC) {
            UIViewController *controller = arrowItem.destVC;
            controller.title = arrowItem.title;
            [self.navigationController pushViewController:controller animated:YES];
        }
    }
    
    //做block里面代码
    if(item.willDo){
        item.willDo();
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return  [self.settingItemGroup[section] header];
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return  [self.settingItemGroup[section] footer];
}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
////    if(section == 0){
////        return 100;
////    }
////    return 0;
//}
@end

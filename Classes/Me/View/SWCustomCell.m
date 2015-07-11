//
//  SWCustomCell.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-29.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWCustomCell.h"
#import "SWSettingItem.h"
#import "SWSettingArrowItem.h"
#import "SWSettingLabelItem.h"
#import "SWSettingSwitchItem.h"
#import "UIImage+MN.h"
@interface SWCustomCell ()
@property(nonatomic,assign) int totalNum;
@property(nonatomic,weak) UILabel *subTitle;
@end


@implementation SWCustomCell

+ (instancetype)cellWithTableView:(UITableView *)tableview indexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ME";
    
    SWCustomCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        
        cell = [[SWCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        tableview.separatorStyle =  UITableViewCellSeparatorStyleNone;
        
        //设置背景图片
        cell.backgroundColor = [UIColor clearColor];
        
        NSInteger totalNum =  [tableview numberOfRowsInSection:indexPath.section];
        UIImageView *bgImageView = [[UIImageView alloc] init];
        UIImageView *selectedImageView = [[UIImageView alloc] init];
        UIImage *bgImage = nil;
        UIImage *selectedBgImage = nil;
        
        if(totalNum == 1){
            bgImage = [UIImage resizeImageWithName:@"common_card_background"];
            selectedBgImage  = [UIImage resizeImageWithName:@"common_card_background_highlighted"];
        } else if(indexPath.row == 0){
            bgImage = [UIImage resizeImageWithName:@"common_card_top_background"];
            selectedBgImage  = [UIImage resizeImageWithName:@"common_card_top_background_highlighted"];
        
        } else if(indexPath.row == totalNum - 1){
            bgImage = [UIImage resizeImageWithName:@"common_card_bottom_background"];
            selectedBgImage  = [UIImage resizeImageWithName:@"common_card_bottom_background_highlighted"];
        }else{
            bgImage = [UIImage resizeImageWithName:@"common_card_middle_background"];
            selectedBgImage = [UIImage resizeImageWithName:@"common_card_middle_background_highlighted"];
        }
        
        bgImageView.image = bgImage;
        selectedImageView.image = selectedBgImage;
        
        cell.backgroundView = bgImageView;
        cell.selectedBackgroundView = selectedImageView;
        
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        //设置文字的属性
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor blackColor];
        self.textLabel.highlightedTextColor = self.textLabel.textColor;
        self.textLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}


-(void)setFrame:(CGRect)frame
{
    frame.origin.x = 3;
    frame.size.width -= 6;
    [super setFrame:frame];

}

/**
   重写set方法
 */
- (void)setCellItem:(SWSettingItem *)cellItem
{
    _cellItem = cellItem;
    //设置数据
    [self setupData];
    
    //设置右边的view
    [self setupRightView];
  
}


-(void)setupData
{
    self.imageView.image = [UIImage imageNamed:_cellItem.icon];
    self.textLabel.text = _cellItem.title;
    self.detailTextLabel.text = _cellItem.subTitle;
}


-(void)setupRightView
{
    if ([_cellItem isKindOfClass:[SWSettingArrowItem class]]) {
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"common_icon_arrow"]];
    } else if ([_cellItem isKindOfClass:[SWSettingSwitchItem class]]){
        self.accessoryView = [[UISwitch alloc] init];
    }
}

//-(void)layoutSubviews
//{
//    CGFloat subTitleX = CGRectGetMaxX(self.textLabel.frame);
//    CGFloat subTilteY = self.textLabel.frame.origin.y;
////    CGSize  size =  [self.cellItem.badgeValue sizeWithFont:[uifont]];
//}

@end

//
//  SWMessageCell.m
//  P2P-SinaWeibo
//
//  Created by Mac on 15-2-27.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import "SWMessageCell.h"
#import "UIImage+MN.h"
#import "SWMessageItem.h"
#import "SWMessageArrowItem.h"
#import "SWMessageLabelItem.h"

#define KRowHeight 60
#define KImageViewHW 42

@interface SWMessageCell ()
@property(nonatomic,strong) UIView *line;


@end

@implementation SWMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
        self.backgroundColor = [UIColor clearColor];
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor colorWithRed:216.0/255.0 green:216.0/255.0 blue:216.0/255.0 alpha:1.0];
        self.line = line;
        [self.contentView addSubview:line];
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (SWMessageCell *)messageCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    static NSString *ID =@"MC";
    SWMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[SWMessageCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
       
        
        NSInteger totalRow = [tableView numberOfRowsInSection:indexPath.section];
        UIImageView *bgView = [[UIImageView alloc] init];
        UIImageView *selectedBgView = [[UIImageView alloc] init];
        UIImage *bgImage = nil;
        UIImage *selectedBgImage = nil;
    
        if(totalRow == 1){
             bgImage = [UIImage resizeImageWithName:@"common_card_background"];
             selectedBgImage = [UIImage resizeImageWithName:@"common_card_background_highlighted"];
         }else if (indexPath.row == 0){
             bgImage = [UIImage resizeImageWithName:@"common_card_top_background"];
             selectedBgImage = [UIImage resizeImageWithName:@"common_card_top_background_highlighted"];
         }else if (indexPath.row == totalRow - 1){
             bgImage = [UIImage resizeImageWithName:@"common_card_bottom_background"];
             selectedBgImage = [UIImage resizeImageWithName:@"common_card_bottom_background_highlighted"];
         }else{
             bgImage = [UIImage resizeImageWithName:@"common_card_middle_background"];
             selectedBgImage = [UIImage resizeImageWithName:@"common_card_middle_background_highlighted"];
         }
        bgView.image = bgImage;
        selectedBgView.image = selectedBgImage;
        cell.backgroundView = bgView;
        cell.selectedBackgroundView = selectedBgView;
    }
    return cell;
    
     
}

-(void)setItem:(SWMessageItem *)item
{
    _item = item;
    
    //设置数据
    [self setupData];
    
    //设置右边的控件
    [self setupRight];
}


//设置数据
- (void)setupData
{
    self.imageView.image = [UIImage imageWithName:_item.icon];
    self.textLabel.text = _item.name;
    self.textLabel.font = [UIFont systemFontOfSize:14];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.line.frame = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 0.5);
    self.imageView.frame = CGRectMake((KRowHeight - KImageViewHW)*0.5, (KRowHeight - KImageViewHW)*0.5, KImageViewHW, KImageViewHW);
    CGRect tempRect = self.textLabel.frame;
    tempRect.origin.x =  CGRectGetMaxX(self.imageView.frame) + (KRowHeight - KImageViewHW)*0.5;
    self.textLabel.frame = tempRect;
    
}






//设置右边的控件
- (void)setupRight
{
    NSLog(@"%@",_item);
    if([_item isKindOfClass:[SWMessageArrowItem class]]){
        
        UIImageView *imageView = [[UIImageView  alloc] initWithImage:[UIImage imageWithName:@"common_icon_arrow"]];
        
        self.accessoryView = imageView;
    }
  
 
}


@end

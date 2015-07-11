//
//  SWStatusCellTableViewCell.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-28.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWStatusCellTableViewCell.h"
#import "SWStatus.h"
#import "SWCellFrame.h"
#import "UIImageView+WebCache.h"
#import "SWUser.h"
#import "UIImage+MN.h"
#import "SWToolbarView.h"
#import "SWFirstView.h"

#define SWStatusCellBorder 8
#define SWColor(r,g,b)  [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0]
#define SWNameFont [UIFont systemFontOfSize:15]
#define SWTimeFont [UIFont systemFontOfSize:10]
#define SWSourceFont SWTimeFont
#define SWMycontentFont [UIFont systemFontOfSize:13]
#define SWRetweetContentFont [UIFont systemFontOfSize:12]
#define SWRetweetNameLabeFont [UIFont systemFontOfSize:12]


@interface SWStatusCellTableViewCell ()

@property (nonatomic,weak) SWFirstView *firstView;
@property (nonatomic,weak) SWToolbarView *secondView;

@end

@implementation SWStatusCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTablbView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"HOMECELL@%d",(int)indexPath.row];
    SWStatusCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[SWStatusCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
//        self.backgroundColor = [UIColor clearColor];
        [self setupFirstView];
        [self setupSecondView];
        }

    return self;
}

-(void)setupFirstView
{
    // 添加第一个View
    SWFirstView *firstView = [[SWFirstView alloc] init];
    self.firstView = firstView;
    [self.contentView addSubview:firstView];
    
}

- (void)setupSecondView
{
//  添加第二个背景图片
    SWToolbarView *secondView = [[SWToolbarView alloc] init];
    [self.contentView addSubview:secondView];
    self.secondView = secondView;
   
}


-(void)setCellFrame:(SWCellFrame *)cellFrame
{
    _cellFrame = cellFrame;

    [self setupFirstViewFrameAndData];
    [self setupSecondViewFrameAndData];
}


 /**给第一个VIEW 设置尺寸和传递数据*/

-(void)setupFirstViewFrameAndData
{
     self.firstView.statusFrame = _cellFrame;
     self.firstView.frame = _cellFrame.firstViewF;
}

/**给第二个VIEW 设置尺寸和传递数据*/

-(void)setupSecondViewFrameAndData
{
    self.secondView.frame =  _cellFrame.secondViewF;
    self.secondView.status = _cellFrame.status;
}



- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 4;
    frame.size.width  -= 8;
    frame.size.height -= 10;
    frame.origin.y += SWStatusCellBorder;
    [super setFrame:frame];

}
@end

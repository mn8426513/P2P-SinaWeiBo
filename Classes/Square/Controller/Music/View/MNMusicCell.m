//
//  MNMusicCell.m
//  63-音乐播放器
//
//  Created by Mac on 15-2-11.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import "MNMusicCell.h"
#import "MJMusic.h"
#import "UIImage+MJ.h"
#import "Colours.h"

@interface MNMusicCell()

@property (nonatomic,strong) CADisplayLink *link;
@end
@implementation MNMusicCell


-(CADisplayLink *)link
{
    if(_link == nil){
        self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    }
    return _link;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
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


+ (MNMusicCell *)cellWithTablewView:(UITableView *)tableView
{
    static NSString *ID =@"CELL";
    
    MNMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
   
    if (cell==nil) {
        cell = [[MNMusicCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setMusic:(MJMusic *)music
{
    _music = music;
    
    //设置显示数据
    self.textLabel.text = music.name;
    self.imageView.image = [UIImage circleImageWithName:music.singerIcon borderWidth:1 borderColor:[UIColor skyBlueColor]];
    self.detailTextLabel.text =  music.singer;
    
    //让图片转动(图层和UIView的动画,但是图层动画有很多缺点)
    if (music.isPlaying) {
        
        [self.link  addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];

    } else {
        [self.link invalidate];
        
        self.link = nil;
        
        [UIView animateWithDuration:1 animations:^{
             self.imageView.transform = CGAffineTransformIdentity;
        }];
       
    }
}



-(void)update
{
    //1秒调用60次   要实现 90°/s
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI_2 / 60);

}
@end

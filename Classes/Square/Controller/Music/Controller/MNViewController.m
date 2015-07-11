//
//  MNViewController.m
//  63-音乐播放器
//
//  Created by Mac on 15-2-10.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import "MNViewController.h"
#import "MJMusic.h"
#import "MJExtension.h"
#import "MNAudioTool.h"
#import <MediaPlayer/MediaPlayer.h>
#import "MNMusicCell.h"
@interface MNViewController ()<AVAudioPlayerDelegate>
@property(nonatomic,strong) NSArray *songes;
@property(nonatomic,strong) CADisplayLink *link;
@property (nonatomic,strong) AVAudioPlayer *currentAudioPlayer;

- (IBAction)jump:(id)sender;
@end

@implementation MNViewController

-(NSArray *)songes
{
    if (_songes== nil) {
        _songes = [MJMusic objectArrayWithFilename:@"Musics.plist"];
    }
    return _songes;
}


-(CADisplayLink *)link
{
    if (_link == nil) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    }
    return _link;
}

-(void)update
{
    NSLog(@"%f  %f",self.currentAudioPlayer.duration,self.currentAudioPlayer.currentTime);

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"停止" style:UIBarButtonItemStylePlain target:self action:@selector(stopMusic)];

    
}


/**
 *  停止歌曲
 */

-(void)stopMusic
{
    [self.currentAudioPlayer stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -tableview的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.songes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MNMusicCell *cell = [MNMusicCell cellWithTablewView:tableView];
    MJMusic *music =  self.songes[indexPath.row];
   
    cell.music = music;
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     // 播放这一首
     MJMusic *music =  self.songes[indexPath.row];
     AVAudioPlayer *player =  [MNAudioTool playMusicWithName:music.filename];
     player.delegate = self;
    
     music.isPlaying = YES;
    
     self.currentAudioPlayer = player;
    
    //在锁屏的时候显示歌曲信息
    [self showInfoLockedScreen:music];
    
    //添加定时器
    [self.link invalidate];
    self.link = nil;
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    
    //重传模型
    
    MNMusicCell *cell =  (MNMusicCell * )[tableView cellForRowAtIndexPath:indexPath];
    
    cell.music = music;
    
    
}


//  在锁屏的时候显示歌曲信息
- (void)showInfoLockedScreen:(MJMusic *)music
{
    //在锁频的时候显示歌词 歌手 专辑
    MPNowPlayingInfoCenter *center = [MPNowPlayingInfoCenter defaultCenter];
    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    // MPMediaItemPropertyAlbumTitle   MPMediaItemPropertyArtist   MPMediaItemPropertyTitle MPMediaItemPropertyArtwork
    
    //歌曲
    info[MPMediaItemPropertyTitle] = music.name;
    //歌手
    info[MPMediaItemPropertyArtist] = music.singer;
    //专辑
    info[MPMediaItemPropertyAlbumTitle] = music.singer;
    //封面
    info[MPMediaItemPropertyArtwork] =  [[MPMediaItemArtwork  alloc] initWithImage:[UIImage imageNamed:music.icon]];
    center.nowPlayingInfo = info;
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
     // 停止这一首歌
    MJMusic *music = self.songes[indexPath.row];
    [MNAudioTool stopMusicWithName:music.filename];
    music.isPlaying = NO;
    
    
    //重传模型
    MNMusicCell *cell =  (MNMusicCell * )[tableView cellForRowAtIndexPath:indexPath];
    cell.music = music;
    
    
}

-  (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}



#pragma mark - AVAudioPlayerDelegate 的代理方法
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
   //自动暂停
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags
{
  //要主动继续播放
    [player play];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSInteger nextRow = indexPath.row + 1;
    if (nextRow == self.songes.count) {
        nextRow = 0;
    }
    
     //选中下一行cell
    NSIndexPath *currentIndexPath = [NSIndexPath indexPathForRow:nextRow inSection:indexPath.section];
    [self.tableView selectRowAtIndexPath:currentIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    
     //播放下一首歌
    [self tableView:self.tableView didSelectRowAtIndexPath:currentIndexPath];
    
    //重传模型
    MNMusicCell *cell =  (MNMusicCell * )[self.tableView cellForRowAtIndexPath:indexPath];
    MJMusic *music = _songes[indexPath.row];
    music.isPlaying = NO;
    cell.music = music;
    
}


- (IBAction)jump:(id)sender {
    self.currentAudioPlayer.currentTime = self.currentAudioPlayer.duration - 5;
    
    

}
@end

//
//  MNAudioTool.m
//  62-音频播放
//
//  Created by Mac on 15-2-9.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import "MNAudioTool.h"
#import <AVFoundation/AVFoundation.h>


@interface MNAudioTool ()

@end
@implementation MNAudioTool

/**
 * 存放音效唯一标识符的字典
 */
static NSMutableDictionary *_soundID;

/**
 * 存放音乐的audioPlayer的字典
 */
static NSMutableDictionary *_audioPlayer;

+(void)initialize
{
    if (_soundID == nil) {
        _soundID = [NSMutableDictionary dictionary];
    }
    
    if (_audioPlayer == nil){
        _audioPlayer = [NSMutableDictionary dictionary];
    }
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    // 设置音频回话类型
    [session setCategory:AVAudioSessionCategoryAmbient withOptions:AVAudioSessionCategoryOptionMixWithOthers error:NULL];
    [session setActive:YES error:NULL];
}



/**
 *   播放音效
 *
 *   @prama filename 音效文件名
 */
+ (void)playAudioWithName:(NSString *)fileName
{
    if (fileName == nil) return;
    
        //取出filename对应的soundId
        SystemSoundID soundID = [_soundID[fileName] unsignedLongValue];
    
    
        if (!soundID) {
            NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
            
            if (!url)  return;
            
            //创建一个soundID
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url),&soundID);
            _soundID[fileName] =  @(soundID);
        }
  
        // 2.播放音效文件
        AudioServicesPlaySystemSound(soundID);

}

/**
 *   销毁音效
 *
 *   @prama filename 音效文件名
 */
+ (void)disposeAudioWithName:(NSString *)fileName
{
    if (fileName == nil) return;
    
    //取出filename对应的soundId
    SystemSoundID soundID = [_soundID[fileName] unsignedLongValue];

    if(soundID){
        AudioServicesDisposeSystemSoundID(soundID);
    }
}

/**
 *   播放音乐
 *
 *   @prama filename 音效文件名
 */
+ (AVAudioPlayer *)playMusicWithName:(NSString *)fileName
{
    if (fileName == nil) return nil;
    
       //取出播放器
       AVAudioPlayer *player = _audioPlayer[fileName];
    
     if (player == nil) {
         
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
         
         if (url == nil)  return nil;
         player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
        _audioPlayer[fileName] = player;
         
         // 缓冲
         [player prepareToPlay];
        
       }
        // 播放
    [player play];
    
    return player;
 
}


/**
 *   暂停音乐
 *
 *   @prama filename 音效文件名
 */
+ (void)pauseMusicWithName:(NSString *)fileName
{
    if (fileName == nil) return;
        //取出播放器
        AVAudioPlayer *player = _audioPlayer[fileName];
    if (player.isPlaying){
       [player pause];
    }
}
/**
 *   停止音乐
 *
 *   @prama filename 音效文件名
 */
+ (void)stopMusicWithName:(NSString *)fileName
{
    if (fileName == nil)  return;
      //去除播放器
    AVAudioPlayer *player = _audioPlayer[fileName];
      if (player.isPlaying) {
          [player stop];
          [_audioPlayer removeObjectForKey:fileName];
    }
}


@end

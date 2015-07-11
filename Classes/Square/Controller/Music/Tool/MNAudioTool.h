//
//  MNAudioTool.h
//  62-音频播放
//
//  Created by Mac on 15-2-9.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface MNAudioTool : NSObject


/**
 *   播放音效
 *
 *   @prama filename 音效文件名
 */
+(void)playAudioWithName:(NSString *)fileName;

/**
 *   摧毁音效
 *
 *   @prama filename 音效文件名
 */
+(void)disposeAudioWithName:(NSString *)fileName;



/**
 *   播放音乐
 *
 *   @prama filename 音效文件名
 */
+ (AVAudioPlayer *)playMusicWithName:(NSString *)fileName;


/**
 *   暂停音乐
 *
 *   @prama filename 音效文件名
 */
+ (void)pauseMusicWithName:(NSString *)fileName;



/**
 *   停止音乐
 *
 *   @prama filename 音效文件名
 */
+ (void)stopMusicWithName:(NSString *)fileName;

/**
 * 拿到当前的player
 */
//- (AVAudioPlayer *)currentAudioPlayer
//{
//     for(NSString *fileName in _)
//  
//
//}
@end

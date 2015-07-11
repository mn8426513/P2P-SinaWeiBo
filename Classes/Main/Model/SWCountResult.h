//
//  SWCountResult.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>


//status 	int 	新微博未读数
//follower 	int 	新粉丝数
//cmt 	int 	新评论数
//dm 	int 	新私信数
//mention_status 	int 	新提及我的微博数
//mention_cmt 	int 	新提及我的评论数
//group 	int 	微群消息未读数
//private_group 	int 	私有微群消息未读数
//notice 	int 	新通知未读数
//invite 	int 	新邀请未读数
//badge 	int 	新勋章数
//photo 	int 	相册消息未读数
//msgbox 	int 	{{{3}}}


@interface SWCountResult : NSObject

@property (nonatomic,assign) int status;

@property (nonatomic,assign) int follower;

@property (nonatomic,assign) int cmt;

@property (nonatomic,assign) int dm;

@property (nonatomic,assign) int mention_status;

@property (nonatomic,assign) int mention_cmt;


-(int)messageUnreadCount;
-(int)totalUnreadCount;
@end

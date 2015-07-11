//
//  SWStatus.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-27.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SWUser;
@class SWStatus;

@interface SWStatus : NSObject
//动态正文
@property(nonatomic ,copy) NSString *text;
//创建的时间
@property(nonatomic,copy) NSString *created_at;
//微博来源
@property(nonatomic,copy) NSString *source;

@property (nonatomic,strong) NSArray *pic_urls;
//微博的ID
@property(nonatomic,assign)  long long idstr;


//转发的一条微博动态
@property(nonatomic,strong) SWStatus *retweeted_status;


//微博的转发数量
@property(nonatomic ,assign) int  reposts_count;
//微博的评论数量
@property(nonatomic,assign) int  comments_count;
//微博的点赞数量
@property(nonatomic,assign) int attitudes_count;

//发该微博的用户
@property(nonatomic ,strong) SWUser *user;

@end

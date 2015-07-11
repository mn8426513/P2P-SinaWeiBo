//
//  SWUser.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-27.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWUser : NSObject

//用户的名字
@property(nonatomic ,copy)  NSString *name;
//用户头像
@property(nonatomic ,copy)  NSString *profile_image_url;
//用户的id
@property(nonatomic,assign) long long idstr;

@property (nonatomic,assign) int mbrank;
@property (nonatomic,assign) int mbtype;

@end

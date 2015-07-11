//
//  SWAccount.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-23.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWAccount : NSObject <NSCoding>
@property(nonatomic,copy) NSString *access_token;
@property(nonatomic,assign) long long expires_in;
@property(nonatomic,assign) long long remind_in;
@property(nonatomic,assign) long long uid;
@property(nonatomic,strong) NSDate *deadline;
@property(nonatomic,strong) NSString *name;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)accountWithDict:(NSDictionary *)dict;
@end

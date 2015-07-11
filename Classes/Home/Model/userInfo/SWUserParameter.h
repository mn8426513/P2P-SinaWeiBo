//
//  SWUserParameter.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-15.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWBaseParameter.h"
//source 	false 	string 	采用OAuth授权方式不需要此参数，其他授权方式为必填参数，数值为应用的AppKey。
//access_token 	false 	string 	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
//uid 	false 	int64 	需要查询的用户ID。
//screen_name 	false 	string 	需要查询的用户昵称。
@interface SWUserParameter : SWBaseParameter
@property(nonatomic,strong) NSNumber *uid;
@property(nonatomic,copy) NSString *screen_name;
@end

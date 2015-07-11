//
//  SWGetMessageCountParameter.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWBaseParameter.h"
//source 	false 	string 	采用OAuth授权方式不需要此参数，其他授权方式为必填参数，数值为应用的AppKey。
//access_token 	false 	string 	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
//uid 	true 	int64 	需要获取消息未读数的用户UID，必须是当前登录用户。
//callback 	false 	string 	JSONP回调函数，用于前端调用返回JS格式的信息。
//unread_message 	false 	boolean 	未读数版本。0：原版未读数，1：新版未读数。默认为0。

@interface SWGetMessageCountParameter : SWBaseParameter
//uid 	true 	int64 	需要获取消息未读数的用户UID，必须是当前登录用户。
@property(nonatomic,strong) NSNumber *uid;

@end

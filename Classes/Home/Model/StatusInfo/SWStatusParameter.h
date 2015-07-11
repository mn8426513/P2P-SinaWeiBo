//
//  SWStatusParameter.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-15.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWBaseParameter.h"


//source 	false 	string 	采用OAuth授权方式不需要此参数，其他授权方式为必填参数，数值为应用的AppKey。
//access_token 	false 	string 	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
//since_id 	false 	int64 	若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
//max_id 	false 	int64 	若指定此参数，则返回ID小于或等于max_id的微博，默认为0。
//count 	false 	int 	单页返回的记录条数，最大不超过100，默认为20。
//page 	false 	int 	返回结果的页码，默认为1。
//base_app 	false 	int 	是否只获取当前应用的数据。0为否（所有数据），1为是（仅当前应用），默认为0。
//feature 	false 	int 	过滤类型ID，0：全部、1：原创、2：图片、3：视频、4：音乐，默认为0。
//trim_user 	false 	int 	返回值中user字段开关，0：返回完整user字段、1：user字段仅返回user_id，默认为0。

@interface SWStatusParameter : SWBaseParameter

/**
 单页返回的记录条数，最大不超过100，默认为20。
  */
@property (nonatomic,strong) NSNumber *count;


/**
 若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
 */
@property (nonatomic,strong) NSNumber *since_id;


/**
若指定此参数，则返回ID小于或等于max_id的微博，默认为0。
  */
@property (nonatomic,strong) NSNumber *max_id;



@end

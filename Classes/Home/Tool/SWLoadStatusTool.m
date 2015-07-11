//
//  SWLoadStatusTool.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-15.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWLoadStatusTool.h"
#import "SWHttpTool.h"
#import "SWStatusParameter.h"
#import "SWStatusResult.h"
#import "MJExtension.h"
#import "SWUserParameter.h"
#import "SWUserResult.h"
#import "SWStatusCacheTool.h"


@implementation SWLoadStatusTool


/**
 获取微博数据（不管是在网上加载还是在数据库中加载）
 */
+ (void)getStatusWithParameter:(SWStatusParameter *)parameter success:(void (^)(SWStatusResult *))success failure:(void (^)(NSError *))failure
{
//    NSArray *statusArray  = [SWStatusCacheTool getStatusesCacheWith:parameter];
//    if (statusArray.count) {
//        if (success) {
//            SWStatusResult *result = [[SWStatusResult alloc] init];
//            result.statuses = statusArray;
//            success(result);
//        }
//    }else{
        [SWHttpTool getWithUrl:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameter:parameter.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 
//                 NSArray *array = responseObject[@"statuses"];
//                 [SWStatusCacheTool addStatusWithArray:array];
            
                 if(success){
                     SWStatusResult *result = [SWStatusResult objectWithKeyValues:responseObject];
                     success(result);
                 }
             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 if(failure){
                     failure(error);
                 }
             }];
//    }
}

/**
 获得用户个人信息数据
 */
+(void)getUserInfoWithParameter:(SWUserParameter *)parameter success:(void (^)(SWUserResult *result))success failure:(void (^)(NSError *))failure
{
    [SWHttpTool getWithUrl:@"https://api.weibo.com/2/users/show.json" parameter:parameter.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(success){
            SWUserResult *result = [SWUserResult objectWithKeyValues:responseObject];
            success(result);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}

@end

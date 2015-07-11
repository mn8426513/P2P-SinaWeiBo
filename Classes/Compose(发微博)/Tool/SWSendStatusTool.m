//
//  SWSendStatusTool.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-15.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWSendStatusTool.h"
#import "SWSendStatusParameter.h"
#import "SWHttpTool.h"
#import "MJExtension.h"

@implementation SWSendStatusTool
/**
  发送只有文字的微博动态
 */
+ (void)sendStatusWithParameter:(SWSendStatusParameter *)parameter success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    [SWHttpTool postWithUrl:@"https://api.weibo.com/2/statuses/update.json" parameter:parameter.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if(success){
                success(responseObject);
            }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}




/**
 发送有文字有图片的微博动态
 */
+ (void)sendPictureStatusWithParameter:(SWSendStatusParameter *)parameter  formData:(NSArray *)formData success:(void (^)(id json))success failure:(void (^)(NSError * error))failure
{
    [SWHttpTool postWithUrl:@"https://upload.api.weibo.com/2/statuses/upload.json"  parameter:parameter.keyValues formDataArray:formData success:^(AFHTTPRequestOperation *operation, id responseObject){
        if(success){
            success(responseObject);
         }
      }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure){
            failure(error);
         }
    }];
}

@end

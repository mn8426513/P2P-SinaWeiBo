//
//  SWGetCountTool.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWGetCountTool.h"
#import "SWHttpTool.h"
#import "SWGetMessageCountParameter.h"
#import "SWCountResult.h"
#import "MJExtension.h"
@implementation SWGetCountTool

+(void)getUnreadCountWithParameter:(SWGetMessageCountParameter *)parameter success:(void (^)(SWCountResult *result))success failure:(void (^)(NSError *error)) failure
{
    [SWHttpTool getWithUrl:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameter:parameter.keyValues success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(success){
            SWCountResult *result = [SWCountResult objectWithKeyValues:responseObject];
            success(result);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(failure){
            failure(error);
        }
    }];
 

}
@end

//
//  SWLoadStatusTool.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-15.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  SWStatusParameter;
@class SWStatusResult;
@class SWUserParameter;
@class SWUserResult;

@interface SWLoadStatusTool : NSObject

+ (void)getStatusWithParameter:(SWStatusParameter *)parameter success:(void (^)(SWStatusResult *result))success failure:(void(^)(NSError *error))failure;
+(void)getUserInfoWithParameter:(SWUserParameter *)parameter success:(void (^)(SWUserResult *result))success  failure:(void (^)(NSError *error)) failure;
@end

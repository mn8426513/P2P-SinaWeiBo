//
//  SWGetCountTool.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SWGetMessageCountParameter;
@class SWCountResult;

@interface SWGetCountTool : NSObject
+(void)getUnreadCountWithParameter:(SWGetMessageCountParameter *)parameter success:(void (^)(SWCountResult *result))success failure:(void (^)(NSError *error)) failure;
@end

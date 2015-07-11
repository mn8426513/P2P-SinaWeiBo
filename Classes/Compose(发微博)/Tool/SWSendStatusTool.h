//
//  SWSendStatusTool.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-15.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SWSendStatusParameter;
@interface SWSendStatusTool : NSObject


/**
 发送只有文字的微博动态
 */
+ (void)sendStatusWithParameter:(SWSendStatusParameter *)parameter success:(void (^)(id))success failure:(void (^)(NSError *))failure;

/**
 发送有文字有图片的微博动态
 */
+ (void)sendPictureStatusWithParameter:(SWSendStatusParameter *)parameter  formData:(NSArray *)formData success:(void (^)(id json))success failure:(void (^)(NSError * error))failure;
@end




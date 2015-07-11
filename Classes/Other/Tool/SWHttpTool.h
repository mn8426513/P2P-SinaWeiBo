//
//  SWHttpTool.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-14.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface SWHttpTool : NSObject

/**
 包装了AFN的GET方法
 
 */

+(void)getWithUrl:(NSString *)urlString parameter:(NSDictionary *)param success:(void (^)(AFHTTPRequestOperation *operation,id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure ;



/**
 包装了AFN的普通参数POST方法
 
 */
+(void)postWithUrl:(NSString *)urlString parameter:(NSDictionary *)param
           success:(void (^)(AFHTTPRequestOperation *operation,id responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure ;



/**
 包装了AFN的有文件数据的post方法
 */
+(void)postWithUrl:(NSString *)urlString parameter:(NSDictionary *)param formDataArray:(NSArray *) formDataArray
           success:(void (^)(AFHTTPRequestOperation *operation,id responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure;



@end


@interface SWHttpToolParameter : NSObject

//文件数据
@property(nonatomic,strong) NSData *data;

//文件数据
@property(nonatomic,copy) NSString *name;

//文件数据
@property(nonatomic,copy) NSString *fileName;

//文件数据
@property(nonatomic,copy) NSString *mimeType;
@end
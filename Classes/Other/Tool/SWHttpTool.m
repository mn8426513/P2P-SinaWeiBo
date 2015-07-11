//
//  SWHttpTool.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-14.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWHttpTool.h"


@implementation SWHttpTool

/**
  包装了AFN的get方法
 
 */
+ (void)getWithUrl:(NSString *)urlString parameter:(NSDictionary *)param
          success:(void (^)(AFHTTPRequestOperation *operation,id responseObject))success
          failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure ;
{
    //  AFNetworking\AFN
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    // 2.发送请求
    [manager GET:urlString parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(operation,responseObject);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation,error);
        }
    }];
}


/**
 包装了AFN的传递普通数据的post方法
 
 */
+(void)postWithUrl:(NSString *)urlString parameter:(NSDictionary *)param
          success:(void (^)(AFHTTPRequestOperation *operation,id responseObject))success
          failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure ;
{
    //  AFNetworking\AFN
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 2.发送请求
    [manager POST:urlString parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(operation,responseObject);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation,error);
        }
    }];
}

/**
 包装了AFN的有文件数据的post方法
 
 */
+ (void)postWithUrl:(NSString *)urlString parameter:(NSDictionary *)param formDataArray:(NSArray *) formDataArray
           success:(void (^)(AFHTTPRequestOperation *operation,id responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure
{
    //  AFNetworking\AFN
    //   1.创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
   
    // 3.发送请求
    [manager POST:urlString parameters:param constructingBodyWithBlock:
     ^(id<AFMultipartFormData> formData) {// 在发送请求之前调用这个block
         // 必须在这里说明要上传哪些文件
          for(SWHttpToolParameter *imageData in formDataArray){
            // 发送多张图片用同一个name即可（同一个请求参数名字，服务器利用数组接收即可）
              [formData appendPartWithFileData:imageData.data name:imageData.name
                            fileName:imageData.fileName mimeType:imageData.mimeType];
         }
     }success:^(AFHTTPRequestOperation *operation, id responseObject){
         //showmessage 还要自己去隐藏这个提示
         if (success) {
             success(operation,responseObject);
         }
     }failure:^(AFHTTPRequestOperation *operation, NSError *error){
         if (failure) {
             failure(operation,error);
         }
     }];
}


@end

@implementation SWHttpToolParameter

@end
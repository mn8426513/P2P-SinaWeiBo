//
//  SWStatusCacheTool.m
//  P2P-SinaWeibo
//
//  Created by Mac on 15-1-3.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import "SWStatusCacheTool.h"
#import "FMDatabaseQueue.h"
#import "FMResultSet.h"
#import "FMDatabase.h"
#import "SWAccountTool.h"
#import "SWAccount.h"
#import "SWStatusParameter.h"

@implementation SWStatusCacheTool

static FMDatabaseQueue *_queue;
+ (void)initialize
{
    NSString *cachePath  = [[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"statuesCache.sqlite"];
    _queue = [FMDatabaseQueue databaseQueueWithPath:cachePath];
    [_queue  inDatabase:^(FMDatabase *db) {
        if ([db open]) {
            [db executeUpdate:@"create table if not exists t_statuesCache (id integer primary autoincrement,idstr text, json blob,access_token text)"];
        }
    }];
}


+ (void)addStatusWithDict:(NSDictionary *)dictionary
{
    //1. 解析要储存的数据
    NSString *access_token = [SWAccountTool getAccount].access_token;
    NSString *idstr = dictionary[@"idstr"];
    NSData *json  =  [NSKeyedArchiver archivedDataWithRootObject:dictionary];
    
    //2. 存储数据
     [_queue inDatabase:^(FMDatabase *db) {
         [db executeUpdate:@"insert into t_statuesCache (idstr,json,access_token) values (?,?,?)",idstr,json,access_token];
     }];
}

+ (void)addStatusWithArray:(NSArray *)dictArray
{
    for (NSDictionary *dict in dictArray) {
        [self addStatusWithDict:dict];
    }
}

+ (NSArray *)getStatusesCacheWith:(SWStatusParameter *)parameter
{
    NSNumber *since_id = parameter.since_id;
    NSNumber *max_id = parameter.max_id;
    NSNumber *count = parameter.count;
    NSString *access_token = [SWAccountTool getAccount].access_token;
    
    __block FMResultSet *result = nil;
    
    [_queue inDatabase:^(FMDatabase *db) {
       if ([db open]) {
           if (since_id){
           result = [db executeQuery:@"select * from t_statuesCache where access_token = ?,idstr > ? order by idstr desc limit 0,? ", access_token,since_id,count];
           } else if(max_id){
           result = [db executeQuery:@"select * from t_statuesCache where access_token = ?,idstr < ? order by idstr desc limit 0,? ", access_token,max_id,count];
           }else {
           result = [db executeQuery:@"select * from t_statuesCache where access_token = ? order by idstr desc limit 0,? ", access_token,count];
           }
       }
   }];
    NSMutableArray *array = [NSMutableArray array];
    while ([result next]) {
        NSData *json =  [result dataForColumn:@"json"];
        NSDictionary *dict =  [NSKeyedUnarchiver unarchiveObjectWithData:json];
        [array addObject:dict];
    }
    return array;
}
@end

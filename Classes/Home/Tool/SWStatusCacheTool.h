//
//  SWStatusCacheTool.h
//  P2P-SinaWeibo
//
//  Created by Mac on 15-1-3.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SWStatusParameter;
@interface SWStatusCacheTool : NSObject

+(void)addStatusWithDict:(NSDictionary *) dictionary;

+(void)addStatusWithArray:(NSArray *) dictArray;

+ (NSArray *)getStatusesCacheWith:(SWStatusParameter *)parameter;


@end

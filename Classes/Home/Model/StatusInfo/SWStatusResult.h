//
//  SWStatusResult.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-15.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SWStatusResult : NSObject

//返回的动态数据，用一个数组装 SWStatus 对象
@property(nonatomic,strong) NSArray *statuses;
@property(nonatomic,strong) NSNumber *previous_cursor;
@property(nonatomic,strong) NSNumber *next_cursor;
@property(nonatomic,strong) NSNumber *total_number;
@end

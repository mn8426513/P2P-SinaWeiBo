//
//  SWStatusResult.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-15.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWStatusResult.h"
#import "MJExtension.h"
#import "SWStatus.h"
@implementation SWStatusResult
- (NSDictionary *)objectClassInArray
{
    return  @{@"statuses": [SWStatus class]};
}


@end

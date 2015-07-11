//
//  SWBaseParameter.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-15.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWBaseParameter.h"
#import "SWAccountTool.h"
#import "SWAccount.h"


@implementation SWBaseParameter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.access_token = [SWAccountTool getAccount].access_token;
    }
    return self;
}
@end

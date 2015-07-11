//
//  SWAccountTool.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-23.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SWAccount;

@interface SWAccountTool : NSObject
+(void)saveAccount:(SWAccount *)account;
+(SWAccount *)getAccount;
@end

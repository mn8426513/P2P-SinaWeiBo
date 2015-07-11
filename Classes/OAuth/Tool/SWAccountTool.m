//
//  SWAccountTool.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-23.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWAccountTool.h"
#import "SWAccount.h"

#define  SWAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account1.profile"]

@implementation SWAccountTool
+ (void)saveAccount:(SWAccount *)account
{
    NSDate *now = [NSDate date];
    account.deadline = [now dateByAddingTimeInterval:account.expires_in ];
   [NSKeyedArchiver archiveRootObject:account toFile:SWAccountPath];
}

+ (SWAccount *)getAccount
{
    NSDate *now = [NSDate date];
    SWAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:SWAccountPath];
    NSLog(@"%@",account.deadline);
    if([now compare:account.deadline] == NSOrderedAscending) {
        return  account;
        NSLog(@"%@",account);
      }else{
        return nil;
        }
}

@end

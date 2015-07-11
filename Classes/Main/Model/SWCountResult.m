//
//  SWCountResult.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWCountResult.h"

@implementation SWCountResult

-(int)messageUnreadCount
{
    return self.mention_cmt + self.mention_status + self.cmt +self.dm;
}

-(int)totalUnreadCount
{
    return  [self messageUnreadCount] + self.status + self.follower;
}
@end

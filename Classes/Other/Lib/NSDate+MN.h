//
//  NSDate+MN.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-4.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MN)
-(BOOL)isToday;
-(BOOL)isYesterday;
-(BOOL)isThisYear;

- (NSDateComponents *)diffenceWithNow;
@end

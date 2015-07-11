//
//  SWStatus.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-27.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWStatus.h"
#import "NSDate+MN.h"
#import "MJExtension.h"
#import "SWPhoto.h"

@implementation SWStatus

- (NSDictionary *)objectClassInArray
{
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[SWPhoto class] forKey:@"pic_urls"];
    return dict;
}

-(NSString *)created_at
{
    //1.获得微博的发送时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEE MMM dd hh:mm:ss Z yyyy";

#warning  真机调试下，必须加上这段
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];  // 中国的时间是 zh_CN
    NSDate *createdDate = [formatter dateFromString:_created_at];
    
    // 2. 判断微博发送时间和现在时间 的差距
        if (createdDate.isToday) { // 今天
            if (createdDate.diffenceWithNow.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时前", createdDate.diffenceWithNow.hour];
            } else if (createdDate.diffenceWithNow.minute >= 1) {
                return [NSString stringWithFormat:@"%ld分钟前", createdDate.diffenceWithNow.minute];
            } else {
                NSLog(@"-----zai");
                return @"刚刚";
            }
        } else if (createdDate.isYesterday) { // 昨天
            formatter.dateFormat = @"昨天 HH:mm";
            return [formatter stringFromDate:createdDate];
        } else if (createdDate.isThisYear) { // 今年(至少是前天)
            formatter.dateFormat = @"MM-dd HH:mm";
            return [formatter stringFromDate:createdDate];
        } else { // 非今年
            formatter.dateFormat = @"yyyy-MM-dd HH:mm";
            return [formatter stringFromDate:createdDate];
        }
       
}



- (void)setSource:(NSString *)source
{
    int loc = [source rangeOfString:@">"].location + 1;
    int length = [source rangeOfString:@"</"].location - loc;
    source = [source substringWithRange:NSMakeRange(loc, length)];
    
    _source = [NSString stringWithFormat:@"来自%@", source];
}

@end

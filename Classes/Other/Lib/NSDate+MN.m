//
//  NSDate+MN.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-4.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "NSDate+MN.h"

@implementation NSDate (MN)

-(BOOL)isToday
{
    //获得日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ;
    //获得当前时间的年月日
    NSDateComponents *nowComponents = [calendar components:unit fromDate:[NSDate date]];
    //多的创建时的年月日
    NSDateComponents *createComponents = [calendar components:unit fromDate:self];

    return
    (nowComponents.year == createComponents.year)&&
    (nowComponents.month ==createComponents.month)&&
    (nowComponents.day == createComponents.day);
}



-(BOOL)isYesterday
{
    NSDate *nowDate = [[NSDate date] dateWithYesday];
    NSDate *selfDate = [self dateWithYesday];
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay;
    
    NSDateComponents *nowComponents = [calendar components:unit fromDate: selfDate toDate:nowDate options:0];
    return nowComponents.day == 1;
}

-(NSDate *)dateWithYesday
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *string = [formatter stringFromDate:self];
    
    NSDate *date = [formatter dateFromString:string];
    return date;
}



-(BOOL)isThisYear
{

    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    NSDateComponents *nowComponents = [calendar components:unit fromDate:[NSDate date]];
    
    NSDateComponents *createComponents = [calendar components:unit fromDate:self];
    
    return  nowComponents.year == createComponents.year;
    
}

- (NSDateComponents *)diffenceWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}
@end

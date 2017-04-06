//
//  TimeUtils.m
//  YBPickerView
//
//  Created by 一波 on 2017/4/6.
//  Copyright © 2017年 一波. All rights reserved.
//

#import "TimeUtils.h"

@implementation TimeUtils
+(NSInteger) getTimestampNow{
    NSDate *date = [NSDate date];
    return [date timeIntervalSince1970];
}


+(NSInteger) getTimestampOfTodayStart{
    NSDate *date = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components: NSUIntegerMax fromDate: date];
    [components setHour: 0];
    [components setMinute: 0];
    [components setSecond: 0];
    
    NSDate *newDate = [gregorian dateFromComponents: components];
    return [newDate timeIntervalSince1970];
}


+(NSString*) getDateStringOfTime:(NSInteger)timestamp{
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:date];
}

+(NSString *) getDateChineseStringOfTime:(NSInteger)timestamp{
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    return [dateFormatter stringFromDate:date];
}

+(NSString *) get24hourStringOfTime:(NSInteger)timestamp{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)getWeekChineseStringFordate:(NSInteger)timestamp{
    NSArray *weekday = @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:date];
    NSString *weekStr = [weekday objectAtIndex:components.weekday - 1];
    return weekStr;
}
@end

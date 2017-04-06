/*******************************************************************************
* Copyright (C) 2016 Hangzhou Jiaheng Health Technology Co., Ltd.
* All rights reserved.
*  
* This file is part of Jia Heng GYM Project
*  
* Jia Heng GYM Project can not be copied and/or distributed without the express
* permission of Hangzhou Jiaheng Health Technology Co., Ltd.
* 
* www.jiahenghealth.com
*******************************************************************************/
//
//  TimeUtils.m
//  DayDataModule
//
//  Created by Cuble Chen on 16/8/9.
//

#import <Foundation/Foundation.h>

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

+(NSInteger) getTimestampOfWeekStart{
    NSDate *date = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components: NSUIntegerMax fromDate: date];
    NSInteger dayofweek = [components weekday];
    [components setHour: 0];
    [components setMinute: 0];
    [components setSecond: 0];
    [components setDay:[components day] - (dayofweek - 1)];
    
    NSDate *newDate = [gregorian dateFromComponents: components];
    return [newDate timeIntervalSince1970];
}

+(NSInteger) getTimestampOfMonthStart{
    NSDate *date = [NSDate date];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *components = [gregorian components: NSUIntegerMax fromDate: date];
    [components setHour: 0];
    [components setMinute: 0];
    [components setSecond: 0];
    [components setDay:1];
    
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


+ (NSInteger)getTimestampOfNextMonthStart{
    NSInteger monthStart = [self getTimestampOfMonthStart];
    NSDate *monthStartDate = [NSDate dateWithTimeIntervalSince1970:monthStart];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:NSUIntegerMax fromDate:monthStartDate];
    [components setMonth:([components month] + 1)];
    NSDate *nextMonthStartDate = [cal dateFromComponents:components];
    
    return [nextMonthStartDate timeIntervalSince1970];
}

+ (NSInteger)getTimestampOfNextMonthEnd{
    NSInteger monthStart = [self getTimestampOfMonthStart];
    NSDate *monthStartDate = [NSDate dateWithTimeIntervalSince1970:monthStart];
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
     NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday ;
    NSDateComponents *components = [cal components:unitFlags fromDate:monthStartDate];
    [components setMonth:([components month] + 2)];
    NSDate *monthStartDateAfterNextMonth = [cal dateFromComponents:components];
    NSInteger nextMonthEnd = [monthStartDateAfterNextMonth timeIntervalSince1970] - 1;
    return nextMonthEnd;
}


+ (NSInteger)getTheSameTimeFromeSelectTime:(NSInteger )selectTime{
    
    NSDate *selecDate = [NSDate dateWithTimeIntervalSince1970:selectTime];
    NSDate *curenDate = [NSDate date];
    
    NSCalendar *selecCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendar *curenCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *selecComps = [[NSDateComponents alloc] init];
    NSDateComponents *curenComps = [[NSDateComponents alloc] init];
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    
    selecComps = [selecCalendar components:NSUIntegerMax fromDate:selecDate];
    curenComps = [curenCalendar components:NSUIntegerMax fromDate:curenDate];
    //设置选择日期对应的现在的某个点
    [resultComps setYear:[selecComps year]];
    [resultComps setMonth:[selecComps month]];
    [resultComps setDay:[selecComps day]];
    [resultComps setHour:[curenComps hour]];
    [resultComps setMinute:[curenComps minute]];
    //    [resultComps setSecond:[curenComps second]];
    
    return [[resultCalendar dateFromComponents:resultComps] timeIntervalSince1970];
}

@end

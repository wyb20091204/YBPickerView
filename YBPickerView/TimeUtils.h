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
//  TimeUtils.h
//  DayDataModule
//
//  Created by Cuble Chen on 16/8/9.
//

#ifndef TimeUtils_h
#define TimeUtils_h

@interface TimeUtils : NSObject
+ (NSInteger) getTimestampNow;
+ (NSInteger) getTimestampOfTodayStart;
+ (NSInteger) getTimestampOfWeekStart;
+ (NSInteger) getTimestampOfNextMonthStart;
+ (NSInteger) getTimestampOfNextMonthEnd;
+ (NSInteger) getTimestampOfMonthStart;

+(NSString *) getDateStringOfTime:(NSInteger)timestamp;
+(NSString *) get24hourStringOfTime:(NSInteger)timestamp;
+(NSString *) getDateChineseStringOfTime:(NSInteger)timestamp;
+(NSString *) getWeekChineseStringFordate:(NSInteger)timestamp;
+(NSInteger)  getTheSameTimeFromeSelectTime:(NSInteger )selectTime;

@end

#endif /* TimeUtils_h */

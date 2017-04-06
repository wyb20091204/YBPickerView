//
//  TimeUtils.h
//  YBPickerView
//
//  Created by 一波 on 2017/4/6.
//  Copyright © 2017年 一波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtils : NSObject

+ (NSInteger) getTimestampNow;
+ (NSInteger) getTimestampOfTodayStart;

+(NSString *) getDateStringOfTime:(NSInteger)timestamp;
+(NSString *) get24hourStringOfTime:(NSInteger)timestamp;
+(NSString *) getDateChineseStringOfTime:(NSInteger)timestamp;
+(NSString *) getWeekChineseStringFordate:(NSInteger)timestamp;
@end

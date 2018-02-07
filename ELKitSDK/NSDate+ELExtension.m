//
//  NSDate+ELExtension.m
//  YLSDKProduct
//
//  Created by ElaineYin on 2018/2/1.
//  Copyright © 2018年 yin linlin. All rights reserved.
//

#import "NSDate+ELExtension.h"

#ifndef ELCalendar
#define ELCalendar [NSCalendar sharedInstance]
#endif


#ifndef ELDefaultDateFormatter
#define ELDefaultDateFormatter [NSDateFormatter el_defaultFormatter]
#endif

#ifndef ELDateFormatter
#define ELDateFormatter(format) [NSDateFormatter el_dateFormatter:format]
#endif


#pragma mark - NSDateFormatter

@implementation NSDateFormatter (ELExtension)

static NSDateFormatter * formatter = nil;
+(nullable NSDateFormatter *)sharedInstance {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (!formatter) {
            formatter = [[self.class alloc] init];
            formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        }
    });
    return formatter;
}
+(nullable NSDateFormatter *)el_dateFormatter:(nonnull NSString *)formatter {
    if (!(formatter && formatter.length > 0)) {return nil;}
    NSDateFormatter *dateFormatter = [self sharedInstance];
    dateFormatter.dateFormat = formatter;
    return dateFormatter;
}

+(nullable NSDateFormatter *)el_defaultFormatter {return [self el_dateFormatter:@"yyyy-MM-dd HH:mm:ss"];}

@end




#pragma mark - NSCalendar单例
@implementation NSCalendar (ELExtension)

static NSCalendar * calendar = nil;
+(NSCalendar *)sharedInstance {
    static dispatch_once_t once;
    dispatch_once(&once, ^{if (!calendar) {
        calendar = [self.class currentCalendar];
    }});
    return calendar;
}

@end

@implementation NSDate (ELExtension)

+(nullable instancetype)el_dateFromString:(nonnull NSString *)dateStr format:(nonnull NSString *)format {
    return [ELDateFormatter(format) dateFromString:dateStr];
}
+(nullable NSDate*)el_dateWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = year;
    components.month = month;
    components.day = day;
    return [ELCalendar dateFromComponents:components];
}
- (NSInteger)el_year {
    return [self el_dateComponent:NSCalendarUnitYear].year;
}

- (NSInteger)el_month {
    return [self el_dateComponent:NSCalendarUnitMonth].month;
}

- (NSInteger)el_day {
    return [self el_dateComponent:NSCalendarUnitDay].day;
}

- (NSInteger)el_hour {
    return [self el_dateComponent:NSCalendarUnitHour].hour;
}

- (NSInteger)el_minute {
    return [self el_dateComponent:NSCalendarUnitMinute].minute;
}

- (NSInteger)el_second {
    return [self el_dateComponent:NSCalendarUnitSecond].second;
}



-(NSDateComponents *)el_dateComponent:(NSCalendarUnit)unitFlags {
    return [ELCalendar components:unitFlags fromDate:self];
}

@end

@implementation NSDate (ELCalculate)

#pragma mark - **********获取新日期**********
-(NSDate *)el_dateByYears:(NSInteger)years {
    NSDateComponents * component = [[NSDateComponents alloc] init];
    component.year = years;
    return [ELCalendar dateByAddingComponents:component toDate:self options:0];
}
-(NSDate *)el_dateByMonths:(NSInteger)months {
    NSDateComponents * component = [[NSDateComponents alloc] init];
    component.month = months;
    return [ELCalendar dateByAddingComponents:component toDate:self options:0];
}
-(NSDate *)el_dateByWeeks:(NSInteger)weeks {
    NSDateComponents * component = [[NSDateComponents alloc] init];
    component.weekOfYear = weeks;
    return [ELCalendar dateByAddingComponents:component toDate:self options:0];
}
-(NSDate *)el_dateByDays:(NSInteger)days {
    NSDateComponents * component = [[NSDateComponents alloc] init];
    component.day = days;
    return [ELCalendar dateByAddingComponents:component toDate:self options:0];
}
-(NSDate *)el_dateByHours:(NSInteger)hours {
    NSDateComponents * component = [[NSDateComponents alloc] init];
    component.hour = hours;
    return [ELCalendar dateByAddingComponents:component toDate:self options:0];
}
-(NSDate *)el_dateByMinute:(NSInteger)minutes {
    NSDateComponents * component = [[NSDateComponents alloc] init];
    component.minute = minutes;
    return [ELCalendar dateByAddingComponents:component toDate:self options:0];
}
-(NSDate *)el_dateBySecond:(NSInteger)seconds {
    NSDateComponents * component = [[NSDateComponents alloc] init];
    component.second = seconds;
    return [ELCalendar dateByAddingComponents:component toDate:self options:0];
}

#pragma mark - **********获取日期差值**********
-(NSInteger)el_yearsByDate:(NSDate *)date {
    if (!date) {return NSIntegerMin;}
    return [ELCalendar components:NSCalendarUnitYear fromDate:date toDate:self options:0].year;
}
-(NSInteger)el_monthsByDate:(NSDate *)date {
    if (!date) {return NSIntegerMin;}
    return [ELCalendar components:NSCalendarUnitMonth fromDate:date toDate:self options:0].month;
}
-(NSInteger)el_weeksByDate:(NSDate *)date {
    if (!date) {return NSIntegerMin;}
    return [ELCalendar components:NSCalendarUnitWeekOfYear fromDate:date toDate:self options:0].weekOfYear;
}
-(NSInteger)el_daysByDate:(NSDate *)date {
    if (!date) {return NSIntegerMin;}
    return [ELCalendar components:NSCalendarUnitDay fromDate:date toDate:self options:0].day;
}
-(NSInteger)el_hoursByDate:(NSDate *)date {
    if (!date) {return NSIntegerMin;}
    return [ELCalendar components:NSCalendarUnitHour fromDate:date toDate:self options:0].hour;
}
-(NSInteger)el_minutesByDate:(NSDate *)date {
    if (!date) {return NSIntegerMin;}
    return [ELCalendar components:NSCalendarUnitMinute fromDate:date toDate:self options:0].minute;
}
-(NSInteger)el_secondsByDate:(NSDate *)date {
    if (!date) {return NSIntegerMin;}
    return [ELCalendar components:NSCalendarUnitSecond fromDate:date toDate:self options:0].second;
}


@end


//
//  NSDate+ELExtension.m
//  YLSDKProduct
//
//  Created by yin linlin on 2018/2/1.
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

@implementation NSDateFormatter (PPExtension)

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


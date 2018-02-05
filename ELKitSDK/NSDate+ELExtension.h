//
//  NSDate+ELExtension.h
//  YLSDKProduct
//
//  Created by yin linlin on 2018/2/1.
//  Copyright © 2018年 yin linlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ELExtension)


#pragma mark - **********属性**********
@property(readonly) NSInteger el_year;           /*日期所在年份*/
@property(readonly) NSInteger el_month;          /*日期所在月份*/
@property(readonly) NSInteger el_day;            /*日*/
@property(readonly) NSInteger el_hour;           /*时*/
@property(readonly) NSInteger el_minute;         /*分*/
@property(readonly) NSInteger el_second;         /*秒*/

#pragma mark - **********初始化**********
/**
 *  @abstract           初始化方法(字符串)
 *
 *  @param dateStr      日期字符串
 *  @param format       日期样式
 *
 *  @return             NSDate对象
 */
+(nullable NSDate*)el_dateFromString:(nonnull NSString *)dateStr format:(nonnull NSString *)format;
/**
 *  @abstract           初始化方法(日历)
 *
 *  @param year         年
 *  @param month        月
 *  @param day          日
 *
 *  @return             NSDate对象
 */
+(nullable NSDate*)el_dateWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;

@end



#pragma mark - NSCalendar
@interface NSCalendar (ELExtension)
/**
 * 频繁调用[NSCalendar currentCalendar]会极大的消耗系资源，因此选择单例.
 */
+(nullable NSCalendar *)sharedInstance;/*singleton: [NSCalendar currentCalendar]*/

@end

#pragma mark - NSDateFormatter

@interface NSDateFormatter (ELExtension)
/**
 * 当NSString对象与NSDate对象之间频繁相互转化时，如果每次都初始化NSDateFormatter对象,
 * 系统开销会非常大，容易造成卡顿，因此选择单例.
 */
+(nullable NSDateFormatter *)el_defaultFormatter;/*yyyy-MM-dd HH:mm:ss*/
+(nullable NSDateFormatter *)el_dateFormatter:(nonnull NSString *)formatter;

@end


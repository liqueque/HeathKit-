//
//  NSDate+week.m
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.//

#import "NSDate+week.h"

@implementation NSDate (week)

- (NSString *)convertToStringWithWeek{
    NSDateComponents *component = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    NSInteger year = component.year;
    NSInteger month = component.month;
    NSInteger day = component.day;
    NSInteger weak = day/30 + 1;
    NSString *str = [NSString stringWithFormat:@"%ld年%ld月第%ld周",(long)year,(long)month,weak];
    return str;
}

@end

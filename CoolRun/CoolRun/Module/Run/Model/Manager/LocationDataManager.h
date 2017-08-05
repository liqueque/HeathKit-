//
//  LocationDataManager.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationDataManager : NSObject


/**
 *  全局管理器
 *
 *  @return
 */
+ (LocationDataManager *)shareManager;

/**
 *  插入位置循序
 *
 *  @param latitude   经度
 *  @param longtitude 纬度
 *  @param timestamp  时间
 *
 *  @return 位置
 */
- (Location*)addLoactionWithLatitude:(NSNumber*) latitude
                          longtitude:(NSNumber*) longtitude
                           timestamp:(NSDate*) timestamp;



@end

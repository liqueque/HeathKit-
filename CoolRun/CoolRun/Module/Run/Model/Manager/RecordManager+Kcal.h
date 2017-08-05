//
//  RecordManager+Kcal.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.//

#import "RecordManager.h"

@interface RecordManager (Kcal)

/**
 *  获取，每个月卡路里数据
 *
 *  @param month  月份
 *  @param year   年份
 *  @param weight 重量
 *
 *  @return
 */
- (NSArray*)getKcalDataWithMonth:(NSInteger) month
                           year:(NSInteger)year
                         weight:(float)weight;

@end

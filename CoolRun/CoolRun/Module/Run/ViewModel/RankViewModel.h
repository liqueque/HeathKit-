//
//  RankViewModel.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RankViewModel : NSObject

/**
 *  排名数据
 */
@property (nonatomic, copy ,readonly)NSArray *dataArray;

/**
 *  是否已经刷新完毕
 */
@property (nonatomic, strong ,readonly)NSNumber *haveRefresh;

/**
 *  网络失败
 */
@property (nonatomic, strong, readonly)NSNumber *fail;

/**
 *  获取排名信息
 *
 *  @param date 时间
 */
- (void)getRankDataWithDate:(NSString *)date;

/**
 *  获取更多排名信息
 *
 *  @param date 时间
 */
- (void)getMoreRankDataWithDate:(NSString *)date;

@end

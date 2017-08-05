//
//  HomeViewModel.m
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.


#import "HomeViewModel.h"
#import "LocationDataManager.h"

#define weight 60

@interface HomeViewModel()

/**
 *  记录管理
 */
@property (nonatomic, strong, readwrite) RecordManager* manager;

@property (nonatomic, strong, readwrite) LocationDataManager *locationDataManager;

/**
 *  总距离
 */
@property (nonatomic, assign, readwrite) float totalDistance;

/**
 *  总时间
 */
@property (nonatomic, assign, readwrite) int totaltime;

@end

@implementation HomeViewModel

- (instancetype)init {
    if ([super init]) {
        _manager = [RecordManager shareManager];
        _locationDataManager = [LocationDataManager shareManager];
    }
    return self;
}

- (void)merge {
    [_manager mergeTheTempData];
    
    [_manager deleteAllTempRecords];
}

- (NSString *)distanceLabelText {
    return [MathController stringifyDistance:self.totalDistance];
}

- (NSString *)countLabelText {
    return [NSString stringWithFormat:@"%ld",(long)[_manager runCount]];;
}

- (NSString *)speedLabelText {
    return [MathController stringifyAvgPaceFromDist:self.totalDistance overTime:self.totaltime];
}

- (NSString *)rankTimeLabelText {
    NSDate *date = [NSDate date];
    
    return [date convertToStringWithWeek];
}

- (NSString *)kcalText {
    return [MathController stringifyKcalFromDist:self.totalDistance withWeight:weight];
}

- (int)totaltime {
    return [_manager totalTime];
}

- (float)totalDistance {
    return [_manager totalDistance];
}




@end

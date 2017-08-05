//
//  SDKInitProcess.h
//  CoolRun
//
//  Created by 李雀 on 16/5/29.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>

@interface SDKInitProcess : NSObject

@property(nonatomic,strong)HKHealthStore* healthStore;

-(instancetype)initWithApplication:(UIApplication*)application andLaunchOption:(NSDictionary*) option;

@end

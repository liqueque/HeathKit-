//
//  Location.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Run;

NS_ASSUME_NONNULL_BEGIN



@interface Location : NSManagedObject


- (NSDictionary*)convertToDictionary;

- (NSArray*)convertFromDictionary:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END

#import "Location+CoreDataProperties.h"

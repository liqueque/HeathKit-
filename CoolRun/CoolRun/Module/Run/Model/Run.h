//
//  Run.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

NS_ASSUME_NONNULL_BEGIN


@interface Run : NSManagedObject

-(NSArray*)convertFromDict:(NSDictionary*)dictionary;

-(NSDictionary*)convertToDictionary;

@end

NS_ASSUME_NONNULL_END

#import "Run+CoreDataProperties.h"

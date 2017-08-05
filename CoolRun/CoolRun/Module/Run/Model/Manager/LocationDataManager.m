//
//  LocationDataManager.m
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import "LocationDataManager.h"

static LocationDataManager *manager = nil;

@implementation LocationDataManager

+ (LocationDataManager *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[LocationDataManager alloc] init];
        }
    });
    return manager;
}

- (Location*)addLoactionWithLatitude:(NSNumber *)latitude
                         longtitude:(NSNumber *)longtitude
                          timestamp:(NSDate *)timestamp{
    Location* location = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Location" inManagedObjectContext:[CoreDataManager shareManager].managedObjectContext];
    
    location.latitude = latitude;
    location.longtitude = longtitude;
    location.timestamp = timestamp;
    
    [[CoreDataManager shareManager] saveContext];
    
    return location;
}


@end

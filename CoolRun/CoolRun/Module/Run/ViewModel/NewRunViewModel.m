//
//  NewRunViewModel.m
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import "NewRunViewModel.h"
#import "RunningBoardViewModel.h"
#import "ResultViewModel.h"
#import "Location.h"
#import "LocationDataManager.h"
#import "RunningMapViewModel.h"

@interface NewRunViewModel()<AMapLocationManagerDelegate>{
    /**
     *  运动距离
     */
    float   _distance;

    /**
     *  暂停计数
     */
    int     _stopCount;
    
}

@property (nonatomic, strong, readwrite)NSNumber *runDataChange;

@property (nonatomic, strong, readwrite)NSNumber *isRunning;

@property (nonatomic, strong, readwrite)NSNumber *isValid;

@property (nonatomic, strong, readwrite)NSNumber *mapDataChange;



/**
 *  定位管理
 */
@property (nonatomic, strong) AMapLocationManager* locationManager;

/**
 *  运动位置数组
 */
@property (nonatomic, strong) NSMutableArray* locations;

/**
 *  运动管理
 */
@property(nonatomic,strong)CMMotionManager* motionManger;

@end

@implementation NewRunViewModel

- (instancetype)init {
    if (self = [super init]) {
        _distance       = 0.0;
        _stopCount      = 0;
        _currentRunData = [[RunningBoardViewModel alloc] init];
        _currentRunData.distance = @"";
        _currentRunData.duration = @"";
        _currentRunData.speed    = @"";
        _mapViewModel = [[RunningMapViewModel alloc] init];
    }
    return self;
}

- (void)beginRunning {
    NSOperationQueue* queue = [[NSOperationQueue alloc]init];
    
    
    if (self.motionManger.accelerometerAvailable) {
       [self.motionManger startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
           CGFloat y = accelerometerData.acceleration.y;
           CGFloat z = accelerometerData.acceleration.z;
           CGFloat x = accelerometerData.acceleration.x;
           if (fabs(x)>2 || fabs(y)>2 || fabs(z)>2) {
               _stopCount = 0;
               
               if(![self.isRunning boolValue]) self.isRunning = @YES;
           }else {
               _stopCount++;
               
               if (_stopCount >= 8) {
                   
                   if([self.isRunning boolValue]) self.isRunning = @NO;
               }
           }
       }];
    }else {
        NSLog(@"加速仪不可用");
    }
    
    [self.locationManager startUpdatingLocation];
    
    self.isRunning = @YES;
}

- (void)pauseRunning {
    [self.locationManager stopUpdatingLocation];
    self.isRunning = @NO;
}

- (void)resumeRunning {
    _stopCount = 0;
    [self.locationManager startUpdatingLocation];
    self.isRunning = @YES;
}

- (void)stopRunning {
    [self.locationManager stopUpdatingLocation];
    
    self.locationManager = nil;
    
    if (_distance/1000>0.01) {
        [self saveRun];
        self.isValid = @YES;
    }else {
        self.isValid = @NO;
    }
}

#pragma mark - private

-(void)saveRun{
    NSMutableArray *locationArray = [NSMutableArray array];
    
    
    for (CLLocation *location in self.locations) {
        Location* locationObject =  [[LocationDataManager shareManager]
                                     addLoactionWithLatitude:[NSNumber
                                                              numberWithDouble:location.coordinate.latitude] longtitude:[NSNumber numberWithDouble:location.coordinate.longitude] timestamp:location.timestamp];
        
        [locationArray addObject:locationObject];
        
    }
    
    Run* runObject =  [[RecordManager shareManager] addRunRecordWithDis:[NSNumber
                                                                         numberWithFloat:_distance]
                                                                withDur:[NSNumber
                                                                         numberWithInt:self.duration]
                                                               withTime:[NSDate date]
                                                          withLocations:[NSOrderedSet
                                                                         orderedSetWithArray:locationArray]];
    
    _resultViewModel = [[ResultViewModel alloc] initWithRunModel:runObject];
}


#pragma mark - AMapLocationManagerDelegate
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error {
    [_locationManager stopUpdatingLocation];
}
//并不是所有定位数据都是有效，需要对数据进行过滤，过滤的依据就是horizontalAccuracy和时间偏差
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location {
    if (location.horizontalAccuracy < 30) {
        NSDate *eventDate = location.timestamp;
        //计算定位结果与当前时间的偏差
        NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
        //偏差超过2秒就过滤
        if (fabs(howRecent) < 2.0 ) {
            if (self.locations.count > 0) {
                _distance += [location distanceFromLocation:self.locations.lastObject];
                CLLocationCoordinate2D coords[2];
                coords[0] = ((CLLocation *)self.locations.lastObject).coordinate;
                coords[1] = location.coordinate;
                
                MKCoordinateRegion region =
                MKCoordinateRegionMakeWithDistance(location.coordinate, 500, 500);
                MKPolyline *polyline =  [MKPolyline polylineWithCoordinates:coords count:2];
                
                _mapViewModel.region = region;
                _mapViewModel.polyline = polyline;
                
                self.mapDataChange = @YES;
            }
            
            [self.locations addObject:location];
        }
    }
}

#pragma mark - getter and setter定义一个定位管理器

- (AMapLocationManager *)locationManager{
    
    if (!_locationManager) {
        _locationManager = [[AMapLocationManager alloc] init];
        
        _locationManager.delegate = self;
        
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        
        //设置允许后台定位参数，保持不会被系统挂起
        [_locationManager setPausesLocationUpdatesAutomatically:NO];
        
        if([[[UIDevice currentDevice] systemVersion] floatValue]>9.0){
            [_locationManager setAllowsBackgroundLocationUpdates:YES];//iOS9(含)以上系统需设置
        }
        
    }
    return _locationManager;
}


-(NSMutableArray *)locations{
    if (!_locations) {
        _locations = [NSMutableArray array];
    }
    return _locations;
}

-(CMMotionManager *)motionManger{
    if (!_motionManger) {
        _motionManger = [[CMMotionManager alloc]init];
        _motionManger.accelerometerUpdateInterval = 1.0;
    }
    return _motionManger;
}

- (void)setDuration:(int)duration {
    _duration                = duration;
    _currentRunData.duration = [NSString stringWithFormat:@"%@",[MathController stringifySecondCount:_duration usingLongFormat:NO]];
    _currentRunData.distance = [NSString stringWithFormat:@"%.2f",_distance/1000];
    _currentRunData.speed    = [NSString stringWithFormat:@"%@",[MathController stringifyAvgPaceFromDist:_distance overTime:_duration]];
    self.runDataChange       = @YES;
}

@end

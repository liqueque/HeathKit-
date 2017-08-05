//
//  RunningMapViewModel.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunningMapViewModel : NSObject

@property(nonatomic, assign, readwrite)MKCoordinateRegion region;

@property(nonatomic, strong, readwrite)MKPolyline *polyline;

@end

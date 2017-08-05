//
//  ShareMapView.m
//  CoolRun
//
//  Created by 李雀 on 2016/9/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import "ShareMapView.h"

@implementation ShareMapView

+ (ShareMapView *)shareMapView {
    static ShareMapView *mapView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mapView = [[ShareMapView alloc] init];
    });
    return mapView;
}

@end

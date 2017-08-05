//
//  MultiColorPolyline.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.//

#import <MapKit/MapKit.h>

@interface MultiColorPolyline : MKPolyline

/**
 *  轨迹颜色
 */
@property(nonatomic,strong)UIColor* color;

@end

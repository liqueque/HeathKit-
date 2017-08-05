//
//  RunnungMapView.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.//

#import <UIKit/UIKit.h>

@class RunningMapViewModel;

@interface RunnungMapView : UIView

@property (nonatomic, strong, readwrite)RunningMapViewModel *viewModel;

/**
 *  显示地图
 */
- (void)showMapView;

@end

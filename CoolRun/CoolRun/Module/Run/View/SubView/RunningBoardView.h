//
//  RunningBoardView.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.//

#import <UIKit/UIKit.h>

@class RunningBoardViewModel;

@interface RunningBoardView : UIView

@property(nonatomic, assign, readwrite)BOOL readyRunning;

@property(nonatomic, strong, readwrite)RunningBoardViewModel *viewModel;

@end

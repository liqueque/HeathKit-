//
//  ResultViewController.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Run.h"


@class ResultViewModel;
/**
 *  跑步结果界面
 */
@interface ResultViewController : XDBaseViewController

@property (nonatomic, strong, readwrite)ResultViewModel *viewModel;

@end

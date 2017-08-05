//
//  DetailViewController.h
//  CoolRun
//
//  Created by 李雀 on 16/5/17.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewModel.h"

/**
 *  跑步记录详情页
 */
@interface DetailViewController : XDBaseViewController

@property (nonatomic, readwrite, strong)DetailViewModel *viewModel;

@end

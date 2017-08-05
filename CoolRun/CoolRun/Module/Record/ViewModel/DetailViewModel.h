//
//  DetailViewModel.h
//  CoolRun
//
//  Created by 李雀 on 2016/8/16.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailViewModel : NSObject

/**
 *  所有跑步记录viewModel
 */
@property (nonatomic, copy, readonly) NSArray *recordViewModels;

- (instancetype)initWithRunDatas:(NSArray *)runDatas;

@end

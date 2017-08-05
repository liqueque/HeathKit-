//
//  XDBaseViewController.m
//  CoolRun
//
//  Created by 李雀 on 2016/9/5.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import "XDBaseViewController.h"

@interface XDBaseViewController ()

@end

@implementation XDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
    
    [self KVOHandler];
}

- (void)KVOHandler{};

- (void)configureView{};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end

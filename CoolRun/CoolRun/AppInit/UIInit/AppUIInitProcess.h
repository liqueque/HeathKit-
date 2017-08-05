//
//  AppUIInitProcess.h
//  CoolRun
//
//  Created by 李雀 on 16/5/29.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JVFloatingDrawerSpringAnimator;

@interface AppUIInitProcess : NSObject

@property(nonatomic,strong)JVFloatingDrawerViewController* drawController;

@property (nonatomic, strong) JVFloatingDrawerSpringAnimator *drawerAnimator;

@property(nonatomic,strong)UIStoryboard* mainStroyboard;

-(instancetype)initWithApplication:(UIApplication*)application andLaunchOption:(NSDictionary*) option;

-(void)toggleLeftDrawer:(id)sender animated:(BOOL)animated;
@end

//
//  SettingViewModel.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingViewModel : NSObject

-(void)PostOldPwd:(NSString*)oldPwd
           newPwd:(NSString*)pwd
            withSuccessBlock:(ReturnValueBlock)successBlock
               failWithError:(ErrorCodeBlock)errorBlock
    failWithNetworkWithBlock:(FailureBlock)failBlock;

-(void)logout;
@end

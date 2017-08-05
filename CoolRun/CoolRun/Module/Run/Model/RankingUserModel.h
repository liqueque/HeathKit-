//
//  RankingUserModel.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.//

#import <Foundation/Foundation.h>

@interface RankingUserModel : NSObject

@property (nonatomic, copy) NSString *sum;

@property (nonatomic, copy) NSString *username;

- (NSArray *)convertFromDictionary: (NSDictionary *)dict;

@end

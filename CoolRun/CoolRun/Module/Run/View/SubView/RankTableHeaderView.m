//
//  RankTableHeaderView.m
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.//

#import "RankTableHeaderView.h"

@implementation RankTableHeaderView

-(instancetype)init{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"RankTableHeaderView" owner:self options:nil]firstObject];
    }
    return self;
}

+(CGFloat)heightOfRankTableHeaderView{
    return 140;
}

@end

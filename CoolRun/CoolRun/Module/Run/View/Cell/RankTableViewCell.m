//
//  RankTableViewCell.m
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import "RankTableViewCell.h"

@implementation RankTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showUIWithModel:(RankingUserModel *)model {
    _username.text = model.username;
    
    _rankLable.text = model.sum;
}

+(CGFloat)heigthOgCell{
    return 62;
}

@end

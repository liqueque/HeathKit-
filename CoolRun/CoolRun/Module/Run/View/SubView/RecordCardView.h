//
//  RecordCardView.h
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultViewModel.h"

@interface RecordCardView : UIView

@property (weak, nonatomic) IBOutlet UIView *mapBgView;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UILabel *kcalLabel;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *pageLabel;

@property (weak, nonatomic) IBOutlet UILabel *rankLabel;

@property (weak, nonatomic) IBOutlet UILabel *spendCountLabel;

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@property (nonatomic, strong, readwrite)ResultViewModel *viewModel;

@end

//
//  RunnungMapView.m
//  CoolRun
//
//  Created by 李雀 on 16/5/6.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import "RunnungMapView.h"
#import "RunningMapViewModel.h"

@interface RunnungMapView ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end


@implementation RunnungMapView

- (instancetype)init {
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"RunnungMapView" owner:self options:nil] lastObject];
        [_mapView setShowsUserLocation:YES];
        [_mapView setRegion:MKCoordinateRegionMakeWithDistance(_mapView.userLocation.coordinate, 500, 500)];
    }
    return self;
}

- (void)showMapView {
    self.transform= CGAffineTransformMakeScale(0.01, 0.01);
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.transform = CGAffineTransformIdentity;
        
        self.hidden = NO;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)hideMapView:(UIButton *)sender {
    self.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.transform= CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

#pragma mark - MKMapViewDelegate
//设置运动轨迹的相关属性
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay {
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolyline *polyLine = (MKPolyline *)overlay;
        MKPolylineRenderer *aRenderer = [[MKPolylineRenderer alloc] initWithPolyline:polyLine];
        aRenderer.strokeColor = UIColorFromRGB(0x43B5FE);
        aRenderer.lineWidth = 3;
        return aRenderer;
    }
    return nil;
}

- (void)setViewModel:(RunningMapViewModel *)viewModel {
    _viewModel = viewModel;
    if (viewModel.polyline) {
        [_mapView setRegion:viewModel.region];
        [_mapView addOverlay:viewModel.polyline];
    }
}

@end

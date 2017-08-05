//
//  RecordShowView.m
//  CoolRun
//
//  Created by 李雀 on 2016/8/3.
//  Copyright © 2016年 李雀. All rights reserved.
//

#import "RecordShowView.h"

@interface RecordShowView()

@property (nonatomic, strong, readwrite)CATextLayer* textLayer;

@property (nonatomic, strong, readwrite)CAShapeLayer *normalLayer;

@property (nonatomic, strong, readwrite)CAShapeLayer *specialLayer;

@end


@implementation RecordShowView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self drawBaseView];
    }
    return self;
}

- (void)drawBaseView {
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    
    CGFloat smallPathAlign = (W-40)/(5*7);
    CGFloat smallPathLineH = 4;
    UIBezierPath* smallPath = [UIBezierPath bezierPath];
    for (int i = 1; i<=35; i++) {
        [smallPath moveToPoint:CGPointMake(20+smallPathAlign*i, H-20)];
        [smallPath addLineToPoint:CGPointMake(20+smallPathAlign*i, H-20-smallPathLineH)];
    }
    CAShapeLayer* smallPathLayer = [CAShapeLayer layer];
    smallPathLayer.path = smallPath.CGPath;
    smallPathLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    smallPathLayer.lineWidth = 2;
    [self.layer addSublayer:smallPathLayer];
    
    
    
    UIBezierPath* frameworkPath = [UIBezierPath bezierPath];
    [frameworkPath moveToPoint:CGPointMake(20, 0)];
    [frameworkPath addLineToPoint:CGPointMake(20, H-20)];
    [frameworkPath moveToPoint:CGPointMake(20, H-20)];
    [frameworkPath addLineToPoint:CGPointMake(W-20, H-20)];

    CGFloat bigPathAlign = (W-40)/5;
    CGFloat bigPathLineH = 5;
    for (int i = 1; i<=4; i++) {
        [frameworkPath moveToPoint:CGPointMake(20+bigPathAlign*i, H-20)];
        [frameworkPath addLineToPoint:CGPointMake(20+bigPathAlign*i, H-20-bigPathLineH)];
    }
    
    [frameworkPath moveToPoint:CGPointMake(20, 20)];
    [frameworkPath addLineToPoint:CGPointMake(20+10, 20)];
    
    CAShapeLayer* frameworkLayer = [CAShapeLayer layer];
    frameworkLayer.path = frameworkPath.CGPath;
    frameworkLayer.strokeColor = [UIColor grayColor].CGColor;
    frameworkLayer.lineWidth = 2;
    [self.layer addSublayer:frameworkLayer];
    
    _textLayer = [CATextLayer layer];
    _textLayer.string = @"1200卡路里";
    _textLayer.fontSize = 12;
    _textLayer.bounds = CGRectMake(0, 0, 100, 100);
    _textLayer.foregroundColor = UIColorFromRGB(0x43B5FE).CGColor;
    _textLayer.contentsScale = [UIScreen mainScreen].scale;
    _textLayer.position = CGPointMake(20+10+55,60);
    [self.layer addSublayer:_textLayer];

}

/**
 *  绘画柱状图
 *
 *  @param values    数值数组
 *  @param lineColor 柱状图颜色
 *
 *  @return 柱状图layer
 */
-(CAShapeLayer *)drawRecordValue:(NSArray *)values lineColor:(UIColor *)lineColor{
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    
    CGFloat lineHight = H- 20 * 2;
    CGFloat lineWidth = W- 40;
    CGFloat aliginW = lineWidth/(5*7);
    UIBezierPath* recordPath = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    for (int i = 1; i<values.count; i++) {
        CGFloat recordH = [values[i] intValue]*lineHight/1200 > self.frame.size.height -20? self.frame.size.height - 20:[values[i] intValue]*lineHight/1200;
        
        [recordPath moveToPoint:CGPointMake(20+aliginW*i, H-20)];
        [recordPath addLineToPoint:CGPointMake(20+aliginW*i, H-20-recordH)];
    }
    layer.path = recordPath.CGPath;
    layer.strokeColor =  lineColor.CGColor;
    layer.lineWidth = 4;
    layer.lineCap = kCALineCapRound;
    
    //设置帧动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    animation.autoreverses = NO;
    animation.duration = 0.8;
    
    [layer addAnimation:animation forKey:nil];
    
    return layer;
}

/**
 *  走路+跑步卡路里数据
 *
 *  @param normalRecords
 */
- (void)setNormalRecords:(NSArray *)normalRecords {
    if (_normalLayer) {
        [_normalLayer removeFromSuperlayer];
    }
    _normalRecords = [normalRecords copy];
    _normalLayer = [self drawRecordValue:normalRecords lineColor:UIColorFromRGB(0x43B5FE)];
    [self.layer addSublayer:_normalLayer];
}

/**
 *  跑步卡路里数据
 *
 *  @param specialRecords
 */
- (void)setSpecialRecords:(NSArray *)specialRecords {
    if (_specialLayer) {
        [_specialLayer removeFromSuperlayer];
    }
    _specialRecords = [specialRecords copy];
    _specialLayer = [self drawRecordValue:specialRecords lineColor:UIColorFromRGB(0X2E38AD)];
    [self.layer addSublayer:_specialLayer];
}

- (void)setLimmitValue:(NSString *)limmitValue {
    _limmitValue = limmitValue;
    _textLayer.string = limmitValue;
}

@end

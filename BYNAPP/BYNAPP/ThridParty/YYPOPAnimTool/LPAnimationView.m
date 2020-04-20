
//
//  QWAlertView.m
//  AlertTest
//
//  Created by jonh on 2017/10/26.
//  Copyright © 2017年 jonh. All rights reserved.
//

#import "LPAnimationView.h"
///屏幕宽度
#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
///屏幕高度
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
#define KEYWINDOW     [[UIApplication sharedApplication] keyWindow]
#define ANIMATION_TIME 0.5
#define QWWEAKSELF __weak typeof(self) weakSelf = self;
@interface LPAnimationView ()
///遮罩层
@property (nonatomic, strong) UIView *maskLayer;
//保存弹出视图
@property (nonatomic, strong) UIView *contentView;
///弹出模式
@property (nonatomic, assign) QWAlertViewStyle alertStyle;
///动画前的位置
@property (nonatomic, assign) CGAffineTransform starTransForm;


@end


@implementation LPAnimationView


+ (LPAnimationView *)sharedMask{
    
    static LPAnimationView * alertView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!alertView) {
            alertView = [[LPAnimationView alloc] init];
        }
    });
    return alertView;
}


- (void)show:(UIView *)contentView withType:(QWAlertViewStyle)style{
    //判断是否赋于大小
    CGFloat contentViewHeight =  contentView.frame.size.height;
    CGFloat contentViewWidth  =  contentView.frame.size.width;
    if(contentViewHeight == 0.00||contentViewWidth == 0.00){
        return;
    }
    _contentView = contentView;
    _contentView.center = KEYWINDOW.center;
    _alertStyle = style;
    if (!_maskLayer) {
        [self addMaskLayer];
        // 根据弹出模式 添加动画
        switch (_alertStyle) {
            case QWAlertViewStyleAlert:
                _starTransForm = CGAffineTransformMakeScale(0.01, 0.01);
                break;
            case QWAlertViewStyleActiAlertLeft:
                _starTransForm = CGAffineTransformMakeTranslation(-SCREEN_W, 0);
                break;
            case QWAlertViewStyleActiAlertRight:
                _starTransForm = CGAffineTransformMakeTranslation(SCREEN_W, 0);
                break;
            case QWAlertViewStyleActionSheetTop:
                
                _starTransForm = CGAffineTransformMakeTranslation(0, -_contentView.frame.size.height);
                break;
            case QWAlertViewStyleActionSheetDown:
                
                _starTransForm = CGAffineTransformMakeTranslation(0, SCREEN_H);
                break;
            default:
                break;
        }
        [self alertAnimatedPrensent];
        
    }else {
    
        _maskLayer = nil;
        
    }
    
    
}
//  自定义的alert或actionSheet内容view必须初始化大小
- (void)show:(UIView *)contentView withType:(QWAlertViewStyle)style animationFinish:(showBlock)show dismissHandle:(dismissBlock)dismiss {
    //保存 回调
    if (show) {
        _showBlock = [show copy];
    }
    if(dismiss){
        _dismissBlock = [dismiss copy];
    }
    [self show:contentView withType:style];
    
}


///添加遮罩
- (void)addMaskLayer{
    
    _maskLayer = [UIView new];
    [_maskLayer setFrame:[[UIScreen mainScreen] bounds]];
    [_maskLayer setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.30]];
    [KEYWINDOW  addSubview:_maskLayer];
    
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [_maskLayer addGestureRecognizer:tapGesture];

    
}



- (void)dismiss{
    //设置初始值
    // 移除遮罩
    if (_maskLayer) {
        
        [_maskLayer removeFromSuperview];
        _maskLayer = nil;
      
    }
    //移除弹出框
    [self alertAnimatedOut];
    //回调动画完成回调
    if (_dismissBlock) {
        
        _dismissBlock();
    }
    
}


- (void)alertAnimatedPrensent{
    
    _contentView.transform = _starTransForm;
    [KEYWINDOW addSubview:_contentView];
    QWWEAKSELF
    [UIView animateWithDuration:ANIMATION_TIME delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        weakSelf.contentView.transform = CGAffineTransformIdentity;
        KEYWINDOW.userInteractionEnabled = NO;
    } completion:^(BOOL finished) {
        KEYWINDOW.userInteractionEnabled = YES;
        if (weakSelf.showBlock) {
            //动画完成后回调
            weakSelf.showBlock();
        }
    }];
}

- (void)addCoreAnimation{
    
    CATransition *animation = [CATransition animation];
    animation.type = @"rippleEffect";
    animation.duration = ANIMATION_TIME;
    [_contentView.layer addAnimation:animation forKey:@""];
    
}

- (void)alertAnimatedOut{
    
    QWWEAKSELF
    [UIView animateWithDuration:ANIMATION_TIME animations:^{
        weakSelf.contentView.transform = weakSelf.starTransForm;
        KEYWINDOW.userInteractionEnabled = NO;
    } completion:^(BOOL finished) {
        KEYWINDOW.userInteractionEnabled = YES;
        [weakSelf.contentView removeFromSuperview];
        weakSelf.contentView = nil;
    }];
    
}
@end

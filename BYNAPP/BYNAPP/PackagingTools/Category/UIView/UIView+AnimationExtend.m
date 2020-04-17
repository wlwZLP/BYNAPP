//
//  UIView+AnimationExtend.m
//  headlineNews
//
//  Created by dengweihao on 2017/11/20.
//  Copyright © 2017年 vcyber. All rights reserved.
//

#import "UIView+AnimationExtend.h"

@implementation UIView (AnimationExtend)


- (CABasicAnimation *)rotationAnimation {
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = @0;
    rotationAnimation.toValue = @(M_PI * 2.0);
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    return rotationAnimation;
}

- (void)stopRotationAnimation {
    
    if ([self.layer animationForKey:@"rotationAnimation"]) {
        
        [self.layer removeAnimationForKey:@"rotationAnimation"];
    }
}


#pragma mark 重写set 和 get 方法

- (void)setZLP_height:(CGFloat)ZLP_height
{
    CGRect rect = self.frame;
    rect.size.height = ZLP_height;
    self.frame = rect;
}

- (CGFloat)ZLP_height
{
    return self.frame.size.height;
}

- (CGFloat)ZLP_width
{
    return self.frame.size.width;
}
- (void)setZLP_width:(CGFloat)ZLP_width
{
    CGRect rect = self.frame;
    rect.size.width = ZLP_width;
    self.frame = rect;
}

- (CGFloat)ZLP_x
{
    return self.frame.origin.x;
    
}

- (void)setZLP_x:(CGFloat)ZLP_x
{
    CGRect rect = self.frame;
    rect.origin.x = ZLP_x;
    self.frame = rect;
}

- (void)setZLP_y:(CGFloat)ZLP_y
{
    CGRect rect = self.frame;
    rect.origin.y = ZLP_y;
    self.frame = rect;
}

- (CGFloat)ZLP_y
{
    
    return self.frame.origin.y;
}

- (void)setZLP_centerX:(CGFloat)ZLP_centerX
{
    CGPoint center = self.center;
    center.x = ZLP_centerX;
    self.center = center;
}

- (CGFloat)ZLP_centerX
{
    return self.center.x;
}

- (void)setZLP_centerY:(CGFloat)ZLP_centerY
{
    CGPoint center = self.center;
    center.y = ZLP_centerY;
    self.center = center;
}

- (CGFloat)ZLP_centerY
{
    return self.center.y;
    
}

/**
*  给UiView添加点击方法
*/
-(void)addViewTarget:(id _Nullable )target action:(nonnull SEL)action{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                      initWithTarget:target action:action];
       
    self.userInteractionEnabled = YES;
       
    [self addGestureRecognizer:tap];
    
}



@end

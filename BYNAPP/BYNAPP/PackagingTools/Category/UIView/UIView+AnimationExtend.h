//
//  UIView+AnimationExtend.h
//  headlineNews
//
//  Created by dengweihao on 2017/11/20.
//  Copyright © 2017年 vcyber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AnimationExtend)

- (CABasicAnimation *)rotationAnimation;

- (void)stopRotationAnimation;

/**
 自定义获取uiview 的相关属性
 */
@property CGFloat ZLP_width;
@property CGFloat ZLP_height;
@property CGFloat ZLP_x;
@property CGFloat ZLP_y;
@property CGFloat ZLP_centerX;
@property CGFloat ZLP_centerY;

@end

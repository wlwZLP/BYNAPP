//
//  UnitTool.m
//  SweepCard
//
//  Created by 朱陆平 on 2018/2/8.
//  Copyright © 2018年 朱陆平. All rights reserved.
//

#import "YYTools.h"

#import "AppDelegate.h"
#import "UIColor+Hex.h"


@implementation YYTools


//封装一个设置圆角和边框
+(void)ChangeView:(UIView *)view RadiusSize:(int)radiussize BorderColor:(UIColor*)bordercolor{
    
    view.layer.borderWidth = 1;//设置边框的宽度，当然可以不要
    view.layer.borderColor = [bordercolor CGColor];//设置边框的颜色
    view.layer.cornerRadius = radiussize;//设置那个圆角的有多圆
    view.layer.masksToBounds = YES;//设为NO去试试
    
}



//封装一个渐变色渐变的过程

+(CAGradientLayer *)SetGradLayerView:(UIView *)view FromColor:(NSString *)fromColor ToColor:(NSString *)toColor{
    
    //    CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:fromColor].CGColor,(__bridge id)[UIColor colorWithHexString:toColor].CGColor];
    //  设置渐变颜色方向，左上点为(0,0), 左下点为(1,0),右上点为(0,1),右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(1, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    return gradientLayer;
    
}







@end

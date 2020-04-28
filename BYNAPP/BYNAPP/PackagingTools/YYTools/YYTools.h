//
//  UnitTool.h
//  SweepCard
//
//  Created by 朱陆平 on 2018/2/8.
//  Copyright © 2018年 朱陆平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYTools : NSObject


//封装一个设置圆角和边框
+(void)ChangeView:(UIView *)view RadiusSize:(int)radiussize BorderColor:(UIColor*)bordercolor;


+(void)SetView:(UIView *)view RadiusSize:(int)radiussize BorderColor:(UIColor*)bordercolor;

//封装一个渐变色渐变的过程
+ (CAGradientLayer *)SetGradLayerView:(UIView *)view FromColor:(NSString *)fromColor ToColor:(NSString *)toColor;

//封装减法的公共方法
+(NSString *)YYSetAllMaxSting:(NSString *)maxstring MinString:(NSString *)minsting;










@end

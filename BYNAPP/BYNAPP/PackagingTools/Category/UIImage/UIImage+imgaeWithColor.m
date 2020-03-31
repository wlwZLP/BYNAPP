//
//  UIImage+imgaeWithColor.m
//  5-个人详情页
//
//  Created by gouzi on 2017/5/21.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "UIImage+imgaeWithColor.h"

@implementation UIImage (imgaeWithColor)


+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 开启上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(ref, color.CGColor);
    // 渲染上下文
    CGContextFillRect(ref, rect);
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}


+ (UIImage *)ZLPCreateimageWithCoupon{
    
    CGRect frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:frame];
    
    UIGraphicsBeginImageContext(imgview.frame.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGContextScaleCTM(context, frame.size.width, frame.size.height);
    
    CGFloat colors[] = {
        
        255.0/255.0, 112.0/255.0, 48.0/255.0, 1.0,
        
        255.0/255.0, 35.0/255.0, 35.0/255.0, 1.0,
        
    };
    
    CGGradientRef backGradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    
    CGColorSpaceRelease(rgb);
    
    CGContextDrawLinearGradient(context, backGradient, CGPointMake(1, 0), CGPointMake(0, 0), kCGGradientDrawsBeforeStartLocation);
    //导航栏背景图
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}



+ (UIImage *)SmallCreateimageWithCoupon{
    
    CGRect frame = CGRectMake(0, 0, 30, 2);
    
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:frame];
    
    UIGraphicsBeginImageContext(imgview.frame.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGContextScaleCTM(context, frame.size.width, frame.size.height);
    
    CGFloat colors[] = {
        
        255.0/255.0, 112.0/255.0, 48.0/255.0, 1.0,
        
        255.0/255.0, 35.0/255.0, 35.0/255.0, 1.0,
        
    };
    
    CGGradientRef backGradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    
    CGColorSpaceRelease(rgb);
    
    CGContextDrawLinearGradient(context, backGradient, CGPointMake(1, 0), CGPointMake(0, 0), kCGGradientDrawsBeforeStartLocation);
    //导航栏背景图
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}


+ (UIImage *)CreateDetailsBgimageWithCoupon{
    
    CGRect frame = CGRectMake(0, 0, 100, 75);
    
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:frame];
    
    UIGraphicsBeginImageContext(imgview.frame.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGContextScaleCTM(context, frame.size.width, frame.size.height);
    
    CGFloat colors[] = {
         255.0/255.0, 120.0/255.0, 35.0/255.0, 1.0,
         255.0/255.0, 211.0/255.0, 44.0/255.0, 1.0,
    };
    
    CGGradientRef backGradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    
    CGColorSpaceRelease(rgb);
    
    CGContextDrawLinearGradient(context, backGradient, CGPointMake(1, 0), CGPointMake(0, 0), kCGGradientDrawsBeforeStartLocation);
    //导航栏背景图
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}


+ (UIImage *)MyColor:(UIColor *)color{
    
    if (!color ) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, 30, 2);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}


@end

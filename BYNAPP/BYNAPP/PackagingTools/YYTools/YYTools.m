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

//封装一个设置圆角和边框
+(void)SetView:(UIView *)view RadiusSize:(int)radiussize BorderColor:(UIColor*)bordercolor{
    
    view.layer.borderWidth = 0.5;//设置边框的宽度，当然可以不要
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


//封装减法的公共方法
#pragma mark ----两个数相加-----------
+(NSString *)calculateByadding:(NSString *)number1 secondNumber:(NSString *)number2
{
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:number1];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:number2];
    NSDecimalNumber *addingNum = [num1 decimalNumberByAdding:num2];
    return [addingNum stringValue];
}

#pragma mark ----两个数相减------------ number1 - number2
+(NSString *)YYSetAllMaxSting:(NSString *)maxstring MinString:(NSString *)minsting{
    if (maxstring.length == 0) {
        maxstring = @"0.00";
    }
    
    if (minsting.length == 0) {
        minsting = @"0.00";
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:maxstring];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:minsting];
    NSDecimalNumber *addingNum = [num1 decimalNumberBySubtracting:num2];
    return [addingNum stringValue];
}

#pragma mark ----两个数相乘------------
//+(NSString *)calculateByMultiplying:(NSString *)number1 secondNumber:(NSString *)number2
//{
//    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:number1];
//    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:number2];
//    NSDecimalNumber *multiplyingNum = [num1 decimalNumberByMultiplyingBy:num2];
//    return [multiplyingNum stringValue];
//
//}

#pragma mark ----两个数相除------------
//+ (NSString *)calculateByDividingNumber:(NSString *)number1 secondNumber:(NSString *)number2
//{
//    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:number1];
//    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:number2];
//    NSDecimalNumber *dividingNum = [num1 decimalNumberByDividingBy:num2];
//    return [dividingNum stringValue];
//
//}

#pragma mark ----四舍五入------------
//+ (NSString *)calculateTargetNumber:(NSString *)targetNumber ByRounding:(NSUInteger)scale
//{
//    NSDecimalNumberHandler * handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:NSRoundPlain scale:scale raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
//    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:targetNumber];
//    NSDecimalNumber *roundingNum = [num1 decimalNumberByRoundingAccordingToBehavior:handler];
//    return [roundingNum stringValue];
//}


#pragma mark ----是否相等------------
//+ (BOOL)calculateIsEqualNumber:(NSString *)number1 secondNumber:(NSString *)number2
//{
//    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:number1];
//    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:number2];
//    NSComparisonResult result = [num1 compare:num2];
//    if (result == NSOrderedSame) {
//        return YES;
//    }
//    return NO;
//}

#pragma mark ----是否大于------------
//+ (BOOL)calculateNumber: (NSString *)number1 IsGreaterThan:(NSString *)number2
//{
//    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:number1];
//    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:number2];
//    NSComparisonResult result = [num1 compare:num2];
//    if (result == NSOrderedDescending) {
//        return YES;
//    }
//    return NO;
//
//}

#pragma mark ----是否小于------------
//+ (BOOL)calculateNumber:(NSString *)number1  IsLessThan:(NSString *)number2
//{
//    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:number1];
//    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:number2];
//    NSComparisonResult result = [num1 compare:num2];
//    if (result == NSOrderedAscending) {
//        return YES;
//    }
//    return NO;
//
//}



#pragma mark ---------单纯保留小数位数----------
//+(NSString *)calculateRetainedDecimalNumber:(NSString *)targetNumber ByRonding:(short)power
//{
//    NSDecimalNumber * balanceNumber = [[NSDecimalNumber alloc]initWithString:targetNumber];
//    NSDecimalNumberHandler * hander = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:4 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
//    NSNumber *changeNumber = [balanceNumber decimalNumberByRoundingAccordingToBehavior:hander];
//
//    return [changeNumber stringValue];
//
//}






@end

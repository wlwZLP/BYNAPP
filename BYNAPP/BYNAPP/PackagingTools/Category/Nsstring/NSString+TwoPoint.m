//
//  NSString+TwoPoint.m
//  Coupon
//
//  Created by apple on 2019/9/17.
//  Copyright © 2019 zhulp. All rights reserved.
//

#import "NSString+TwoPoint.h"

@implementation NSString (TwoPoint)

+(NSString*)GetTwoPoint:(NSString *)tempString{
    
    //先判断第一位是不是 . ,是 . 补0
    if ([tempString hasPrefix:@"."]) {
        tempString = [NSString stringWithFormat:@"0%@",tempString];
    }
    //计算截取的长度
    NSUInteger endLength = tempString.length;
    //判断字符串是否包含 .
    if ([tempString containsString:@"."])
    {
        //取得 . 的位置
        NSRange pointRange = [tempString rangeOfString:@"."];
        //        NSLog(@"%lu",pointRange.location);
        //判断 . 后面有几位
        NSUInteger f = tempString.length - 1 - pointRange.location;
        //如果大于2位就截取字符串保留两位,如果小于两位,直接截取
        if (f > 2)
        {
            endLength = pointRange.location + 3;
        }
        
    }
    //先将tempString转换成char型数组
    NSUInteger start = 0;
    const char *tempChar = [tempString UTF8String];
    //遍历,去除取得第一位不是0的位置
    for (int i = 0; i < tempString.length; i++) {
        if (tempChar[i] == '0') {
            start++;
        }else {
            break;
        }
    }
    //如果第一个字母为 . start后退一位
    if (tempChar[start] == '.')
    {
        start--;
    }
    //根据最终的开始位置,计算长度,并截取
    NSRange range = {start,endLength-start};
    
    tempString = [tempString substringWithRange:range];
    
    return tempString;
    
}



+(NSString*)RemoveTwoPoint:(NSString *)tempString{
    
    NSString * testNumber = tempString;
    
    NSString * outNumber = [NSString stringWithFormat:@"%@",@(testNumber.floatValue)];
    //价格格式化显示
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    NSString * formatterString = [formatter stringFromNumber:[NSNumber numberWithFloat:[outNumber doubleValue]]];
    //获取要截取的字符串位置
    NSRange range = [formatterString rangeOfString:@"."];
    if (range.length >0 ) {
        NSString * result = [formatterString substringFromIndex:range.location];
        if (result.length >= 4) {
            formatterString = [formatterString substringToIndex:formatterString.length - 1];
        }
    }
    
    return formatterString;
    
}


@end

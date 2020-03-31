//
//  NSString+TwoPoint.h
//  Coupon
//
//  Created by apple on 2019/9/17.
//  Copyright © 2019 zhulp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TwoPoint)

//保留两个小数点和只有一位小数点
+(NSString*)GetTwoPoint:(NSString *)tempString;

+(NSString*)RemoveTwoPoint:(NSString *)tempString;


@end

NS_ASSUME_NONNULL_END

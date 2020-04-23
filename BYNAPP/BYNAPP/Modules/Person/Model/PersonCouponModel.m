//
//  PersonCouponModel.m
//  BYNAPP
//
//  Created by apple on 2020/4/23.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "PersonCouponModel.h"

@implementation PersonCouponModel

+ (NSDictionary *)modelCustomPropertyMapper {

     return @{@"coupons":@"info.coupons"};

}

+ (NSDictionary *)modelContainerPropertyGenericClass {

    return @{@"coupons":[CouponsModel class]};

}



@end

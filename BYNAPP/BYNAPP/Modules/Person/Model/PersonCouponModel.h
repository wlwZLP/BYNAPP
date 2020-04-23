//
//  PersonCouponModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/23.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CouponsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface PersonCouponModel : NSObject

@property (nonatomic, copy) NSString * goods_name;
@property (nonatomic, copy) NSArray <CouponsModel*> * coupons;
@property (nonatomic, readwrite, strong) NSString * count;
@property (nonatomic, readwrite, copy) NSString * created_at;
@property (nonatomic, readwrite, copy) NSString * straight_type;
@property (nonatomic, readwrite, copy) NSString * brand_cover;
@property (nonatomic, readwrite, copy) NSString * sale_price;
@property (nonatomic, readwrite, strong) NSString * goods_cover;
@property (nonatomic, readwrite, strong) NSString * help;
@property (nonatomic, readwrite, strong) NSString * face_price;
@property (nonatomic, readwrite, copy) NSString * straight_params;
@property (nonatomic, readwrite, strong) NSString * order_no;
@property (nonatomic, readwrite, strong) NSString * notice_phone;
@property (nonatomic, readwrite, strong) NSString * goods_type;
@property (nonatomic, readwrite, strong) NSString * status;
@property (nonatomic, readwrite, strong) NSString * order_price;


@end

NS_ASSUME_NONNULL_END

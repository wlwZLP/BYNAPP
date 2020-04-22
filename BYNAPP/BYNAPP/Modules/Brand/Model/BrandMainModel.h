//
//  BrandMainModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BrandMainModel : NSObject

@property (nonatomic, strong) NSString * brand_id;
@property (nonatomic, strong) NSString * coupon_name;
@property (nonatomic, strong) NSString * app_id;
@property (nonatomic, strong) NSString * mall_id;
@property (nonatomic, strong) NSString * expire;
@property (nonatomic, strong) NSString * brand_cover;
@property (nonatomic, strong) NSString * fl_commission;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * path;
@property (nonatomic, strong) NSString * sale_price;
@property (nonatomic, strong) NSString * coupon_money_text;
@property (nonatomic, strong) NSString * member_price;
@property (nonatomic, strong) NSString * face_price;
@property (nonatomic, strong) NSString * need_login;
@property (nonatomic, strong) NSString * short_title;
@property (nonatomic, strong) NSString * sales;
//1为橙券直冲  3为福禄直冲    2为橙券卡券  4为福禄的卡券 
@property (nonatomic, strong) NSString * coupon_type;
@property (nonatomic, strong) NSString * coupon_cover;

@end

NS_ASSUME_NONNULL_END

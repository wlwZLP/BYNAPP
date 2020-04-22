//
//  UserModel.h
//  BYNAPP
//
//  Created by zhulp on 2020/4/11.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property(nonatomic,strong)NSString * ISLogin;

@property(nonatomic,strong)NSString * Token;

@property (nonatomic, copy) NSString * yesterday_plus_amount;

@property (nonatomic, copy) NSString  * is_show_my_promotion;

@property (nonatomic, copy) NSString * yhkf_config_id;

@property (nonatomic, copy) NSString * User_id;

@property (nonatomic, copy) NSString * balance_amount;

@property (nonatomic, copy) NSString * rank_cover;

@property (nonatomic, copy) NSString * is_show_ele;

@property (nonatomic, copy) NSString * wx_account;

@property (nonatomic, copy) NSString * last_month_plus_amount;

@property (nonatomic, copy) NSString * is_show_my_team;

@property (nonatomic, copy) NSString * plus_expire;

@property (nonatomic, copy) NSString * real_name;

@property (nonatomic, copy) NSString * this_month_settle_amount;

@property (nonatomic, copy) NSString * today_plus_amount;

@property (nonatomic, copy) NSString * recommend_code;

@property (nonatomic, copy) NSString * type;

@property (nonatomic, copy) NSString * yesterday_pre_amount;

@property (nonatomic, copy) NSString * today_new_first_team_num;

@property (nonatomic, copy) NSString * parent_id;

@property (nonatomic, copy) NSString * total_pre_amount;

@property (nonatomic, copy) NSString * total_saving_amount;

@property (nonatomic, copy) NSString * is_show_promote_info;

@property (nonatomic, copy) NSString * area_code;

@property (nonatomic, copy) NSString * today_pre_amount;

@property (nonatomic, copy) NSString * name;

@property (nonatomic, copy) NSString * type_text;

@property (nonatomic, copy) NSString * plus_amount;

@property (nonatomic, copy) NSString * avatar;

@property (nonatomic, copy) NSString * out_uid;

@property (nonatomic, copy) NSArray * withdraw_base_amount;

@property (nonatomic, copy) NSString * customer_service;

@property (nonatomic, copy) NSString * business_kefu;

@property (nonatomic, copy) NSString * parent_name;

@property (nonatomic, copy) NSString * min_withdraw_amount;

@property (nonatomic, copy) NSString * adzones;

@property (nonatomic, copy) NSString * swkf_qrcode;

@property (nonatomic, copy) NSString * first_team_num;

@property (nonatomic, copy) NSString * ali_account;

@property (nonatomic, copy) NSString * team_num;

@property (nonatomic, copy) NSString * order_amount;

@property (nonatomic, copy) NSString * this_month_pre_amount;

@property (nonatomic, copy) NSString * withdraw_amount;

@property (nonatomic, copy) NSString * un_settle_amount;

@property (nonatomic, copy) NSString * total_plus_amount;

@property (nonatomic, copy) NSString * this_month_plus_amount;

@property (nonatomic, copy) NSString * last_month_settle_amount;

@property (nonatomic, copy) NSString * phone;

@property (nonatomic, copy) NSString * yhkf_qrcode;

//通过这个判断是否是会员
@property (nonatomic, copy) NSString * plus_level;

@property (nonatomic, copy) NSString * swkf_config_id;

@property (nonatomic, copy) NSString * last_month_pre_amount;


@end

NS_ASSUME_NONNULL_END

//
//  HomeBannerModel.h
//  BYNAPP
//
//  Created by zhulp on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeBannerModel : NSObject

@property (nonatomic, readwrite, strong) NSString * banner_id;
@property (nonatomic, readwrite, strong) NSString * sub_title;
@property (nonatomic, readwrite, strong) NSString * aspect_ratio;
@property (nonatomic, readwrite, strong) NSString * title_color;
@property (nonatomic, readwrite, strong) NSString * type;
@property (nonatomic, readwrite, strong) NSString * title;
@property (nonatomic, readwrite, strong) NSString * logo;
@property (nonatomic, readwrite, strong) NSString * sub_title_color;
//1-web；2-商品详情；3-聚划算；4-9块9包邮；5-拼多多；6-京东；
//7-专辑详情；10-淘宝物料 11-拼多多官方活动 12-京东官方活动 13-自定义
@property (nonatomic, readwrite, strong) NSString * target_type;
@property (nonatomic, readwrite, strong) NSString * is_advertising;
@property (nonatomic, readwrite, strong) NSString * cover;
@property (nonatomic, readwrite, strong) NSString * need_login;
@property (nonatomic, readwrite, strong) NSString * bg_color;


//Target 字典数据，根据里面数据进行跳转
@property (nonatomic, readwrite, strong) NSString * target_Sub_type;
@property (nonatomic, readwrite, strong) NSString * target_item_id;
@property (nonatomic, readwrite, strong) NSString * target_Tactivity_id;
@property (nonatomic, readwrite, strong) NSString * target_title;
@property (nonatomic, readwrite, strong) NSString * target_scheme_able;
@property (nonatomic, readwrite, strong) NSString * target_url;
@property (nonatomic, readwrite, strong) NSString * target_open_share;
@property (nonatomic, readwrite, strong) NSString * target_url_type;


@end

NS_ASSUME_NONNULL_END

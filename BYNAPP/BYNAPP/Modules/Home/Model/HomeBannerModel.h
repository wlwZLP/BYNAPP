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
@property (nonatomic, readwrite, strong) NSString * target_type;
@property (nonatomic, readwrite, strong) NSString * is_advertising;
@property (nonatomic, readwrite, strong) NSString * cover;
@property (nonatomic, readwrite, strong) NSString * need_login;
@property (nonatomic, readwrite, strong) NSString * target_Type;
@property (nonatomic, readwrite, strong) NSString * target_item_id;
@property (nonatomic, readwrite, strong) NSString * target_Tactivity_id;
@property (nonatomic, readwrite, strong) NSString * bg_color;

@end

NS_ASSUME_NONNULL_END

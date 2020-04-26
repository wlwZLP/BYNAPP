//
//  HomeBannerModel.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeBannerModel.h"

@implementation HomeBannerModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"banner_id" : @"id",
             @"target_path" : @"target.path",
             @"target_Sub_type" : @"target.type",
             @"target_item_id" : @"target.item_id",
             @"target_Tactivity_id" : @"target.Tactivity_id",
             @"target_title" : @"target.title",
             @"target_scheme_able" : @"target.scheme_able",
             @"target_url" : @"target.url",
             @"target_open_share" : @"target.open_share",
             @"target_url_type" : @"target.url_type"};
    
}


@end

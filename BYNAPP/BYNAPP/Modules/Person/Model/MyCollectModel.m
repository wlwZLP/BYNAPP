//
//  MyCollectModel.m
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyCollectModel.h"

@implementation MyCollectModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"collect_id" : @"id",
             @"item_info_price" : @"item_info.price",
             @"item_info_title" : @"item_info.title",
             @"item_info_cover_image" : @"item_info.cover_image"};
    
}


@end

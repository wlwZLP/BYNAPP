//
//  BrandModel.m
//  BYNAPP
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandModel.h"

@implementation BrandModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"brand_id" : @[@"id",@"ID"]};
}
@end

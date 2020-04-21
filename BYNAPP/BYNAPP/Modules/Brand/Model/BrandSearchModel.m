//
//  BrandSearchModel.m
//  BYNAPP
//
//  Created by apple on 2020/4/21.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandSearchModel.h"

@implementation BrandSearchModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"Brand_id" : @[@"id",@"ID"]};
}

@end

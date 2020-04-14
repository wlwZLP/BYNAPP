//
//  BrandMainModel.m
//  BYNAPP
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandMainModel.h"

@implementation BrandMainModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"brand_id" : @[@"id",@"ID"]};
}
@end

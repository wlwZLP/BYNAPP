//
//  BrandPlistModel.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandPlistModel.h"

@implementation BrandPlistModel

//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"Brand_id" : @[@"id",@"ID"]};
}



@end

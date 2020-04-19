//
//  BrandModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BrandModel : NSObject

@property (nonatomic, strong) NSString * brand_id;
@property (nonatomic, strong) NSString * brand_type;
@property (nonatomic, strong) NSString * brand_desc;
@property (nonatomic, strong) NSString * category_id;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * goods_type_id;
@property (nonatomic, strong) NSString * logo;
@property (nonatomic, strong) NSString * updated_at;
@property (nonatomic, strong) NSString * sort;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * is_hot;


@end

NS_ASSUME_NONNULL_END

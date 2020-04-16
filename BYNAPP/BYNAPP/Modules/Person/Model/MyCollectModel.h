//
//  MyCollectModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCollectModel : NSObject

@property (nonatomic, copy) NSString * item_type;
@property (nonatomic, readwrite, strong) NSString * collect_id;
@property (nonatomic, readwrite, copy) NSString * created_at;
@property (nonatomic, readwrite, copy) NSString * mall_icon;
@property (nonatomic, readwrite, copy) NSString * mall_id;
@property (nonatomic, readwrite, copy) NSString * item_id;
@property (nonatomic, readwrite, strong) NSString * item_info_price;
@property (nonatomic, readwrite, strong) NSString * item_info_title;
@property (nonatomic, readwrite, strong) NSString * item_info_cover_image;

@end

NS_ASSUME_NONNULL_END

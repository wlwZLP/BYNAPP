//
//  CouponsModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/23.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CouponsModel : NSObject

@property (nonatomic, readwrite, strong) NSString * goods_type;
@property (nonatomic, readwrite, strong) NSString * goods_link;
@property (nonatomic, readwrite, strong) NSString * goods_number;
@property (nonatomic, readwrite, strong) NSString * goods_password;
@property (nonatomic, readwrite, strong) NSString * effective_time;

@end

NS_ASSUME_NONNULL_END

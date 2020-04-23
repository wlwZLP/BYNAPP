//
//  OrderDetailsCollectionViewController.h
//  BYNAPP
//
//  Created by zhulp on 2020/4/12.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYBaseCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderListCollectionViewController : YYBaseCollectionViewController


/// 1-我的订单 2-我的下级团队成员的订单
@property(nonatomic,strong) NSString * mode;

/// 1-淘宝 2-拼多多 3-京东 4-美团酒店 5-大众点评 6-美团商家券
@property(nonatomic,strong) NSString * OrderType;


@end



NS_ASSUME_NONNULL_END

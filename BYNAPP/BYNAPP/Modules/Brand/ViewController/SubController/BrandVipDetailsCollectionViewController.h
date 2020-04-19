//
//  BrandDetailsCollectionViewController.h
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYBaseCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BrandVipDetailsCollectionViewController : YYBaseCollectionViewController

@property(nonatomic,strong)NSString * Details_id;

//为1时id为淘宝商品id，
//为2时id为天猫商品id，
//为3时id为拼多多商品id，
//为4时id为京东商品id，
//为5时id为橙券卡券商品id，
//为7时id为福禄卡券商品id，
//为8时id为福禄直冲商品id
@property(nonatomic,strong)NSString * mall_id;


@end



NS_ASSUME_NONNULL_END

//
//  DetailsCollectionViewController.h
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYBaseCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeDetailsCollectionViewController : YYBaseCollectionViewController


//商品类型: 1-淘宝；2-拼多多；3-京东
@property(nonatomic,strong)NSString * Goods_Type;

@property(nonatomic,strong)NSString * item_id;

@property(nonatomic,strong)NSString * activity_id;


@end

NS_ASSUME_NONNULL_END

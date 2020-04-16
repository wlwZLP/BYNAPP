//
//  MyOrderCollectionViewController.h
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYBaseCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN



@interface MyOrderCollectionViewController : YYBaseCollectionViewController

/// 订单类型 1为我个人订单  2为团队订单
@property(nonatomic,strong) NSString * UserType;


@end

NS_ASSUME_NONNULL_END

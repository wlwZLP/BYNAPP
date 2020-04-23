//
//  CouponCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonCouponModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CouponCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)PersonCouponModel * Model;

@property (nonatomic,copy) void(^CouponListBtnBlockClick)(NSString * Title);


@end

NS_ASSUME_NONNULL_END

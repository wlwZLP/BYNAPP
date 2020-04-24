//
//  GoodsTitleCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFLabel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GoodsTitleCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView * Logoimage;

@property (nonatomic, strong) SFLabel * TitleLabel;

@property (nonatomic, strong) UILabel * GainMoneyLabel;

@property (nonatomic, strong) UILabel * CouponPriceLabel;

@property (nonatomic, strong) UILabel * OldPriceLabel;

@property (nonatomic, strong) UILabel * SaleNumLabel;


@end

NS_ASSUME_NONNULL_END

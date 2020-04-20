//
//  DetailsTopCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsTopCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView * MainBgImgView;

@property (nonatomic, strong) UIImageView * Logoimage;

@property (nonatomic, strong) UILabel * TitleLabel;

@property (nonatomic, strong) UILabel * PriceLabel;

@property (nonatomic, strong) UILabel * CouponLabel;

@property (nonatomic, strong) UILabel * OldPriceLabel;

@end

NS_ASSUME_NONNULL_END

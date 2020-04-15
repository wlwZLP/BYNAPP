//
//  GoodsShopCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsShopCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView * ShopImgview;

@property (nonatomic, strong) UILabel * ShopLabel;

@property (nonatomic, strong) UILabel * LeftNumLabel;

@property (nonatomic, strong) UILabel * CenterNumLabel;

@property (nonatomic, strong) UILabel * RightNumLabel;

@end

NS_ASSUME_NONNULL_END

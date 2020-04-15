//
//  GoodsCouponCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsCouponCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel * CouponLabel;

@property (nonatomic, strong) UILabel * TimeLabel;

@property (nonatomic,copy) void(^DrawLabelBlockClick)(void);

@end

NS_ASSUME_NONNULL_END

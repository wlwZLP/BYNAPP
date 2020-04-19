//
//  DetailsNumCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsNumCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)void(^DelButtonBlockClick)(void);

@property(nonatomic,strong)void(^ADDButtonBlockClick)(void);

@property(nonatomic,strong) UITextField * BuyNumTextField;

@end

NS_ASSUME_NONNULL_END

//
//  GoodsDetailsCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsDetailsCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView * MainBgView;

@property (nonatomic, strong) UIButton * ArrowBtn;

@property (nonatomic,copy) void(^OpenDeatilsBtnBlockClick)(NSInteger ClickIndex);

@end

NS_ASSUME_NONNULL_END

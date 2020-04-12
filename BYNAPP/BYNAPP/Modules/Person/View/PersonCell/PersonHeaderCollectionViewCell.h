//
//  PersonHeaderCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/3.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonHeaderCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy) void(^TopMoneyBtnBlockClick)(void);

@property (nonatomic,copy) void(^TopSetBtnBlockClick)(void);

@property (nonatomic,copy) void(^TopWithdrawBtnBlockClick)(void);


@end

NS_ASSUME_NONNULL_END

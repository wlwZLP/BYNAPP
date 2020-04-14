//
//  HomeTimeCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTimeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeTimeCollectionViewCell : UICollectionViewCell


@property(nonatomic,strong)NSArray<HomeTimeModel*> * TimeListArray;

@property (nonatomic,copy) void(^PushLimtbuyBlockClick)(void);

@property (nonatomic,copy) void(^PushLGoodDetailsBlockClick)(HomeMainModel * Model);


@end

NS_ASSUME_NONNULL_END

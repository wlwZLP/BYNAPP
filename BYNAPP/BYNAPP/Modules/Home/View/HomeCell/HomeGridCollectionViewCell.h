//
//  HomeGridCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeBannerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeGridCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)NSArray<HomeBannerModel*> * ChannelListArray;


@property(nonatomic,copy)void(^GridBtnBlockClick)(NSInteger index);


@end

NS_ASSUME_NONNULL_END

//
//  HomeBannerCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeBannerCollectionViewCell : UICollectionViewCell


@property(nonatomic,strong)NSArray * ImgListArray;

@property (nonatomic,copy) void(^SdClyImgBlockClick)(NSInteger ImgIndex);

@end

NS_ASSUME_NONNULL_END

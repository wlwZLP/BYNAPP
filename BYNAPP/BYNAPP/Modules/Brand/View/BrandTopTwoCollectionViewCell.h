//
//  BrandTopTwoCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrandModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BrandTopTwoCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)NSArray<BrandModel*> * BrandListArray;

@property (nonatomic,copy) void(^BrandGridBtnBlockClick)(NSInteger GridIndex);


@end

NS_ASSUME_NONNULL_END

//
//  BDetailsCenCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/17.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrandDetailsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BDetailsCenCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)NSArray<BrandDetailsModel*> * TitleListArray;

@property(nonatomic,strong)NSArray * TitleArray;

@property (nonatomic,copy) void(^TopBtnBlockClick)(NSInteger TagIndex);

@property (nonatomic,copy) void(^BottomBtnBlockClick)(NSInteger TagIndex);


@end

NS_ASSUME_NONNULL_END

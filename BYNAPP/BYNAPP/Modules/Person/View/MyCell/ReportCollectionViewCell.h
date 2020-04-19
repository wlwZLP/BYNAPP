//
//  ReportCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ReportCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)NSArray<ReportModel*> * DataArray;

@property (nonatomic, strong) UILabel * TitleLabel;


@end

NS_ASSUME_NONNULL_END

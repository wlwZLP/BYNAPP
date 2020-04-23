//
//  OrderDetailsCollectionViewCell.h
//  BYNAPP
//
//  Created by zhulp on 2020/4/12.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailsCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)OrderListModel * Model;

@end

NS_ASSUME_NONNULL_END

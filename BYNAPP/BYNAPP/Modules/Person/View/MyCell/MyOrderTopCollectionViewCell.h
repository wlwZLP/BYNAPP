//
//  MyOrderCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyOrderTopCollectionViewCell : UICollectionViewCell

@property(nonatomic,copy)void(^MyOrderBtnBlockClick)(NSInteger TagIndex);

@end

NS_ASSUME_NONNULL_END

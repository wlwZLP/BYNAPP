//
//  GridCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GridCollectionViewCell : UICollectionViewCell


@property(nonatomic,copy)void(^GridBtnBlockClick)(void);

@end

NS_ASSUME_NONNULL_END

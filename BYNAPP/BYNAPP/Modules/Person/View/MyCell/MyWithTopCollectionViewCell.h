//
//  MyWithTopCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyWithTopCollectionViewCell : UICollectionViewCell

@property(nonatomic,copy)void(^MyRecordBtnBlockClick)(void);


@end

NS_ASSUME_NONNULL_END

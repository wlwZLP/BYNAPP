//
//  PersonHeaderCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/3.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonNoLoginCollectionViewCell : UICollectionViewCell


@property (nonatomic,copy) void(^TopLoginBtnBlockClick)(void);


@end

NS_ASSUME_NONNULL_END

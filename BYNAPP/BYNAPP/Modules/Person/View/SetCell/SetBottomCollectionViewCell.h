//
//  SetBottomCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetBottomCollectionViewCell : UICollectionViewCell


@property(nonatomic,strong)NSString * TitString;

@property (nonatomic,copy) void(^BottomMainBtnBlockClick)(void);


@end

NS_ASSUME_NONNULL_END

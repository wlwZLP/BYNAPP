//
//  SetTopCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetTopCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy) void(^TopHeadImgBtnBlockClick)(void);


@property (nonatomic,copy) void(^TopNameBtnBlockClick)(void);


@property (nonatomic,copy) void(^TopPhoneBtnBlockClick)(void);

@end

NS_ASSUME_NONNULL_END

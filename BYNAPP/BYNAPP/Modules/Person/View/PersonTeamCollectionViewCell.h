//
//  PersonTeamCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/3.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonTeamCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy) void(^LeftBtnBlockClick)(void);

@property (nonatomic,copy) void(^LeftCenterBtnBlockClick)(void);

@property (nonatomic,copy) void(^RightCenterBtnBlockClick)(void);

@property (nonatomic,copy) void(^RightBtnBlockClick)(void);

@end

NS_ASSUME_NONNULL_END

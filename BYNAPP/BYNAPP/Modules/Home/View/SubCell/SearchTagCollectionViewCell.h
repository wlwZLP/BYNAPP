//
//  SearchTagCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/20.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchTagCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UILabel * TextLabel;

@property (nonatomic,copy) void(^labelClickBlockClick)(void);


@end

NS_ASSUME_NONNULL_END

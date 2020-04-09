//
//  PersonMainCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/3.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonMainCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView * LeftImg;

@property(nonatomic,strong)UILabel * Leftlabel;

@property(nonatomic,strong)UIButton * LeftBtn;

@property (nonatomic,copy) void(^TopRowBtnBlockClick)(NSInteger TagIndex);


@end

NS_ASSUME_NONNULL_END

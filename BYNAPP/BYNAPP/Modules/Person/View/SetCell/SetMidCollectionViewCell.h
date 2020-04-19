//
//  SetMidCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetMidCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy) void(^WeiChatImgBtnBlockClick)(void);


@property (nonatomic,copy) void(^TaoBaoBtnBlockClick)(void);


@property (nonatomic,copy) void(^AutuBtnBlockClick)(void);

@property (nonatomic, strong) UILabel * WChatLabel;

@property (nonatomic, strong) UILabel * TBaoLabel;


@end

NS_ASSUME_NONNULL_END

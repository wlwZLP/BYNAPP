//
//  PersonVipHeadCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface PersonLoginHeadCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy) void(^PersonVipheadBtnBlockClick)(NSString * ClickString);


@property(nonatomic,strong)UserModel * Model;


@end

NS_ASSUME_NONNULL_END

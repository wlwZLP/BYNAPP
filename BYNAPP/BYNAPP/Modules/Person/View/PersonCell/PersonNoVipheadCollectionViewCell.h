//
//  PersonNoVipheadCollectionViewCell.h
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonNoVipheadCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy) void(^PersonheadBtnBlockClick)(NSString * ClickString);


@end

NS_ASSUME_NONNULL_END
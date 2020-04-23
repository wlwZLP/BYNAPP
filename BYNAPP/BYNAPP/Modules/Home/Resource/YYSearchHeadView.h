//
//  YYSearchHeadView.h
//  BYNAPP
//
//  Created by apple on 2020/4/20.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYSearchHeadView : UIView

@property (nonatomic,copy) void(^HeaderTopBlockClick)(NSString * SortType);

@property (nonatomic,copy) void(^HeaderCouponBlockClick)(NSString * CouponType);


@end

NS_ASSUME_NONNULL_END

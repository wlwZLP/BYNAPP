//
//  YYPDDHeadView.h
//  BYNAPP
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYPDDHeadView : UIView

@property(nonatomic,strong)NSString * HeaderType;

@property(nonatomic,strong)NSString * HeaderCoupon;

@property (nonatomic,copy) void(^HeaderBtnBlockClick)(NSString * HeaderType);

@property (nonatomic,copy) void(^YouHuiButtonBlockClick)(NSString * CouponType);

@property (nonatomic,copy) void(^ShaiXuanButtonBlockClick)(void);


@end

NS_ASSUME_NONNULL_END

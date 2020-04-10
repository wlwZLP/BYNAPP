//
//  YYCouponHeadView.h
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYCouponHeadView : UIView


@property(nonatomic,strong)NSArray * TitleArray;

@property (nonatomic,copy) void(^TitleBtnBlockClick)(NSInteger TagIndex);


@end

NS_ASSUME_NONNULL_END

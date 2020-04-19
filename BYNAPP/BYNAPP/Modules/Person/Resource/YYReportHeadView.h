//
//  YYReportHeadView.h
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYReportHeadView : UIView

@property (nonatomic,copy) void(^WithdrawBtnBlockClick)(void);

@property(nonatomic,strong)UILabel * TopLabel;

@property(nonatomic,strong)UILabel * LeftLabel;

@property(nonatomic,strong)UILabel * CenterLabel;

@property(nonatomic,strong)UILabel * RightLabel;


@end

NS_ASSUME_NONNULL_END

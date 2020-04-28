//
//  YYTeamHeadView.h
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYTeamHeadView : UIView

@property(nonatomic,strong)UILabel * PeoPleNumLabel;

@property(nonatomic,strong)UILabel * InvitMyPeoLabel;

@property (nonatomic,copy) void(^MyTeamNavBtnBlockClick)(NSString * NavType);

@property (nonatomic,copy) void(^MyTeamTopBlockClick)(NSString * SortType);


@end

NS_ASSUME_NONNULL_END

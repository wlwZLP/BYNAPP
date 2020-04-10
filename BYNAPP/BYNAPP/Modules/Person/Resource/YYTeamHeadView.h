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

@property (nonatomic,copy) void(^TopLeftBtnBlockClick)(void);

@property (nonatomic,copy) void(^TopRightBlockClick)(void);


@end

NS_ASSUME_NONNULL_END

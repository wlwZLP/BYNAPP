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

@property (nonatomic,copy) void(^HeaderTopBlockClick)(NSString * SortType);


@end

NS_ASSUME_NONNULL_END

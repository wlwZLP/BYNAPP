//
//  YYOrderHeadView.h
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYOrderHeadView : UIView

@property (nonatomic,copy) void(^TitleBtnBlockClick)(NSInteger TagIndex);

@property(nonatomic,strong)NSArray * TitleArray;


@end

NS_ASSUME_NONNULL_END

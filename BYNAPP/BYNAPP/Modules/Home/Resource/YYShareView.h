//
//  YYShareView.h
//  BYNAPP
//
//  Created by apple on 2020/4/22.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYShareView : UIView

@property (nonatomic,copy) void(^BottomShareBlockClick)(NSInteger BtnIndex);


@end

NS_ASSUME_NONNULL_END

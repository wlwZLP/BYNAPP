//
//  HomeMainViewModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeMainViewModel : NSObject

// 处理登录按钮是否允许点击
@property (nonatomic, strong) RACSignal *loginEnableSiganl;


@property(nonatomic,strong)RACCommand * requestCommand;

@end

NS_ASSUME_NONNULL_END

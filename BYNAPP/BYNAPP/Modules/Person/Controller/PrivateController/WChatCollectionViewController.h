//
//  WChatCollectionViewController.h
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYBaseCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WChatCollectionViewController : YYBaseCollectionViewController

//修改用户的类型  1位用户名字   2位手机号码   3位微信号
@property(nonatomic,strong)NSString * TildType;;


@property(nonatomic,strong)UserModel * UModel;


@end

NS_ASSUME_NONNULL_END

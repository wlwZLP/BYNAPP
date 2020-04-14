//
//  define.h
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//

// 全局工具类宏定义

#ifndef UtilsMacros_h
#define UtilsMacros_h

#define YYRootViewController [UIApplication sharedApplication].delegate.window.rootViewController

#define YYBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?88:64)

#define YYStatusHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define YYNavHeight self.navigationController.navigationBar.frame.size.height

#define YYTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

//获取屏幕宽高
#define YYScreenWidth  [[UIScreen mainScreen] bounds].size.width

#define YYScreenHeight [[UIScreen mainScreen] bounds].size.height

// 判断iPhone4S
#define IPhone4S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断iPhoneSE
#define IPhoneSE ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断iPhone8
#define IPhone8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断iPhone8P
#define IPhone8P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断iPHone11
#define IPhone11 [UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : \
NO

// 判断iPhone11 Pro
#define IPhoneXS [UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : \
NO

// 判断iPhone11 Pro Max
#define IPhoneXSMax [UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : \
NO



#endif /* define_h */

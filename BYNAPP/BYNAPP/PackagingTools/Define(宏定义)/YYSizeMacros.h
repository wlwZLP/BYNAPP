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

#define YYBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?88:64)

#define YYStatusHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define YYNavHeight self.navigationController.navigationBar.frame.size.height

#define YYTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

//获取屏幕宽高
#define YYScreenWidth  [[UIScreen mainScreen] bounds].size.width

#define YYScreenHeight [[UIScreen mainScreen] bounds].size.height

//设备的型号
#define IPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断iPHoneXr
#define IPhoneXr [UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : \
NO

// 判断iPhone11
#define IPhoneXS [UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : \
NO

// 判断iPhone11 Pro
#define IPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断iPhoneXs Pro Max
#define IPhoneXSMax [UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : \
NO

#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//float statusBarHeight = 0;
//if (@available(iOS 13.0, *)) {
//    UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
//    statusBarHeight = statusBarManager.statusBarFrame.size.height;
//}
//else {
//    statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
//}





#endif /* define_h */

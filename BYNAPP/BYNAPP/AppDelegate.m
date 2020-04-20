//
//  AppDelegate.m
//  BYNAPP
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "AppDelegate.h"
#import "YYMainTabBarController.h"
//#import <AlibcTradeSDK/AlibcTradeSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // 设置APP配置数据
    [self SetAPPSignSaveTool];
    
    [self SetAPPThirdSDKInformation];
  
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    self.window.rootViewController = [[YYMainTabBarController alloc] init];
    
     //好像远程添加支付宝失败了
    
    return YES;
    
}


-(void)SetAPPSignSaveTool{
     
     NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
     NSString * app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
     [YYSaveTool SetCahceForvalue:@"0" forKey:YYLogin];
    
     [YYSaveTool SetCahceForvalue:app_Version forKey:CacheAPPVersion];
    
     [YYSaveTool SetCahceForvalue:@"nkvdqe" forKey:CacheAPPkey];
    
     [YYSaveTool SetCahceForvalue:@"2d0063ff9424ec1cb9cc3c3d6cdd420f" forKey:CacheAPPSecret];
    
    
}

-(void)SetAPPThirdSDKInformation{
    

   // 百川平台基础SDK初始化，加载并初始化各个业务能力插件
//      [[AlibcTradeSDK sharedInstance] setDebugLogOpen:YES];//开发阶段打开日志开关，方便排查错误信息
//      
//      [[AlibcTradeSDK sharedInstance] setIsvVersion:@"2.2.2"];
//      [[AlibcTradeSDK sharedInstance] setIsvAppName:@"baichuanDemo"];
//      [[AlibcTradeSDK sharedInstance] asyncInitWithSuccess:^{
//          //      openSDKSwitchLog(NO);
//          YYNSLog(@"百川SDK初始化成功");
//      } failure:^(NSError *error) {
//          YYNSLog(@"百川SDK初始化失败");
//      }];
   
    
    
}




@end

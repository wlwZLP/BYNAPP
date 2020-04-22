//
//  AppDelegate.m
//  BYNAPP
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "AppDelegate.h"
#import "YYMainTabBarController.h"
#import <AlibcTradeSDK/AlibcTradeSDK.h>

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
    
    return YES;
    
}


-(void)SetAPPSignSaveTool{
     
     NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
     NSString * app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
     
     if ([YYSaveTool GetCacheForKey:YYAgreeXieyi] == nil) {
        [YYSaveTool SetCahceForvalue:@"0" forKey:YYAgreeXieyi];
     }
    
     [YYSaveTool SetCahceForvalue:app_Version forKey:CacheAPPVersion];
    
     [YYSaveTool SetCahceForvalue:@"nkvdqe" forKey:CacheAPPkey];
    
     [YYSaveTool SetCahceForvalue:@"2d0063ff9424ec1cb9cc3c3d6cdd420f" forKey:CacheAPPSecret];
    
     [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx603dcad9a4e0b55d" appSecret:@"32797ea1fba76ad32ca152f5bceb334a" redirectURL:nil];

     [[AlibcTradeSDK sharedInstance] setDebugLogOpen:NO];//开发阶段打开日志开关，方便排查错误信息
     
     [[AlibcTradeSDK sharedInstance] setIsvVersion:app_Version];
     [[AlibcTradeSDK sharedInstance] setIsvAppName:@"baichuanDemo"];
     [[AlibcTradeSDK sharedInstance] asyncInitWithSuccess:^{
          YYNSLog(@"百川SDK初始化成功");
     } failure:^(NSError *error) {
          YYNSLog(@"百川SDK初始化失败");
     }];
    
    
}



-(void)SetAPPThirdSDKInformation{
    
     
    
    
    
   
    
    
}




@end

//
//  AppDelegate.m
//  BYNAPP
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "AppDelegate.h"
#import "YYMainTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // 设置APP配置数据
    [self SetAPPSignSaveTool];
    
    [self GetAPPCachLocalData];
  
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    self.window.rootViewController = [[YYMainTabBarController alloc] init];
    
    
    
    return YES;
    
}


-(void)SetAPPSignSaveTool{
     
     NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
     NSString * app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];

//     NSString * BuildId = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    
     [YYSaveTool SetCahceForvalue:app_Version forKey:CacheAPPVersion];
    
     [YYSaveTool SetCahceForvalue:@"nkvdqe" forKey:CacheAPPkey];
    
     [YYSaveTool SetCahceForvalue:@"2d0063ff9424ec1cb9cc3c3d6cdd420f" forKey:CacheAPPSecret];
    
    
}

-(void)GetAPPCachLocalData{
    

   
   
    
    
}




@end

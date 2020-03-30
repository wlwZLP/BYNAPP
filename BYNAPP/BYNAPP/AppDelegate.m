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
  
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    

    self.window.rootViewController = [[YYMainTabBarController alloc] init];
    
    return YES;
    
}








@end

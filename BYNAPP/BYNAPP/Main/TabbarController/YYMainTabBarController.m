//
//  MainTabBarController.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "YYMainTabBarController.h"
#import "RootNavigationController.h"

#import "YYHomeViewController.h"
#import "YYMemViewController.h"
#import "YYLiveCouponViewController.h"
#import "YYPersonViewController.h"


@interface YYMainTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic,strong) NSMutableArray * VCS;//tabbar root VC

@end

@implementation YYMainTabBarController


- (void)viewDidLoad {
    
     [super viewDidLoad];
    
     self.delegate = self;
    
     //添加子控制器
     [self setUpAllChildViewController];
    
//     self.tabBar.backgroundImage = [UIImage imageWithColor:[UIColor whiteColor]];
//
//     self.tabBar.selectionIndicatorImage = [UIImage imageWithColor:[UIColor whiteColor]];

    
}





#pragma mark - ——————— 初始化VC ————————
-(void)setUpAllChildViewController{
    
    _VCS = @[].mutableCopy;
    
    YYHomeViewController *homeVC = [[YYHomeViewController alloc]init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"icon_tabbar_homepage" seleceImageName:@"icon_tabbar_homepage_selected"];
    
    
    YYLiveCouponViewController * LiveVC = [[YYLiveCouponViewController alloc]init];
    [self setupChildViewController:LiveVC title:@"生活券" imageName:@"icon_tabbar_Super" seleceImageName:@"icon_tabbar_Super_selected"];
    
 
    YYMemViewController * VipVC = [[YYMemViewController alloc]init];
    [self setupChildViewController:VipVC title:@"分类" imageName:@"icon_tabbar_live" seleceImageName:@"icon_tabbar_live_selected"];
    
    YYPersonViewController * MeVC = [[YYPersonViewController alloc]init];
    [self setupChildViewController:MeVC title:@"我的" imageName:@"icon_tabbar_mine" seleceImageName:@"icon_tabbar_mine_selected"];
    
    self.viewControllers = _VCS;
    
    
}



-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    
    controller.title = title;
    
    controller.tabBarItem.title = title;//跟上面一样效果

    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
  

    //包装导航控制器
     RootNavigationController *nav = [[RootNavigationController alloc]initWithRootViewController:controller];
    
     [_VCS addObject:nav];
    
    
}


-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    if ([viewController.title isEqualToString:@"首页"]) {
        
       
        
     }
    
    
}


-(void)setRedDotWithIndex:(NSInteger)index isShow:(BOOL)isShow{
    

    
}


- (BOOL)shouldAutorotate {
    
    return [self.selectedViewController shouldAutorotate];
    
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return [self.selectedViewController supportedInterfaceOrientations];
    
}



@end

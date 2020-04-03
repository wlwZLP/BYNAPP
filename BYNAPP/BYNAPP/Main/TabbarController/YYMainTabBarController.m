//
//  MainTabBarController.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "YYMainTabBarController.h"
#import "RootNavigationController.h"

#import "HomeGoodsCategoriesModel.h"

#import "YYHomeCollectionViewController.h"
#import "YYLiveCollectionViewController.h"
#import "YYMemCollectionViewController.h"
#import "YYPersonCollectionViewController.h"


@interface YYMainTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic,strong) NSMutableArray * VCS;//tabbar root VC

@property (nonatomic,strong) NSArray * GoodsModelArray;//tabbar root VC

@end

@implementation YYMainTabBarController


-(instancetype)init{
    
    //1.初始化父类
    self = [super init];
    //2.判断父类是否初始化成功
    if(self){
       //3.初始化子类
       //设置属性的值
     
    }
    //4.返回地址
    return self;
    
}


- (void)viewDidLoad {
    
     [super viewDidLoad];
    
     self.delegate = self;
 
     //添加子控制器
     [self setUpAllChildViewController];
    
     self.tabBar.backgroundImage = [UIImage imageWithColor:[UIColor whiteColor]];

     self.tabBar.selectionIndicatorImage = [UIImage imageWithColor:[UIColor whiteColor]];

}


#pragma mark - ——————— 初始化VC ————————
-(void)setUpAllChildViewController{
    
    _VCS = @[].mutableCopy;
    
    YYHomeCollectionViewController *homeVC = [[YYHomeCollectionViewController alloc]init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"icon_tabbar_homepage" seleceImageName:@"icon_tabbar_homepage_selected"];
    
    YYLiveCollectionViewController * LiveVC = [[YYLiveCollectionViewController alloc]init];
    [self setupChildViewController:LiveVC title:@"品牌馆" imageName:@"icon_tabbar_live" seleceImageName:@"icon_tabbar_live_selected"];
    
 
    YYMemCollectionViewController * MemVC = [[YYMemCollectionViewController alloc]init];
    [self setupChildViewController:MemVC title:@"分类" imageName:@"icon_tabbar_mem" seleceImageName:@"icon_tabbar_mem_selected"];
    
    YYPersonCollectionViewController * MeVC = [[YYPersonCollectionViewController alloc]init];
    [self setupChildViewController:MeVC title:@"我的" imageName:@"icon_tabbar_Person" seleceImageName:@"icon_tabbar_Person_selected"];
    
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

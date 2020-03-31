//
//  RootNavigationController.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "RootNavigationController.h"


@interface RootNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, weak) id popDelegate;
@property (nonatomic,strong) UIPercentDrivenInteractiveTransition * interactivePopTransition;
@property (nonatomic,strong) UIScreenEdgePanGestureRecognizer * popRecognizer;
@property(nonatomic,assign) BOOL isSystemSlidBack;//是否开启系统右滑返回

@end

@implementation RootNavigationController

//APP生命周期中 只会执行一次
+ (void)load
{
    //导航栏主题 title文字属性
    UINavigationBar * navBar = [UINavigationBar appearance];
    //导航栏背景图
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName :YY32Color, NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
    [navBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]  forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    [navBar setShadowImage:[UIImage imageWithColor:YYE1Color]];//去掉阴影线
    
    [UITabBar appearance].translucent = NO;
    
    [UITabBar appearance].barTintColor = YY32Color;
    
    [UITabBar appearance].tintColor = YY32Color;
    

}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
    //默认开启系统右划返回
    self.interactivePopGestureRecognizer.enabled = YES;
    self.interactivePopGestureRecognizer.delegate = self;
   
    //只有在使用转场动画时，禁用系统手势，开启自定义右划手势
    _popRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleNavigationTransition:)];
    _popRecognizer.edges = UIRectEdgeLeft;
    [_popRecognizer setEnabled:NO];
    [self.view addGestureRecognizer:_popRecognizer];
    
}

//解决手势失效问题
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (_isSystemSlidBack) {
        self.interactivePopGestureRecognizer.enabled = YES;
        [_popRecognizer setEnabled:NO];
    }else{
        self.interactivePopGestureRecognizer.enabled = NO;
        [_popRecognizer setEnabled:YES];
    }
}

//根视图禁用右划返回
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
     return self.childViewControllers.count == 1 ? NO : YES;
    
}


//push时隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    if (self.childViewControllers.count > 0) {// 非根控制器
   
        self.interactivePopGestureRecognizer.enabled = NO;
        
         viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;

    [super pushViewController:viewController animated:animated];
    
    
}


-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if ([viewController isKindOfClass:[YYBaseViewController class]]) {
        
        YYBaseViewController * vc = (YYBaseViewController *)viewController;
        if (vc.isHidenNaviBar) {
            vc.view.top = 0;
            [vc.navigationController setNavigationBarHidden:YES animated:animated];
        }else{
            vc.view.top = YYBarHeight;
            [vc.navigationController setNavigationBarHidden:NO animated:animated];
        }
    }
    
}



-(UIViewController *)childViewControllerForStatusBarStyle{
    
    return self.topViewController;
}



#pragma mark UIGestureRecognizer handlers

- (void)handleNavigationTransition:(UIScreenEdgePanGestureRecognizer*)recognizer
{
    CGFloat progress = [recognizer translationInView:self.view].x / (self.view.bounds.size.width);
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        
        CGPoint velocity = [recognizer velocityInView:recognizer.view];
        if (progress > 0.5 || velocity.x >100) {
            [self.interactivePopTransition finishInteractiveTransition];
        }
        else {
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition = nil;
    }
    
}




@end

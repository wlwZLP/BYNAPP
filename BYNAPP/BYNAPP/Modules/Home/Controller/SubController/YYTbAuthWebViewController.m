//
//  YYTbAuthWebViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/23.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYTbAuthWebViewController.h"


@interface YYTbAuthWebViewController ()<UIWebViewDelegate>


@end

@implementation YYTbAuthWebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    AlibcTradeShowParams * showParam = [[AlibcTradeShowParams alloc] init];
    showParam.openType = AlibcOpenTypeAuto;
    showParam.backUrl =[NSString stringWithFormat:@"tbopen%@://",@"22222"];
    showParam.isNeedPush = NO;
    showParam.linkKey = @"taobao_scheme";//拉起天猫
   
    AlibcTradeTaokeParams * taoKeParams=[[AlibcTradeTaokeParams alloc] init];
    
    taoKeParams.pid=nil;
    
    
    
    

}









@end

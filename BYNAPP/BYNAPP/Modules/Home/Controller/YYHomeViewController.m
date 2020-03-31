//
//  YYHomeViewController.m
//  BYNAPP
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYHomeViewController.h"

@interface YYHomeViewController ()

@end

@implementation YYHomeViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsHome];
  
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
        
//        YYNSLog(@"请求返回数据----%@",responseObject);
        
    } failure:^(NSError *error) {
        
        
        
    }];

 
    
}












@end

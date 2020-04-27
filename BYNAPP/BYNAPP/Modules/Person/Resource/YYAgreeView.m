//
//  YYAgreeView.m
//  BYNAPP
//
//  Created by apple on 2020/4/20.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYAgreeView.h"

@interface YYAgreeView ()

@property(nonatomic,strong)WKWebView * AgreeWkWebView;

@end

@implementation YYAgreeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
   
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        
        [self CreateHeaderView];

    }
    
    return self;
}


-(void)CreateHeaderView{
    
    UIView * CenterView = [[UIView alloc]init];
    CenterView.frame = CGRectMake(YYScreenWidth * 0.1, YYScreenHeight * 0.1, YYScreenWidth * 0.8, YYScreenHeight * 0.8);
    CenterView.backgroundColor = UIColor.whiteColor;
    [self addSubview:CenterView];
    [YYTools ChangeView:CenterView RadiusSize:8 BorderColor:[UIColor clearColor]];
    

    [CenterView addSubview:self.AgreeWkWebView];
    
    
    
    UIButton * OkBtn = UIButton.new;
    [OkBtn setTitle:@"好的" forState:UIControlStateNormal];
    OkBtn.frame = CGRectMake(20 , CenterView.ZLP_height - 60, CenterView.ZLP_width - 40, 44);
    OkBtn.backgroundColor = YYHexColor(@"#FFD409");
    [OkBtn addTarget:self action:@selector(OKButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [OkBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [CenterView addSubview:OkBtn];
    [YYTools ChangeView:OkBtn RadiusSize:8 BorderColor:[UIColor clearColor]];
    
    
}


-(void)setWebUrlString:(NSString *)WebUrlString{
    
    _WebUrlString = WebUrlString;
    
    [self.AgreeWkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.WebUrlString]]];
    
}



#pragma mark ===============GoodSWKWebView=============

- (WKWebView *)AgreeWkWebView {
        
    if (!_AgreeWkWebView) {
        
        WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        wkWebConfig.userContentController = wkUController;
        //自适应屏幕的宽度js
        NSString *jSString = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
        WKUserScript *wkUserScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        //添加js调用
        [wkUController addUserScript:wkUserScript];
        
        _AgreeWkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(12, 20 , YYScreenWidth * 0.8 - 24 , YYScreenHeight * 0.8 - 100) configuration:wkWebConfig];
        _AgreeWkWebView.backgroundColor = [UIColor whiteColor];
        _AgreeWkWebView.opaque = NO;
        _AgreeWkWebView.userInteractionEnabled = YES;
        _AgreeWkWebView.scrollView.bounces = NO;
        _AgreeWkWebView.scrollView.bounces = false;
        [_AgreeWkWebView sizeToFit];
        
        if (@available(ios 11.0,*)) {

           _AgreeWkWebView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

        }
        
     }
    
    return _AgreeWkWebView;
        
}


-(void)OKButtonClick{
    
    [[LPAnimationView sharedMask] dismiss];
    
}



@end

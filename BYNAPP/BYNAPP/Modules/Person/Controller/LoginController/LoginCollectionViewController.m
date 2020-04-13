//
//  LoginCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "LoginCollectionViewController.h"
#import "PhoneCollectionViewController.h"


@interface LoginCollectionViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UITextField * PhoneTextField;

@property (nonatomic,strong)UITextField * CodeTextField;

@property (nonatomic,strong)RACDisposable * disposable;

@property (nonatomic,assign)int time;

/// 判断手机号是否已经注册了，然后判断验证码是登录还是注册
@property (nonatomic,strong)NSString * GetCodeType;

@end

@implementation LoginCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    [self CreateLoginView];

    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
  
    
}


-(void)viewDidAppear:(BOOL)animated{
    
    [self.collectionView removeFromSuperview];
    
    [super viewDidAppear:animated];
    
}

- (void)CreateLoginView{
    
    UIView * MainBGView = UIView.new;
    MainBGView.backgroundColor = UIColor.whiteColor;
    MainBGView.frame = CGRectMake(0, 0, self.view.ZLP_width , self.view.ZLP_height);
    [self.view addSubview:MainBGView];
   
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"验证码登录";
    TitleLabel.frame = CGRectMake(28, 35 , 150 , 32);
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:23 weight:0];
    [MainBGView addSubview:TitleLabel];
    
    UILabel * PhoneLabel = [[UILabel alloc]init];
    PhoneLabel.text = @"为了您的账号安全，请用手机号登录";
    PhoneLabel.frame = CGRectMake(28, 78 , 250 , 20);
    PhoneLabel.textColor = YY99Color;
    PhoneLabel.textAlignment = NSTextAlignmentLeft;
    PhoneLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [MainBGView addSubview:PhoneLabel];
    
    UITextField * PhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(28, 134 , 280, 30)];
    PhoneTextField.placeholderColor = YY99Color;
    [PhoneTextField setXmg_Placeholder:@"请输入手机号"];
    PhoneTextField.font = [UIFont systemFontOfSize:14];
    PhoneTextField.borderStyle = UITextBorderStyleNone;
    PhoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    PhoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    [MainBGView addSubview:PhoneTextField];
    self.PhoneTextField = PhoneTextField;
    
    
    UIView * LLineView = UIView.new;
    LLineView.backgroundColor = YYE5Color;
    LLineView.frame = CGRectMake(28, 167 , self.view.ZLP_width - 56, 0.5);
    [MainBGView addSubview:LLineView];
    
    
    UITextField * CodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(28, 190 , 200, 30)];
    CodeTextField.placeholderColor = YY99Color;
    [CodeTextField setXmg_Placeholder:@"请输入验证码"];
    CodeTextField.font = [UIFont systemFontOfSize:14];
    CodeTextField.borderStyle = UITextBorderStyleNone;
    CodeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    CodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    [MainBGView addSubview:CodeTextField];
    self.CodeTextField = CodeTextField;
    
    
    UIView * MLineView = UIView.new;
    MLineView.backgroundColor = YYE5Color;
    MLineView.frame = CGRectMake(28, 227 , self.view.ZLP_width - 56, 0.5);
    [MainBGView addSubview:MLineView];
    
    
    UIView * GeView = UIView.new;
    GeView.backgroundColor = YYE5Color;
    GeView.frame = CGRectMake(self.view.ZLP_width - 126, 190 , 0.5, 20);
    [MainBGView addSubview:GeView];
    
    UIButton * CodeBtn = [[UIButton alloc]init];
    CodeBtn.backgroundColor = UIColor.clearColor;
    [CodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [CodeBtn setTitleColor:YYHexColor(@"#FFD409") forState:UIControlStateNormal];
    CodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    CodeBtn.frame = CGRectMake(GeView.ZLP_x + 10, 190 ,80, 20);
    [CodeBtn addTarget:self action:@selector(CodeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:CodeBtn];
    [[CodeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           if (self.PhoneTextField.text.length < 11) {
               [self.PhoneTextField shake];
               return;
           }
           self.time = 60;
           CodeBtn.enabled = NO;
           [CodeBtn setTitle:[NSString stringWithFormat:@"请稍等%d秒",self.time] forState:UIControlStateDisabled];
           self.disposable = [[RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
               //减去时间
               self.time --;
               //设置文本
               NSString *text = (self.time > 0) ? [NSString stringWithFormat:@"请稍等%d秒",self.time] : @"重新发送";
               if (self.time > 0) {
                   CodeBtn.enabled = NO;
                   [CodeBtn setTitle:text forState:UIControlStateDisabled];
               }else{
                   CodeBtn.enabled = YES;
                   [CodeBtn setTitle:text forState:UIControlStateNormal];
                   //关掉信号
                   [self.disposable dispose];
               }
               
           }];
       }];
 
    UIButton * LoginBtn = [[UIButton alloc]init];
    LoginBtn.backgroundColor = YYHexColor(@"#FFD409");
    [LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [LoginBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    LoginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    LoginBtn.frame = CGRectMake(28, 290 ,MainBGView.ZLP_width - 56, 44);
    [LoginBtn addTarget:self action:@selector(LoginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:LoginBtn];
    [YYTools ChangeView:LoginBtn RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    UIButton * ChoseBtn = [[UIButton alloc]init];
    [ChoseBtn setBackgroundImage:[UIImage imageNamed:@"gouxuan"] forState:UIControlStateNormal];
    [ChoseBtn setBackgroundImage:[UIImage imageNamed:@"Chose"] forState:UIControlStateSelected];
    ChoseBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    ChoseBtn.frame = CGRectMake(36, 350 ,15 , 15);
    [ChoseBtn addTarget:self action:@selector(ChoseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:ChoseBtn];
   
    UILabel * AggreLabel = [[UILabel alloc]init];
    AggreLabel.text = @"登录即代表同意《服务协议》和《隐私政策》";
    AggreLabel.frame = CGRectMake(55, 350 , 280 , 15);
    AggreLabel.textColor = YY99Color;
    AggreLabel.textAlignment = NSTextAlignmentLeft;
    AggreLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:AggreLabel];
    
    UILabel * QustLabel = [[UILabel alloc]init];
    QustLabel.text = @"—— 快捷登录 ——";
    QustLabel.textColor = YY99Color;
    QustLabel.frame = CGRectMake((YYScreenWidth -180)/2, 490, 180, 20);
    QustLabel.textAlignment = NSTextAlignmentCenter;
    QustLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [MainBGView addSubview:QustLabel];
    
    UIImageView * WchatImg = [[UIImageView alloc] init];
    WchatImg.backgroundColor = [UIColor clearColor];
    WchatImg.frame = CGRectMake(MainBGView.ZLP_centerX - 22, 520 ,44, 44);
    WchatImg.image = [UIImage imageNamed:@"wechat"];
    [MainBGView addSubview:WchatImg];
    [WchatImg addTarget:self action:@selector(WchatImgClick)];
    
  
}



-(void)CodeButtonClick{
    
    if (self.PhoneTextField.text.length < 11) {
        [self.PhoneTextField shake];
        return;
    }
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserExist];

    NSDictionary * dict = @{@"area_code":@"+86",@"phone":self.PhoneTextField.text};

    [PPNetworkTools POST:url parameters:dict success:^(id responseObject) {

        NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");

        NSString * is_exist = EncodeStringFromDic(Data, @"is_exist");

        if ([is_exist isEqualToString:@"1"]) {
             self.GetCodeType = @"2";
             
        }else{
             self.GetCodeType = @"1";
        }

        [self GetLoginViewCode];
        
    } failure:^(NSError *error, id responseCache) {



    }];
    

    
}


-(void)GetLoginViewCode{
    
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGetValidateCode];

    NSDictionary * dict = @{@"area_code":@"+86",@"phone":self.PhoneTextField.text,@"type":self.GetCodeType};

    [PPNetworkTools POST:url parameters:dict success:^(id responseObject) {

        
        
    } failure:^(NSError *error, id responseCache) {

        [self YYShowAlertViewTitle:@"网络错误，请稍后再试"];

    }];
    
    
    
}


-(void)LoginButtonClick{
    
    if (self.PhoneTextField.text.length < 11) {
[self.PhoneTextField shake];
        return;
    }
       
    if (self.CodeTextField.text.length < 4) {
        [self.CodeTextField shake];
        return;
    }
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserLogin];
    
    NSDictionary * dict = @{@"area_code":@"+86",@"phone":self.PhoneTextField.text,@"validate_code":self.CodeTextField.text};
    
    [PPNetworkTools POST:url parameters:dict success:^(id responseObject) {
        
        YYNSLog(@"用户请求登录接口---%@",responseObject);
        
        NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
        
        NSString * Token = EncodeStringFromDic(Data, @"token");
         
        [YYSaveTool SetCahceForvalue:Token forKey:YYToken];
      
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    } failure:^(NSError *error, id responseCache) {
    
        [self YYShowAlertViewTitle:@"网络错误，请稍后再试"];

    }];
    

}


-(void)WchatImgClick{
    
    PhoneCollectionViewController * PhoneVc = [[PhoneCollectionViewController alloc]init];
    PhoneVc.title = @"";
    [self.navigationController pushViewController:PhoneVc animated:YES];
   
    
}


-(void)ChoseButtonClick:(UIButton*)sender{
    
    sender.selected = !sender.selected;
    
    
}

#pragma mark 设置背景相片为空

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    
     return nil;
    
}



@end

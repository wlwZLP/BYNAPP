//
//  LoginCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "LoginCollectionViewController.h"
#import "PhoneCollectionViewController.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "YYAgreeView.h"

@interface LoginCollectionViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UITextField * PhoneTextField;

@property (nonatomic,strong)UITextField * CodeTextField;

@property (nonatomic,strong)UITextField * INVitTextField;

@property (nonatomic,strong)RACDisposable * disposable;

@property (nonatomic,assign)int time;

@property (nonatomic,strong)YYAgreeView * AgreeView;

/// 判断手机号是否已经注册了，1 表示未注册  2表示已经注册
@property (nonatomic,strong)NSString * UserIsExit;

/// 判断是否要填邀请人邀请码
@property (nonatomic,strong)UIView * PersonInVitView;

/// 判断是否勾选服务一些btn
@property (nonatomic,strong)UIButton * GouXuanBtn;

/// 获取邀请人头像
@property (nonatomic,strong)UIImageView * PersonInVitImg;

///  获取邀请人名字信息
@property (nonatomic,strong)UILabel * InvitNameLabel;

///  获取邀请人是否成功
@property (nonatomic,strong)NSString * InvitSucefulResult;

///  获取UserModel 数据
@property (nonatomic,strong)UserModel * UserModel;

@end

@implementation LoginCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    [self CreateLoginView];

    self.InvitSucefulResult = @"0";
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
     [[LPPopTool sharedInstance]closeAnimated:YES];
    
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
    
    
  
    if (IPhoneSE) {
        
         UIButton * LoginBtn = [[UIButton alloc]init];
         LoginBtn.backgroundColor = YYHexColor(@"#FFD409");
         [LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
         [LoginBtn setTitleColor:YY22Color forState:UIControlStateNormal];
         LoginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
         LoginBtn.frame = CGRectMake(28, 300 ,MainBGView.ZLP_width - 56, 44);
         [LoginBtn addTarget:self action:@selector(LoginButtonClick) forControlEvents:UIControlEventTouchUpInside];
         [MainBGView addSubview:LoginBtn];
         [YYTools ChangeView:LoginBtn RadiusSize:10 BorderColor:[UIColor clearColor]];
         
         UIButton * ChoseBtn = [[UIButton alloc]init];
         [ChoseBtn setBackgroundImage:[UIImage imageNamed:@"gouxuan"] forState:UIControlStateNormal];
         [ChoseBtn setBackgroundImage:[UIImage imageNamed:@"Chose"] forState:UIControlStateSelected];
         ChoseBtn.titleLabel.font = [UIFont systemFontOfSize:16];
         ChoseBtn.frame = CGRectMake(36, 360 ,15 , 15);
         [ChoseBtn addTarget:self action:@selector(ChoseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
         [MainBGView addSubview:ChoseBtn];
        
         UILabel * AggreLabel = [[UILabel alloc]init];
         AggreLabel.text = @"登录即代表同意《服务协议》和《隐私政策》";
         AggreLabel.frame = CGRectMake(55, 360 , 280 , 15);
         AggreLabel.textColor = YY99Color;
         AggreLabel.textAlignment = NSTextAlignmentLeft;
         AggreLabel.font = [UIFont systemFontOfSize:12 weight:0];
         [MainBGView addSubview:AggreLabel];
         
         UILabel * QustLabel = [[UILabel alloc]init];
         QustLabel.text = @"—— 快捷登录 ——";
         QustLabel.textColor = YY99Color;
         QustLabel.frame = CGRectMake((YYScreenWidth -180)/2, 410, 180, 20);
         QustLabel.textAlignment = NSTextAlignmentCenter;
         QustLabel.font = [UIFont systemFontOfSize:14 weight:0];
         [MainBGView addSubview:QustLabel];
         
         UIImageView * WchatImg = [[UIImageView alloc] init];
         WchatImg.backgroundColor = [UIColor clearColor];
         WchatImg.frame = CGRectMake(MainBGView.ZLP_centerX - 22, 450 ,44, 44);
         WchatImg.image = [UIImage imageNamed:@"wechat"];
         [MainBGView addSubview:WchatImg];
         [WchatImg addTarget:self action:@selector(WchatImgClick)];
         if ([[UMSocialManager defaultManager]isInstall:UMSocialPlatformType_WechatSession] == NO) {
            WchatImg.hidden = YES;
            QustLabel.hidden = YES;
         } else {
            WchatImg.hidden = NO;
            QustLabel.hidden = NO;
         }
        
        
        
    }else{
        
        UIButton * LoginBtn = [[UIButton alloc]init];
        LoginBtn.backgroundColor = YYHexColor(@"#FFD409");
        [LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [LoginBtn setTitleColor:YY22Color forState:UIControlStateNormal];
        LoginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        LoginBtn.frame = CGRectMake(28, 340 ,MainBGView.ZLP_width - 56, 44);
        [LoginBtn addTarget:self action:@selector(LoginButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [MainBGView addSubview:LoginBtn];
        [YYTools ChangeView:LoginBtn RadiusSize:10 BorderColor:[UIColor clearColor]];
        
        UIButton * ChoseBtn = [[UIButton alloc]init];
        [ChoseBtn setBackgroundImage:[UIImage imageNamed:@"gouxuan"] forState:UIControlStateNormal];
        [ChoseBtn setBackgroundImage:[UIImage imageNamed:@"Chose"] forState:UIControlStateSelected];
        ChoseBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        ChoseBtn.frame = CGRectMake(36, 400 ,15 , 15);
        [ChoseBtn addTarget:self action:@selector(ChoseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [MainBGView addSubview:ChoseBtn];
        NSString * AgreeLishi = [YYSaveTool GetCacheForKey:YYAgreeXieyi];
        if ([AgreeLishi isEqualToString:@"0"]) {
            ChoseBtn.selected = NO;
        }else{
            ChoseBtn.selected = YES;
        }
        self.GouXuanBtn = ChoseBtn;
       
        UILabel * AggreLabel = [[UILabel alloc]init];
        AggreLabel.text = @"登录即代表同意《服务协议》和《隐私政策》";
        AggreLabel.frame = CGRectMake(55, 400 , 280 , 15);
        AggreLabel.textColor = YY99Color;
        AggreLabel.textAlignment = NSTextAlignmentLeft;
        AggreLabel.font = [UIFont systemFontOfSize:12 weight:0];
        [MainBGView addSubview:AggreLabel];
        NSMutableAttributedString * AggreString = [[NSMutableAttributedString alloc] initWithString:AggreLabel.text];
        NSRange Range1 = NSMakeRange(7, 6);
        NSRange Range2 = NSMakeRange(14, 6);
        [AggreString addAttribute:NSForegroundColorAttributeName value:YYRGBColor(20, 138, 255) range:Range1];
        [AggreString addAttribute:NSForegroundColorAttributeName value:YYRGBColor(20, 138, 255) range:Range2];
        [AggreLabel setAttributedText:AggreString];
        [AggreLabel yb_addAttributeTapActionWithStrings:@[@"《服务协议》",@"《隐私政策》"] tapClicked:^(NSString * string, NSRange range, NSInteger index) {
            
          if ([string containsString:@"服务协议"] == YES) {
               [[LPAnimationView sharedMask] show:self.AgreeView withType:QWAlertViewStyleAlert];
               self.AgreeView.WebUrlString = @"http://www.biyingniao.com/articles/5";
          }else{
               [[LPAnimationView sharedMask] show:self.AgreeView withType:QWAlertViewStyleAlert];
               self.AgreeView.WebUrlString = @"http://www.biyingniao.com/articles/17";
          }
            
      }];
        
      
        UILabel * QustLabel = [[UILabel alloc]init];
        QustLabel.text = @"—— 快捷登录 ——";
        QustLabel.textColor = YY99Color;
        QustLabel.frame = CGRectMake((YYScreenWidth -180)/2, 500, 180, 20);
        QustLabel.textAlignment = NSTextAlignmentCenter;
        QustLabel.font = [UIFont systemFontOfSize:14 weight:0];
        [MainBGView addSubview:QustLabel];
        
        UIImageView * WchatImg = [[UIImageView alloc] init];
        WchatImg.backgroundColor = [UIColor clearColor];
        WchatImg.frame = CGRectMake(MainBGView.ZLP_centerX - 22, 540 ,44, 44);
       WchatImg.image = [UIImage imageNamed:@"wechat"];
       [MainBGView addSubview:WchatImg];
       [WchatImg addTarget:self action:@selector(WchatImgClick)];

        
    }

}


/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
-(UIView *)PersonInVitView
{
    
    if (_PersonInVitView == nil) {
        
        _PersonInVitView = [[UIView alloc] initWithFrame:CGRectMake(28, 230 , YYScreenWidth - 56 , 60)];
        
        _PersonInVitView.backgroundColor = UIColor.whiteColor;
        
        UITextField * InvitTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 20 , 200, 30)];
        InvitTextField.placeholderColor = YY99Color;
        [InvitTextField setXmg_Placeholder:@"请输入邀请码"];
        InvitTextField.font = [UIFont systemFontOfSize:14];
        InvitTextField.borderStyle = UITextBorderStyleNone;
        InvitTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        InvitTextField.keyboardType = UIKeyboardTypeNumberPad;
        [_PersonInVitView addSubview:InvitTextField];
        [InvitTextField addTarget:self action:@selector(InvitTextchangedField:) forControlEvents:UIControlEventEditingChanged];
        self.INVitTextField = InvitTextField;
        
        UIImageView * InvitImgView = [[UIImageView alloc] init];
        InvitImgView.backgroundColor = [UIColor clearColor];
        InvitImgView.frame = CGRectMake(YYScreenWidth - 150, 22 ,30 , 30);
        InvitImgView.image = [UIImage imageNamed:@"MainBG"];
        [YYTools ChangeView:InvitImgView RadiusSize:15 BorderColor:[UIColor clearColor]];
        [_PersonInVitView addSubview:InvitImgView];
        self.PersonInVitImg = InvitImgView;
        
        UILabel * InvitNameLabel = [[UILabel alloc]init];
        InvitNameLabel.text = @"邀请人昵称";
        InvitNameLabel.textColor = YY99Color;
        InvitNameLabel.frame = CGRectMake(YYScreenWidth - 110, 25 ,70 , 25);
        InvitNameLabel.textAlignment = NSTextAlignmentLeft;
        InvitNameLabel.font = [UIFont systemFontOfSize:12 weight:0];
        [_PersonInVitView addSubview:InvitNameLabel];
        self.InvitNameLabel = InvitNameLabel;
        
        UIView * YLineView = UIView.new;
        YLineView.backgroundColor = YYE5Color;
        YLineView.frame = CGRectMake(0, 59 , YYScreenWidth - 56 , 0.5);
        [_PersonInVitView addSubview:YLineView];
        
     }
    
    return _PersonInVitView;
    
}


-(YYAgreeView*)AgreeView{
    
    if (!_AgreeView) {
        _AgreeView = [[YYAgreeView alloc]init];
        _AgreeView.frame = CGRectMake(0, 0, YYScreenWidth, YYScreenHeight);
    }
    return _AgreeView;
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

         if ([is_exist isEqualToString:@"0"]) {
#pragma mark ===============表示是新用户，未注册用户============
             self.UserIsExit = @"1";
             [[LPPopTool sharedInstance]popView:self.PersonInVitView animated:YES];
             
         }else{
 #pragma mark ===============老用户,获取验证码登录============
            self.UserIsExit = @"2";
         }
 
         [self GetLoginViewCode];
        
    } failure:^(NSError *error, id responseCache) {

    

    }];
    

    
}


-(void)GetLoginViewCode{
    
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGetValidateCode];

    NSDictionary * dict = @{@"area_code":@"+86",@"phone":self.PhoneTextField.text,@"type":self.UserIsExit};

    [PPNetworkTools POST:url parameters:dict success:^(id responseObject) {

        
        
    } failure:^(NSError *error, id responseCache) {

          [self YYShowAlertViewTitle:@"网络错误，请稍后再试"];

    }];
    
    
}



-(void)LoginButtonClick{
    
    if (self.GouXuanBtn.selected == NO) {
        [self YYShowMessage:@"请阅读并同意服务协议"];
        return;
    }
    
    if (self.PhoneTextField.text.length < 11) {
        [self.PhoneTextField shake];
        return;
    }
       
    if (self.CodeTextField.text.length < 4) {
        [self.CodeTextField shake];
        return;
    }
    
    if ([ self.UserIsExit isEqualToString:@"1"]) {
         
#pragma mark ===============表示是新用户，进行注册APIUserRegister============
        if (self.INVitTextField.text.length < 4) {
            [self.INVitTextField shake];
            return;
        }
        
       NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserRegister];
      
       NSDictionary * dict = @{@"area_code":@"+86",@"phone":self.PhoneTextField.text,@"validate_code":self.CodeTextField.text,@"recommend_code":self.INVitTextField.text};
      
       [PPNetworkTools POST:url parameters:dict success:^(id responseObject) {
          
            if ([EncodeStringFromDic(responseObject, @"code") isEqualToString:@"0"]) {
              
                 NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
                
                 NSString * Token = EncodeStringFromDic(Data, @"token");
                 
                 [YYSaveTool SetCahceForvalue:Token forKey:YYToken];
              
                 [self GetPersonUserNetworkData];
              
           }else{
              
                [self YYShowAlertViewTitle:EncodeStringFromDic(responseObject, @"msg")];
              
           }
          
      } failure:^(NSError *error, id responseCache) {
      
            [self YYShowAlertViewTitle:@"网络错误，请稍后再试"];

      }];
           
    }else{
        
#pragma mark ===============老用户,进行登录APIUserLogin============
        
       NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserLogin];
       
       NSDictionary * dict = @{@"area_code":@"+86",@"phone":self.PhoneTextField.text,@"validate_code":self.CodeTextField.text};
       
       [PPNetworkTools POST:url parameters:dict success:^(id responseObject) {
           
           if ([EncodeStringFromDic(responseObject, @"code") isEqualToString:@"0"]) {
              
                 NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
                
                 NSString * Token = EncodeStringFromDic(Data, @"token");
                
                 [YYSaveTool SetCahceForvalue:Token forKey:YYToken];
               
                 [self GetPersonUserNetworkData];
              
           }else{
              
                [self YYShowAlertViewTitle:EncodeStringFromDic(responseObject, @"msg")];
              
           }
           
       } failure:^(NSError *error, id responseCache) {
       
           [self YYShowAlertViewTitle:@"网络错误，请稍后再试"];

       }];
           
    }
    
}


#pragma mark ===============获取个人用户信息数据=============

-(void)GetPersonUserNetworkData{
    
     
   NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVUserInfo];
   
   [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
       
        NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
        
        if (Data.count == 0) {
        
             [YYSaveTool SetCahceForvalue:@"0" forKey:YYLogin];
            
             [YYSaveTool RemoveCacheForKey:YYToken];
            
             [self.navigationController popViewControllerAnimated:YES];
            
        }else{
         
             [YYSaveTool SetCahceForvalue:@"1" forKey:YYLogin];
            
             self.UserModel = [UserModel modelWithDictionary:Data];
            
             [YYSaveTool YY_SaveModel:self.UserModel key:YYUser];
            
             [self.navigationController popViewControllerAnimated:YES];
            
        }
   
        [self.collectionView reloadData];
       
   } failure:^(NSError *error, id responseCache) {
       
        [self.collectionView reloadData];

   }];
          
    
}

#pragma mark ===============监听UITextField 获取邀请人信息=============

-(void)InvitTextchangedField:(UITextField*)textField
{
    
    if (textField.text.length >= 6) {
        
        NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserRecommendor];
        
        NSDictionary * dict = @{@"recommend_code":self.INVitTextField.text};
        
        [PPNetworkTools POST:url parameters:dict success:^(id responseObject) {
           
            if ([EncodeStringFromDic(responseObject, @"code") isEqualToString:@"0"]) {
                
                self.InvitSucefulResult = @"1";
                
                NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
                           
                [self.PersonInVitImg sd_setImageWithURL:[NSURL URLWithString:EncodeStringFromDic(Data, @"avatar")] placeholderImage:[UIImage imageNamed:@"MainBg"]];
                           
                self.InvitNameLabel.text = EncodeStringFromDic(Data, @"name");
                
                
             }else{
                
                self.InvitSucefulResult = @"0";
                
             }
        
        } failure:^(NSError *error, id responseCache) {
         
              [self YYShowAlertViewTitle:@"网络错误，请稍后再试"];
            
        }];
    
    }
    
    
}


-(void)WchatImgClick{
    
   
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:self completion:^(id result, NSError *error) {
           
           if (error) {
               
               [self YYShowMessage:error.localizedFailureReason];
   
           } else {
               
               UMSocialUserInfoResponse * resp = result;
               
               NSDictionary * OriginDic = resp.originalResponse;
               
               NSString * City;
               if (!EncodeStringFromDic(OriginDic, @"city")) {
                   City =EncodeStringFromDic(OriginDic, @"city");
               }else{
                   City  =@"杭州";
               }
               NSString * country;
               if (!EncodeStringFromDic(OriginDic, @"country")) {
                   country =EncodeStringFromDic(OriginDic, @"province");
               }else{
                   country  =@"杭州";
               }
               NSString * province;
               if (!EncodeStringFromDic(OriginDic, @"province")) {
                   province =EncodeStringFromDic(OriginDic, @"province");
               }else{
                   province  =@"浙江";
               }
               
            //    PhoneCollectionViewController * PhoneVc = [[PhoneCollectionViewController alloc]init];
            //    PhoneVc.title = @"";
            //    [self.navigationController pushViewController:PhoneVc animated:YES];
            
           }
        
           
       }];
    


    
}


-(void)ChoseButtonClick:(UIButton*)sender{
    
    NSString * AgreeLishi = [YYSaveTool GetCacheForKey:YYAgreeXieyi];
    
    if ([AgreeLishi isEqualToString:@"0"]) {
        [YYSaveTool SetCahceForvalue:@"1" forKey:YYAgreeXieyi];
    }
    
    sender.selected = !sender.selected;
    
    
}

#pragma mark 设置背景相片为空

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    
     return nil;
    
}



@end

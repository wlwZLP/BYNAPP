//
//  PhoneCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "PhoneCollectionViewController.h"


@interface PhoneCollectionViewController ()



@end

@implementation PhoneCollectionViewController



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
       TitleLabel.text = @"绑定手机号";
       TitleLabel.frame = CGRectMake(28, 35 , 150 , 32);
       TitleLabel.textColor = YY33Color;
       TitleLabel.textAlignment = NSTextAlignmentLeft;
       TitleLabel.font = [UIFont systemFontOfSize:23 weight:0];
       [MainBGView addSubview:TitleLabel];

       
       UITextField * PhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(28, 104 ,200, 30)];
       PhoneTextField.placeholderColor = YY99Color;
       [PhoneTextField setXmg_Placeholder:@"请输入手机号"];
       PhoneTextField.font = [UIFont systemFontOfSize:14];
       PhoneTextField.borderStyle = UITextBorderStyleNone;
       PhoneTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
       PhoneTextField.keyboardType = UIKeyboardTypeNumberPad;
       [MainBGView addSubview:PhoneTextField];
       
       UIView * LLineView = UIView.new;
       LLineView.backgroundColor = YYE5Color;
       LLineView.frame = CGRectMake(28, 137 , self.view.ZLP_width - 56, 0.5);
       [MainBGView addSubview:LLineView];
       
       
       UITextField * CodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(28, 160 , 200, 30)];
       CodeTextField.placeholderColor = YY99Color;
       [CodeTextField setXmg_Placeholder:@"请输入验证码"];
       CodeTextField.font = [UIFont systemFontOfSize:14];
       CodeTextField.borderStyle = UITextBorderStyleNone;
       CodeTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
       CodeTextField.keyboardType = UIKeyboardTypeNumberPad;
       [MainBGView addSubview:CodeTextField];
       
       UIView * MLineView = UIView.new;
       MLineView.backgroundColor = YYE5Color;
       MLineView.frame = CGRectMake(28, 200 , self.view.ZLP_width - 56, 0.5);
       [MainBGView addSubview:MLineView];
       
       
       UIView * GeView = UIView.new;
       GeView.backgroundColor = YYE5Color;
       GeView.frame = CGRectMake(self.view.ZLP_width - 126, 160 , 0.5, 20);
       [MainBGView addSubview:GeView];
       
       UIButton * CodeBtn = [[UIButton alloc]init];
       CodeBtn.backgroundColor = UIColor.clearColor;
       [CodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
       [CodeBtn setTitleColor:YYHexColor(@"#FFD409") forState:UIControlStateNormal];
       CodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
       CodeBtn.frame = CGRectMake(GeView.ZLP_x + 10, 160 ,80, 20);
       [CodeBtn addTarget:self action:@selector(CodeButtonClick) forControlEvents:UIControlEventTouchUpInside];
       [MainBGView addSubview:CodeBtn];

    
       UIButton * LoginBtn = [[UIButton alloc]init];
       LoginBtn.backgroundColor = YYHexColor(@"#FFD409");
       [LoginBtn setTitle:@"绑定手机号" forState:UIControlStateNormal];
       [LoginBtn setTitleColor:YY22Color forState:UIControlStateNormal];
       LoginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
       LoginBtn.frame = CGRectMake(28, 260 ,MainBGView.ZLP_width - 56, 44);
       [LoginBtn addTarget:self action:@selector(LoginButtonClick) forControlEvents:UIControlEventTouchUpInside];
       [MainBGView addSubview:LoginBtn];
       [YYTools ChangeView:LoginBtn RadiusSize:20 BorderColor:[UIColor clearColor]];
       
       UIButton * ChoseBtn = [[UIButton alloc]init];
       [ChoseBtn setBackgroundImage:[UIImage imageNamed:@"gouxuan"] forState:UIControlStateNormal];
       [ChoseBtn setBackgroundImage:[UIImage imageNamed:@"Chose"] forState:UIControlStateSelected];
       ChoseBtn.titleLabel.font = [UIFont systemFontOfSize:16];
       ChoseBtn.frame = CGRectMake(36, 320 ,15 , 15);
       [ChoseBtn addTarget:self action:@selector(ChoseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
       [MainBGView addSubview:ChoseBtn];
      
       UILabel * AggreLabel = [[UILabel alloc]init];
       AggreLabel.text = @"登录即代表同意《服务协议》和《隐私政策》";
       AggreLabel.frame = CGRectMake(58, 320 , 280 , 15);
       AggreLabel.textColor = YY99Color;
       AggreLabel.textAlignment = NSTextAlignmentLeft;
       AggreLabel.font = [UIFont systemFontOfSize:12 weight:0];
       [MainBGView addSubview:AggreLabel];
  
    
}


-(void)YYBaseLeftBackRightClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}



-(void)CodeButtonClick{
    
  
    
    
}


-(void)LoginButtonClick{
    
    

}



-(void)ChoseButtonClick:(UIButton*)sender{
    
    sender.selected = !sender.selected;
    
    
}

#pragma mark 设置背景相片为空

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    
     return nil;
    
}



@end



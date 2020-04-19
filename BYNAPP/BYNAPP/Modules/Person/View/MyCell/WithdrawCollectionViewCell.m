//
//  WithdrawCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "WithdrawCollectionViewCell.h"

@implementation WithdrawCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
       
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIView * MainView = [[UIView alloc] init];
    MainView.backgroundColor = UIColor.whiteColor;
    MainView.frame = CGRectMake(12 , 0, YYScreenWidth - 24, 220);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView  RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.textColor = YY22Color;
    TitleLabel.text =@"提现至";
    TitleLabel.frame = CGRectMake(22, 24, 60, 16);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [MainView addSubview:TitleLabel];
    
    UIButton * PayBtn = [[UIButton alloc]init];
    [PayBtn setTitle:@"支付宝" forState:UIControlStateNormal];
    PayBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    PayBtn.frame = CGRectMake(22, 56 , 74 , 28 );
    PayBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [PayBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [PayBtn setTitleColor:YY22Color forState:UIControlStateSelected];
    [PayBtn setBackgroundImage:[UIImage imageWithColor:YYMMColor] forState:UIControlStateSelected];
    [PayBtn setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forState:UIControlStateNormal];
    PayBtn.selected = YES;
    [MainView addSubview:PayBtn];
    [YYTools ChangeView:PayBtn RadiusSize:8 BorderColor:UIColor.clearColor];
    
    
    UIButton * WChatBtn = [[UIButton alloc]init];
    [WChatBtn setTitle:@"微信" forState:UIControlStateNormal];
    WChatBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    WChatBtn.frame = CGRectMake(126 , 56 , 74 , 28 );
    WChatBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [WChatBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [WChatBtn setTitleColor:YY22Color forState:UIControlStateSelected];
    [WChatBtn setBackgroundImage:[UIImage imageWithColor:YYMMColor] forState:UIControlStateSelected];
    [WChatBtn setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forState:UIControlStateNormal];
    WChatBtn.selected = NO;
    [MainView addSubview:WChatBtn];
    [YYTools ChangeView:WChatBtn RadiusSize:8 BorderColor:YY22Color];
    
    UITextField * ACCTextField = [[UITextField alloc] initWithFrame:CGRectMake(22, 105 , 300, 30)];
    ACCTextField.placeholderColor = YY99Color;
    [ACCTextField setXmg_Placeholder:@"(必填)请输入实名认证的账号"];
    ACCTextField.font = [UIFont systemFontOfSize:14];
    ACCTextField.borderStyle = UITextBorderStyleNone;
    ACCTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    ACCTextField.keyboardType = UIKeyboardTypeNumberPad;
    [MainView addSubview:ACCTextField];
    
    UIView * FLineView = UIView.new;
    FLineView.backgroundColor = YYE5Color;
    FLineView.frame = CGRectMake(16, 137, MainView.ZLP_width -32, 0.5);
    [MainView addSubview:FLineView];
    
    UITextField * NameTextField = [[UITextField alloc] initWithFrame:CGRectMake(22, 160 , 300, 30)];
    NameTextField.placeholderColor = YY99Color;
    [NameTextField setXmg_Placeholder:@"(必填)请输入对应支付宝号的认证姓名"];
    NameTextField.font = [UIFont systemFontOfSize:14];
    NameTextField.borderStyle = UITextBorderStyleNone;
    NameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    NameTextField.keyboardType = UIKeyboardTypeNumberPad;
    [MainView addSubview:NameTextField];
    
    UIView * SLineView = UIView.new;
    SLineView.backgroundColor = YYE5Color;
    SLineView.frame = CGRectMake(16, 192, MainView.ZLP_width -32, 0.5);
    [MainView addSubview:SLineView];
    
  
    

    
    
}


-(void)WithdrawButtonClick{
    
    

    
}



@end

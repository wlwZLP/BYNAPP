//
//  TaoBaoCollectionViewCell.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/19.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "TaoBaoCollectionViewCell.h"

@implementation TaoBaoCollectionViewCell

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
    MainView.frame = CGRectMake(12 , 10, YYScreenWidth - 24, 120);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView  RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    UILabel * AccountLabel = [[UILabel alloc]init];
    AccountLabel.text = @"支付宝";
    AccountLabel.frame = CGRectMake(12, 20, 50 , 20);
    AccountLabel.textColor = YY33Color;
    AccountLabel.textAlignment = NSTextAlignmentLeft;
    AccountLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainView addSubview:AccountLabel];
    
    UITextField * NameTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 10 , 200, 40)];
    NameTextField.placeholderColor = YY99Color;
    [NameTextField setXmg_Placeholder:@"请输入支付宝号账户"];
    NameTextField.font = [UIFont systemFontOfSize:14];
    NameTextField.borderStyle = UITextBorderStyleNone;
    NameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    NameTextField.keyboardType = UIKeyboardTypeNumberPad;
    [MainView addSubview:NameTextField];
    self.PayAccountField = NameTextField;
    
    UIView * FLineView = UIView.new;
    FLineView.backgroundColor = YYE5Color;
    FLineView.frame = CGRectMake(10, 60, MainView.ZLP_width - 20, 0.5);
    [MainView addSubview:FLineView];
    
    UILabel * NameLabel = [[UILabel alloc]init];
    NameLabel.text = @"姓    名";
    NameLabel.frame = CGRectMake(12, 80, 50, 20);
    NameLabel.textColor = YY33Color;
    NameLabel.textAlignment = NSTextAlignmentLeft;
    NameLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainView addSubview:NameLabel];

    UITextField * ACCTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 75 , 300, 30)];
    ACCTextField.placeholderColor = YY99Color;
    [ACCTextField setXmg_Placeholder:@"请输入实支付宝姓名"];
    ACCTextField.font = [UIFont systemFontOfSize:14];
    ACCTextField.borderStyle = UITextBorderStyleNone;
    ACCTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    ACCTextField.keyboardType = UIKeyboardTypeNumberPad;
    [MainView addSubview:ACCTextField];
    self.PayNameField = ACCTextField;
    
    
    
}







@end

//
//  MyWithTopCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyWithTopCollectionViewCell.h"

@interface MyWithTopCollectionViewCell ()



@end


@implementation MyWithTopCollectionViewCell


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
    MainView.frame = CGRectMake(12 , 0, YYScreenWidth - 24, self.ZLP_height);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView  RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.textColor = YY22Color;
    TitleLabel.text =@"提现金额";
    TitleLabel.frame = CGRectMake(22, 24, 60, 16);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [MainView addSubview:TitleLabel];
    
    
    UIButton * RecordBtn = [[UIButton alloc]init];
    [RecordBtn setTitle:@"提现记录" forState:UIControlStateNormal];
    RecordBtn.frame = CGRectMake(MainView.ZLP_width - 100, 24, 80, 16);
    RecordBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [RecordBtn setTitleColor:YY99Color forState:UIControlStateNormal];
    [RecordBtn addTarget:self action:@selector(RecordBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [MainView addSubview:RecordBtn];
    
    UILabel * MoneyLabel = [[UILabel alloc]init];
    MoneyLabel.textColor = YY22Color;
    MoneyLabel.text =@"¥";
    MoneyLabel.frame = CGRectMake(22, 52 , 15 , 38);
    MoneyLabel.textAlignment = NSTextAlignmentLeft;
    MoneyLabel.font = [UIFont systemFontOfSize:24 weight:0];
    [MainView addSubview:MoneyLabel];
    
    UITextField * MoneyTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 56 , 200, 34)];
    MoneyTextField.placeholderColor = YY99Color;
    [MoneyTextField setXmg_Placeholder:@"请输入提现金额"];
    MoneyTextField.font = [UIFont systemFontOfSize:14];
    MoneyTextField.borderStyle = UITextBorderStyleNone;
    MoneyTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    MoneyTextField.keyboardType = UIKeyboardTypeNumberPad;
    [MainView addSubview:MoneyTextField];

    
    UIView * FLineView = UIView.new;
    FLineView.backgroundColor = YYE5Color;
    FLineView.frame = CGRectMake(22, 94 , MainView.ZLP_width -44, 0.5);
    [MainView addSubview:FLineView];
    
    
    UILabel * BotLabel = [[UILabel alloc]init];
    BotLabel.textColor = YYHexColor(@"#FFD409");
    BotLabel.text =@"可提现佣金¥250.50, 全部提现";
    BotLabel.frame = CGRectMake(22, 105 , MainView.ZLP_width - 44 , 20);
    BotLabel.textAlignment = NSTextAlignmentLeft;
    BotLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [MainView addSubview:BotLabel];
   

    
}



-(void)RecordBtnClick{
    
    
    self.MyRecordBtnBlockClick();
    
    
}







@end

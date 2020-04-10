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
    
    UIView * TopBGView = [[UIView alloc] init];
    TopBGView.frame = CGRectMake(0, 0, YYScreenWidth, 230);
    [self addSubview:TopBGView];
    [TopBGView.layer addSublayer:[YYTools SetGradLayerView:TopBGView FromColor:@"#FFDD39" ToColor:@"#FFD117"]];
    
    UIView * MainView = [[UIView alloc] init];
    MainView.backgroundColor = UIColor.whiteColor;
    MainView.frame = CGRectMake(12 , 140, YYScreenWidth - 24, 360);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView  RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    UIView * FLineView = UIView.new;
    FLineView.backgroundColor = YYE5Color;
    FLineView.frame = CGRectMake(16, 65, MainView.ZLP_width -32, 0.5);
    [MainView addSubview:FLineView];
    
    
    
    UIView * SLineView = UIView.new;
    SLineView.backgroundColor = YYE5Color;
    SLineView.frame = CGRectMake(16, 130, MainView.ZLP_width -32, 0.5);
    [MainView addSubview:SLineView];
    
    
    
    
    UIView * TLineView = UIView.new;
    TLineView.backgroundColor = YYE5Color;
    TLineView.frame = CGRectMake(16, 240, MainView.ZLP_width -32, 0.5);
    [MainView addSubview:TLineView];
    
    UIButton * WithdrawBtn = [[UIButton alloc] initWithFrame:CGRectMake(18, 280 , MainView.ZLP_width - 36 , 45)];
    [WithdrawBtn addTarget:self action:@selector(WithdrawButtonClick) forControlEvents:UIControlEventTouchUpInside];
    WithdrawBtn.backgroundColor = YYHexColor(@"#FFD409");
    [WithdrawBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [WithdrawBtn setTitle:@"提现" forState:UIControlStateNormal];
    [WithdrawBtn.titleLabel setFont :[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [MainView addSubview:WithdrawBtn];
    [YYTools ChangeView:WithdrawBtn RadiusSize:16 BorderColor:YYHexColor(@"#FFD409")];
    
    
}


-(void)WithdrawButtonClick{
    
    
    
    
    
    
}


@end

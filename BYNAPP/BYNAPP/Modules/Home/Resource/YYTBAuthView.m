//
//  YYTBAuthView.m
//  BYNAPP
//
//  Created by apple on 2020/4/23.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYTBAuthView.h"

@implementation YYTBAuthView

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
    CenterView.frame = CGRectMake(YYScreenWidth * 0.1, YYScreenHeight * 0.2, YYScreenWidth * 0.8, YYScreenHeight * 0.6);
    CenterView.backgroundColor = UIColor.whiteColor;
    [self addSubview:CenterView];
    [YYTools ChangeView:CenterView RadiusSize:8 BorderColor:[UIColor clearColor]];
    
    UIImageView * MainBGView = UIImageView.new;
    MainBGView.frame = CGRectMake(CenterView.ZLP_width/2- 40 , 15 , 90, 90);
    MainBGView.image = [UIImage imageNamed:@"MainBG"];
//    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [CenterView addSubview:MainBGView];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"申请淘宝授权";
    TitleLabel.frame = CGRectMake(CenterView.ZLP_width/2 - 90, 120, 180, 25);
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.font = [UIFont systemFontOfSize:16 weight:1];
    [CenterView addSubview:TitleLabel];
    
    UILabel * CentLabel = [[UILabel alloc]init];
    CentLabel.text = @" 应淘宝要求，获得返佣前请先进行官方授权!神犬APP是淘宝联盟“官方优质合作伙伴”，查优惠、赚佣金，使用更安心!";
    CentLabel.frame = CGRectMake(20, 150, CenterView.ZLP_width - 40, CenterView.ZLP_height - 210);
    CentLabel.numberOfLines = 0;
    CentLabel.textColor = YY99Color;
    CentLabel.textAlignment = NSTextAlignmentCenter;
    CentLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [CenterView addSubview:CentLabel];
    
   
   UIButton * AuthBtn = UIButton.new;
   [AuthBtn setTitle:@"前往淘宝授权" forState:UIControlStateNormal];
   AuthBtn.frame = CGRectMake(20 , CenterView.ZLP_height - 60, CenterView.ZLP_width - 40, 44);
   AuthBtn.backgroundColor = YYHexColor(@"#FFD409");
   [AuthBtn addTarget:self action:@selector(AuthButtonClick) forControlEvents:UIControlEventTouchUpInside];
   [AuthBtn setTitleColor:YY22Color forState:UIControlStateNormal];
   [CenterView addSubview:AuthBtn];
   [YYTools ChangeView:AuthBtn RadiusSize:8 BorderColor:[UIColor clearColor]];
    
    
}



-(void)AuthButtonClick{
    
    self.AuthButtonBlockClick();
    
    
}



@end

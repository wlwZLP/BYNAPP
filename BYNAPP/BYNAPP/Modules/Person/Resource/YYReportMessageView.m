//
//  YYReportMessageView.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/27.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYReportMessageView.h"

@implementation YYReportMessageView

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
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"温馨提示";
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.textColor = YY22Color;
    TitleLabel.frame = CGRectMake(0 , 24 ,  CenterView.ZLP_width  , 24);
    TitleLabel.font = [UIFont systemFontOfSize:16 weight:0];
    [CenterView addSubview:TitleLabel];

    
    UILabel * ContengtLabel = [[UILabel alloc]init];
    ContengtLabel.textAlignment = NSTextAlignmentCenter;
    ContengtLabel.numberOfLines = 0;
    ContengtLabel.textColor = YY66Color;
    ContengtLabel.frame = CGRectMake(12 , 50 ,  CenterView.ZLP_width - 24 , CenterView.ZLP_height -110);
    ContengtLabel.font = [UIFont systemFontOfSize:16 weight:0];
    [CenterView addSubview:ContengtLabel];
    self.TitleTextlabel = ContengtLabel;
    
    
    UIButton * OkBtn = UIButton.new;
    [OkBtn setTitle:@"好的" forState:UIControlStateNormal];
    OkBtn.frame = CGRectMake(20 , CenterView.ZLP_height - 60, CenterView.ZLP_width - 40, 44);
    OkBtn.backgroundColor = YYHexColor(@"#FFD409");
    [OkBtn addTarget:self action:@selector(OKButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [OkBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [CenterView addSubview:OkBtn];
    [YYTools ChangeView:OkBtn RadiusSize:8 BorderColor:[UIColor clearColor]];
    
    
}




-(void)OKButtonClick{
    
    
    [[LPAnimationView sharedMask]dismiss];
    
    
}


@end

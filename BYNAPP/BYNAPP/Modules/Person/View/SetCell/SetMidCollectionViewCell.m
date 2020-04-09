//
//  SetMidCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "SetMidCollectionViewCell.h"

@implementation SetMidCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}

- (void)setup{
    
    UIView * MainBGView = UIView.new;
    MainBGView.backgroundColor = UIColor.whiteColor;
    MainBGView.frame = CGRectMake(12, 0, self.ZLP_width -24, self.ZLP_height);
    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [self addSubview:MainBGView];
    
    UILabel * WeixinLabel = [[UILabel alloc]init];
    WeixinLabel.text = @"微信";
    WeixinLabel.frame = CGRectMake(12, 20 , 50 , 21);
    WeixinLabel.textColor = YY22Color;
    WeixinLabel.textAlignment = NSTextAlignmentLeft;
    WeixinLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:WeixinLabel];
    
    UIImageView * RightImage1 = [[UIImageView alloc] init];
    RightImage1.backgroundColor = [UIColor clearColor];
    RightImage1.frame = CGRectMake(MainBGView.ZLP_width - 22, 26.5 ,8, 13);
    RightImage1.image = [UIImage imageNamed:@"SetRight"];
    [MainBGView addSubview:RightImage1];
    
    UIButton * WeiChatBtn = [[UIButton alloc]init];
    WeiChatBtn.backgroundColor = UIColor.clearColor;
    WeiChatBtn.frame = CGRectMake(MainBGView.ZLP_width - 50, 0 ,50, 60);
    [WeiChatBtn addTarget:self action:@selector(WeiChatButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:WeiChatBtn];
    
    UIView * FLineView = UIView.new;
    FLineView.backgroundColor = YYE5Color;
    FLineView.frame = CGRectMake(12, 60, MainBGView.ZLP_width -24, 1);
    [MainBGView addSubview:FLineView];
    
    UILabel * TaobaoLabel = [[UILabel alloc]init];
    TaobaoLabel.text = @"支付宝";
    TaobaoLabel.frame = CGRectMake(12, 80 , 50 , 21);
    TaobaoLabel.textColor = YY22Color;
    TaobaoLabel.textAlignment = NSTextAlignmentLeft;
    TaobaoLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:TaobaoLabel];
    
    UIImageView * RightImage2 = [[UIImageView alloc] init];
    RightImage2.backgroundColor = [UIColor clearColor];
    RightImage2.frame = CGRectMake(MainBGView.ZLP_width - 22, 86.5 ,8, 13);
    RightImage2.image = [UIImage imageNamed:@"SetRight"];
    [MainBGView addSubview:RightImage2];
    
    UIButton * TaobaoBtn = [[UIButton alloc]init];
    TaobaoBtn.backgroundColor = UIColor.clearColor;
    TaobaoBtn.frame = CGRectMake(MainBGView.ZLP_width - 50, 60 ,50, 60);
    [TaobaoBtn addTarget:self action:@selector(TaobaoButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:TaobaoBtn];
    
    UIView * SLineView = UIView.new;
    SLineView.backgroundColor = YYE5Color;
    SLineView.frame = CGRectMake(12, 120, MainBGView.ZLP_width -24, 1);
    [MainBGView addSubview:SLineView];
    
    UILabel * AutoLabel = [[UILabel alloc]init];
    AutoLabel.text = @"淘宝授权";
    AutoLabel.frame = CGRectMake(12, 140 , 80 , 21);
    AutoLabel.textColor = YY22Color;
    AutoLabel.textAlignment = NSTextAlignmentLeft;
    AutoLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:AutoLabel];
    
    UIImageView * RightImage3 = [[UIImageView alloc] init];
    RightImage3.backgroundColor = [UIColor clearColor];
    RightImage3.frame = CGRectMake(MainBGView.ZLP_width - 22, 146.5 ,8, 13);
    RightImage3.image = [UIImage imageNamed:@"SetRight"];
    [MainBGView addSubview:RightImage3];
    
    UIButton * AutoBtn = [[UIButton alloc]init];
    AutoBtn.backgroundColor = UIColor.clearColor;
    AutoBtn.frame = CGRectMake(MainBGView.ZLP_width - 50, 120 ,50, 60);
    [AutoBtn addTarget:self action:@selector(AutuButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:AutoBtn];
    
    
}


-(void)WeiChatButtonClick{
    
    self.WeiChatImgBtnBlockClick();
    
}

-(void)TaobaoButtonClick{
    
    self.TaoBaoBtnBlockClick();
    
}


-(void)AutuButtonClick{
    
     self.AutuBtnBlockClick();
    
}


@end

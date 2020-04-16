//
//  CouponCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "CouponCollectionViewCell.h"


@interface CouponCollectionViewCell ()

@end


@implementation CouponCollectionViewCell


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
    MainBGView.frame = CGRectMake(12, 10, self.ZLP_width - 24, self.ZLP_height -10);
    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [self addSubview:MainBGView];
  
    UIView * LeftView = [[UIView alloc] init];
    LeftView.backgroundColor = YYHexColor(@"#FFD117");
    LeftView.frame = CGRectMake(0, 0, 122 , MainBGView.ZLP_height);
    [MainBGView addSubview:LeftView];
    
    UILabel * PriceLabel = [[UILabel alloc]init];
    PriceLabel.text = @"&256.22";
    PriceLabel.textColor = YYHexColor(@"#372300");;
    PriceLabel.frame = CGRectMake(0, 30 , LeftView.ZLP_width , 35);
    PriceLabel.textAlignment = NSTextAlignmentCenter;
    PriceLabel.font = [UIFont systemFontOfSize:20 weight:2];
    [LeftView addSubview:PriceLabel];
    
    UILabel * TimeNameLabel = [[UILabel alloc]init];
    TimeNameLabel.text = @"保质期至";
    TimeNameLabel.frame = CGRectMake(0, 65, LeftView.ZLP_width, 20);
    TimeNameLabel.textColor = YYHexColor(@"#372300");;
    TimeNameLabel.textAlignment = NSTextAlignmentCenter;
    TimeNameLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [LeftView addSubview:TimeNameLabel];
    
    UILabel * TimeLabel = [[UILabel alloc]init];
    TimeLabel.text = @"2020-01-01 15:32:23";
    TimeLabel.frame = CGRectMake(0, 85 , LeftView.ZLP_width, 20);
    TimeLabel.textColor = YYHexColor(@"#372300");
    TimeLabel.textAlignment = NSTextAlignmentCenter;
    TimeLabel.font = [UIFont systemFontOfSize:10 weight:0];
    [LeftView addSubview:TimeLabel];
    
    UIImageView * RightImage = [[UIImageView alloc] init];
    RightImage.frame = CGRectMake(MainBGView.ZLP_width - 48 , 0  , 48 , 41);
    RightImage.image = [UIImage imageNamed:@"cardwait"];
    [MainBGView addSubview:RightImage];
    
    
    UIImageView * Iconimage = [[UIImageView alloc] init];
    Iconimage.frame = CGRectMake(132 , 10  , 25, 25);
    Iconimage.image = [UIImage imageNamed:@"iqiyi"];
    [MainBGView addSubview:Iconimage];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"瑞雪黑森林摩卡中杯";
    TitleLabel.frame = CGRectMake(160, 12, 126, 20);
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.textColor = YY22Color;
    TitleLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:TitleLabel];
    
    
    UILabel * BuyTimeLabel = [[UILabel alloc]init];
    BuyTimeLabel.text = @"购买时间 2019-23-12 12:34:32";
    BuyTimeLabel.frame = CGRectMake(130 , 43 , MainBGView.ZLP_width - 140, 20);
    BuyTimeLabel.textAlignment = NSTextAlignmentLeft;
    BuyTimeLabel.textColor = YY66Color;
    BuyTimeLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:BuyTimeLabel];
    
    
    UILabel * OrderLabel = [[UILabel alloc]init];
    OrderLabel.text = @"流水号 SEELEJGJ83928j342";
    OrderLabel.frame = CGRectMake(130, 65 , MainBGView.ZLP_width - 140, 20);
    OrderLabel.textAlignment = NSTextAlignmentLeft;
    OrderLabel.textColor = YY66Color;
    OrderLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:OrderLabel];
    
    UIView * LineView = [[UILabel alloc]init];
    LineView.backgroundColor = YYE5Color;
    LineView.frame = CGRectMake(140, 92, MainBGView.ZLP_width - 160, 0.5);
    [MainBGView addSubview:LineView];
    
   
    UIButton * RightBtn = [[UIButton alloc]init];
    RightBtn.frame = CGRectMake(MainBGView.ZLP_width -86, 102, 70, 24);
    [RightBtn setTitle:@"立即支付" forState:UIControlStateNormal];
    [RightBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [YYTools ChangeView:RightBtn RadiusSize:10 BorderColor:YY22Color];
    RightBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [RightBtn addTarget:self action:@selector(PayBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:RightBtn];
    
    
    UIButton * CanceBtn = [[UIButton alloc]init];
    CanceBtn.frame = CGRectMake(MainBGView.ZLP_width - 168, 102, 70, 24);
    [CanceBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    [CanceBtn setTitleColor:YYHexColor(@"#B2B2B2") forState:UIControlStateNormal];
    [YYTools ChangeView:CanceBtn RadiusSize:10 BorderColor:YYHexColor(@"#B2B2B2")];
    CanceBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [CanceBtn addTarget:self action:@selector(CancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:CanceBtn];
    
    
}
  





-(void)PayBtnClick{
    
    
    
    
    
}



-(void)CancelBtnClick{
    
    
    
    
}


@end

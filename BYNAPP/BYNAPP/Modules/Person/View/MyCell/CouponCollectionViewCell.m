//
//  CouponCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "CouponCollectionViewCell.h"



@interface CouponCollectionViewCell ()

@property(nonatomic,strong)UIView * LeftMainView;

@property(nonatomic,strong)UILabel * LeftCenterlabel;

@property (nonatomic, strong) UIImageView * RightImage;

@property (nonatomic, strong) UIImageView * LogoImage;

@property (nonatomic, strong) UILabel * TitleLabel;

@property (nonatomic, strong) UILabel * PriceLabel;

@property (nonatomic, strong) UILabel * EndTimeLabel;

@property (nonatomic, strong) UILabel * BuyTimeLabel;

@property (nonatomic, strong) UILabel * BuyNumLabel;

@property (nonatomic, strong) UIButton * LeftBtn;

@property (nonatomic, strong) UIButton * RightBtn;

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
    self.LeftMainView = LeftView;
    
    UILabel * PriceLabel = [[UILabel alloc]init];
    PriceLabel.text = @"&256.22";
    PriceLabel.textColor = YYHexColor(@"#372300");;
    PriceLabel.frame = CGRectMake(0, 30 , LeftView.ZLP_width , 35);
    PriceLabel.textAlignment = NSTextAlignmentCenter;
    PriceLabel.font = [UIFont systemFontOfSize:20 weight:2];
    [LeftView addSubview:PriceLabel];
    self.PriceLabel = PriceLabel;
    
    UILabel * TimeNameLabel = [[UILabel alloc]init];
    TimeNameLabel.text = @"保质期至";
    TimeNameLabel.frame = CGRectMake(0, 65, LeftView.ZLP_width, 20);
    TimeNameLabel.textColor = YYHexColor(@"#372300");;
    TimeNameLabel.textAlignment = NSTextAlignmentCenter;
    TimeNameLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [LeftView addSubview:TimeNameLabel];
    self.LeftCenterlabel = TimeNameLabel;
    
    UILabel * TimeLabel = [[UILabel alloc]init];
    TimeLabel.text = @"2020-01-01 15:32:23";
    TimeLabel.frame = CGRectMake(0, 85 , LeftView.ZLP_width, 20);
    TimeLabel.textColor = YYHexColor(@"#372300");
    TimeLabel.textAlignment = NSTextAlignmentCenter;
    TimeLabel.font = [UIFont systemFontOfSize:10 weight:0];
    [LeftView addSubview:TimeLabel];
    self.EndTimeLabel = TimeLabel;
    
    UIImageView * RightImage = [[UIImageView alloc] init];
    RightImage.frame = CGRectMake(MainBGView.ZLP_width - 48 , 0  , 48 , 41);
    RightImage.image = [UIImage imageNamed:@"cardwait"];
    [MainBGView addSubview:RightImage];
    self.RightImage = RightImage;
    
    UIImageView * Iconimage = [[UIImageView alloc] init];
    Iconimage.frame = CGRectMake(132 , 10 , 25, 25);
    Iconimage.image = [UIImage imageNamed:@"iqiyi"];
    [MainBGView addSubview:Iconimage];
    self.LogoImage = Iconimage;
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"瑞雪黑森林摩卡中杯";
//    TitleLabel.frame = CGRectMake(160, 12, 126, 20);
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.textColor = YY22Color;
    TitleLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:TitleLabel];
    [TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(Iconimage.mas_right).with.offset(5);
       make.top.equalTo(MainBGView.mas_top).with.offset(12);
       make.height.offset(20);

    }];
    self.TitleLabel = TitleLabel;
    
    UILabel * BuyTimeLabel = [[UILabel alloc]init];
    BuyTimeLabel.text = @"购买时间 2019-23-12 12:34:32";
    BuyTimeLabel.frame = CGRectMake(130 , 43 , MainBGView.ZLP_width - 140, 20);
    BuyTimeLabel.textAlignment = NSTextAlignmentLeft;
    BuyTimeLabel.textColor = YY66Color;
    BuyTimeLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:BuyTimeLabel];
    self.BuyTimeLabel = BuyTimeLabel;
    
    UILabel * OrderLabel = [[UILabel alloc]init];
    OrderLabel.text = @"流水号 SEELEJGJ83928j342";
    OrderLabel.frame = CGRectMake(130, 65 , MainBGView.ZLP_width - 140, 20);
    OrderLabel.textAlignment = NSTextAlignmentLeft;
    OrderLabel.textColor = YY66Color;
    OrderLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:OrderLabel];
    self.BuyNumLabel = OrderLabel;
    
    UIView * LineView = [[UILabel alloc]init];
    LineView.backgroundColor = YYE5Color;
    LineView.frame = CGRectMake(140, 92, MainBGView.ZLP_width - 160, 0.5);
    [MainBGView addSubview:LineView];
    
    UIButton * CanceBtn = [[UIButton alloc]init];
    CanceBtn.frame = CGRectMake(MainBGView.ZLP_width - 168, 102, 70, 24);
    [CanceBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    [CanceBtn setTitleColor:YYHexColor(@"#B2B2B2") forState:UIControlStateNormal];
    [YYTools ChangeView:CanceBtn RadiusSize:10 BorderColor:YYHexColor(@"#B2B2B2")];
    CanceBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [CanceBtn addTarget:self action:@selector(CancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:CanceBtn];
    CanceBtn.hidden = YES;
    self.LeftBtn = CanceBtn;
   
    UIButton * RightBtn = [[UIButton alloc]init];
    RightBtn.frame = CGRectMake(MainBGView.ZLP_width -86, 102, 70, 24);
    [RightBtn setTitle:@"立即支付" forState:UIControlStateNormal];
    [RightBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [YYTools ChangeView:RightBtn RadiusSize:10 BorderColor:YY22Color];
    RightBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [RightBtn addTarget:self action:@selector(PayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:RightBtn];
    RightBtn.hidden = YES;
    self.RightBtn = RightBtn;
    
   
    
    
}
  


-(void)setModel:(PersonCouponModel *)Model{
    
    
     _Model = Model;
     
    if ([Model.status isEqualToString:@"0"]) {
        
#pragma mark ===============等待支付============
        self.RightImage.image = [UIImage imageNamed:@"cardwait"];
        self.LeftMainView.backgroundColor = YYHexColor(@"#FFD117");
        self.PriceLabel.textColor = YY22Color;
        self.LeftCenterlabel.textColor = YY22Color;
        self.EndTimeLabel.textColor = YY22Color;
        self.LeftBtn.hidden = NO;
        self.RightBtn.hidden = NO;
        self.EndTimeLabel.hidden = YES;
        [self.RightBtn setTitle:@"立即支付" forState:UIControlStateNormal];
        
    }else if ([Model.status isEqualToString:@"1"] || [Model.status isEqualToString:@"-1"]){
        
#pragma mark ===============支付失败  订单失效=============
        self.RightImage.image = [UIImage imageNamed:@"cardfail"];
        self.LeftMainView.backgroundColor = YYHexColor(@"#BFBFBF");
        self.PriceLabel.textColor = UIColor.whiteColor;
        self.LeftCenterlabel.textColor = UIColor.whiteColor;
        self.EndTimeLabel.textColor = UIColor.whiteColor;
        self.LeftBtn.hidden = YES;
        self.RightBtn.hidden = YES;
        self.EndTimeLabel.hidden = YES;
        self.BuyNumLabel.textColor = YY99Color;
        self.BuyTimeLabel.textColor = YY99Color;
        self.TitleLabel.textColor = YY99Color;
        
    }else if ([Model.status isEqualToString:@"2"]){
        
        
        self.RightImage.image = [UIImage imageNamed:@"cardsucc"];
        self.LeftMainView.backgroundColor = YYHexColor(@"#FFD117");
        self.PriceLabel.textColor = YY22Color;
        self.LeftCenterlabel.textColor = YY22Color;
        self.EndTimeLabel.textColor = YY22Color;
        self.LeftBtn.hidden = YES;
        self.RightBtn.hidden = NO;
        [self.RightBtn setTitle:@"查看卡券" forState:UIControlStateNormal];
        
    }else if ([Model.status isEqualToString:@"3"]){
        
        self.RightImage.image = [UIImage imageNamed:@"cardfa"];
        self.LeftMainView.backgroundColor = YYHexColor(@"#FFD117");
        self.PriceLabel.textColor = YY22Color;
        self.LeftCenterlabel.textColor = YY22Color;
        self.EndTimeLabel.textColor = YY22Color;
        self.LeftBtn.hidden = YES;
        self.RightBtn.hidden = NO;
        
    }
  
     
    [self.LogoImage sd_setImageWithURL:[NSURL URLWithString:Model.brand_cover] placeholderImage:[UIImage imageNamed:@"Jingdong"]];
    
    self.PriceLabel.text = [NSString stringWithFormat:@"￥%@",Model.face_price];
     
    self.TitleLabel.text = Model.goods_name;
     
    self.EndTimeLabel.text = [NSString stringWithFormat:@" %@ ",Model.coupons[0].effective_time];
     
    self.BuyTimeLabel.text = [NSString stringWithFormat:@"购买时间 %@ ",Model.created_at];
     
    self.BuyNumLabel.text = [NSString stringWithFormat:@"流水号 %@",Model.order_no];
    

}




-(void)PayBtnClick:(UIButton*)Sender{
    
    
    self.CouponListBtnBlockClick(Sender.titleLabel.text);
   
}



-(void)CancelBtnClick:(UIButton*)Sender{
    
     self.CouponListBtnBlockClick(Sender.titleLabel.text);
    
}


@end

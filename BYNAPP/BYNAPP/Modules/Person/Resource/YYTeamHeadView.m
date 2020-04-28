//
//  YYTeamHeadView.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYTeamHeadView.h"

@interface YYTeamHeadView ()

@property(nonatomic,strong)UIView * LeftLineView;

@property(nonatomic,strong)UIView * RightLineView;

@property(nonatomic,assign)NSInteger TeamClickNum;

@property(nonatomic,strong)UIButton * SaleLeftBtn;

@property(nonatomic,strong)UIButton * SaleTopBtn;

@property(nonatomic,strong)UIButton * SaleBotBtn;

@property(nonatomic,assign)NSInteger TimeClickNum;

@property(nonatomic,strong)UIButton * PriceLeftBtn;

@property(nonatomic,strong)UIButton * PriceTopBtn;

@property(nonatomic,strong)UIButton * PriceBotBtn;

@end

@implementation YYTeamHeadView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
   
        self.backgroundColor = UIColor.whiteColor;
        
        self.TeamClickNum = 1;
        
        self.TeamClickNum = 1;
        
        [self CreateHeaderView];

    }
    
    return self;
}



-(void)CreateHeaderView{
  
     
    UIView * LLineView = UIView.new;
    LLineView.backgroundColor = YYE5Color;
    LLineView.frame = CGRectMake(0, 36, self.ZLP_width, 0.5);
    [self addSubview:LLineView];
    
    UIButton * LeftBtn = [[UIButton alloc]init];
    [LeftBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [LeftBtn setTitleColor:YY22Color forState:UIControlStateSelected];
    LeftBtn.titleLabel.hidden = YES;
    LeftBtn.frame = CGRectMake(0 , 0, self.ZLP_width/2, 35);
    [LeftBtn setAdjustsImageWhenHighlighted:NO];
    LeftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [LeftBtn setTitle:@"直邀" forState:UIControlStateNormal];
    LeftBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [LeftBtn addTarget:self action:@selector(LeftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:LeftBtn];
    
    UIView * LineView = [[UIView alloc]init];
    LineView.frame = CGRectMake(self.ZLP_width/4 - 20, 34 , 40 , 2);
    LineView.backgroundColor = YYMMColor;
    [self addSubview:LineView];
    self.LeftLineView = LineView;
    
    
    UIView * MLineView = UIView.new;
    MLineView.backgroundColor = YYE5Color;
    MLineView.frame = CGRectMake( self.ZLP_width/2, 8 , 0.5, 21);
    [self addSubview:MLineView];
    
    
    UIButton * RightBtn = [[UIButton alloc]init];
    [RightBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [RightBtn setTitleColor:YY22Color forState:UIControlStateSelected];
    RightBtn.titleLabel.hidden = YES;
    RightBtn.frame = CGRectMake(self.ZLP_width/2 , 0, self.ZLP_width/2, 35);
    [RightBtn setAdjustsImageWhenHighlighted:NO];
    RightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [RightBtn setTitle:@"其他" forState:UIControlStateNormal];
    RightBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [RightBtn addTarget:self action:@selector(RightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:RightBtn];
    
    UIView * YellowView = [[UIView alloc]init];
    YellowView.frame = CGRectMake(self.ZLP_width * 0.75 - 20, 34 , 40 , 2);
    YellowView.backgroundColor = YYMMColor;
    [self addSubview:YellowView];
    self.RightLineView = YellowView;
    self.RightLineView.hidden = YES;
    
    
    UILabel * TeamNumLabel = [[UILabel alloc]init];
    TeamNumLabel.textColor = YY99Color;
    TeamNumLabel.text =@"其他人数 22人";
    TeamNumLabel.frame = CGRectMake(12, 50, 200, 19);
    TeamNumLabel.textAlignment = NSTextAlignmentLeft;
    TeamNumLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [self addSubview:TeamNumLabel];
    self.PeoPleNumLabel = TeamNumLabel;
    
    UILabel * InvitNumLabel = [[UILabel alloc]init];
    InvitNumLabel.textColor = YY99Color;
    InvitNumLabel.text =@"我的邀请人 glee";
    InvitNumLabel.frame = CGRectMake(self.ZLP_width - 212, 50, 200, 19);
    InvitNumLabel.textAlignment = NSTextAlignmentRight;
    InvitNumLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [self addSubview:InvitNumLabel];
    self.InvitMyPeoLabel = InvitNumLabel;
    
    UILabel * ContentLabel = [[UILabel alloc]init];
    ContentLabel.textColor = YY99Color;
    ContentLabel.text =@"泛指通过您的直邀下级分享的链接或二维码注册成功的人";
    ContentLabel.frame = CGRectMake(12, 76, self.ZLP_width - 24 , 19);
    ContentLabel.textAlignment = NSTextAlignmentLeft;
    ContentLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:ContentLabel];

    
    
    UIView * BgView = [[UIView alloc]init];
    BgView.backgroundColor = YYHexColor(@"#F9F9F9");
    BgView.frame = CGRectMake(12, 105, YYScreenWidth - 24, 40);
    [self addSubview:BgView];
    
    UILabel * LogoLabel = [[UILabel alloc]init];
    LogoLabel.textColor = YY99Color;
    LogoLabel.text =@"头像";
    LogoLabel.frame = CGRectMake(10, 10, 26, 19);
    LogoLabel.textAlignment = NSTextAlignmentLeft;
    LogoLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [BgView addSubview:LogoLabel];

    UILabel * NameLabel = [[UILabel alloc]init];
    NameLabel.textColor = YY99Color;
    NameLabel.text =@"昵称";
    NameLabel.frame = CGRectMake(62, 10, 26, 19);
    NameLabel.textAlignment = NSTextAlignmentLeft;
    NameLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [BgView addSubview:NameLabel];
    
     #pragma mark ===============11111111=============
        
        
    UIView * SaleView = [[UIView alloc]init];
    SaleView.backgroundColor = [UIColor clearColor];
    SaleView.frame = CGRectMake(BgView.ZLP_width / 3, 0, BgView.ZLP_width / 3, 40);
    [BgView addSubview:SaleView];
    
    
    UIButton * SaleLeftBtn = [[UIButton alloc]init];
    [SaleLeftBtn setTitle:@"团队规模" forState:UIControlStateNormal];
    SaleLeftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    SaleLeftBtn.frame =  CGRectMake((BgView.ZLP_width / 3 - 60)/2, 10, 45 , 20);
    SaleLeftBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [SaleLeftBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [SaleLeftBtn setTitleColor:YY66Color forState:UIControlStateSelected];
    [SaleView addSubview:SaleLeftBtn];
    self.SaleLeftBtn = SaleLeftBtn;
    
    
    UIButton * SaleTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SaleTopBtn.frame = CGRectMake((BgView.ZLP_width / 3 - 45)/2 + 39, 13.5, 8 , 4.8);
    [SaleTopBtn setBackgroundImage:[UIImage imageNamed:@"blacksha"] forState:UIControlStateNormal];
    [SaleTopBtn setBackgroundImage:[UIImage imageNamed:@"YellowSha"] forState:UIControlStateSelected];
    SaleTopBtn.backgroundColor = [UIColor clearColor];
    SaleTopBtn.selected = NO;
    [SaleView addSubview:SaleTopBtn];
    self.SaleTopBtn = SaleTopBtn;
    
    
    UIButton * SaleBotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SaleBotBtn.frame = CGRectMake((BgView.ZLP_width / 3 - 45)/2 + 39, 21, 8 , 4.8);
    [SaleBotBtn setBackgroundImage:[UIImage imageNamed:@"blackxia"] forState:UIControlStateNormal];
    [SaleBotBtn setBackgroundImage:[UIImage imageNamed:@"YellowXia"] forState:UIControlStateSelected];
    SaleBotBtn.backgroundColor = [UIColor clearColor];
    SaleBotBtn.selected = NO;
    [SaleView addSubview:SaleBotBtn];
    self.SaleBotBtn = SaleBotBtn;
  
    
    UIButton * SaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SaleBtn.frame = CGRectMake(0, 0 , BgView.ZLP_width / 3 , 40);
    [SaleBtn addTarget:self action:@selector(SaleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    SaleBtn.backgroundColor = [UIColor clearColor];
    [SaleView addSubview:SaleBtn];
    
    
    
    
#pragma mark ===============2222222=============
    

    UIView * PriceView = [[UIView alloc]init];
    PriceView.backgroundColor = [UIColor clearColor];
    PriceView.frame = CGRectMake(BgView.ZLP_width / 3 * 2, 0, BgView.ZLP_width / 3, 40);
    [BgView addSubview:PriceView];
    
    
    UIButton * PriceLeftBtn = [[UIButton alloc]init];
    [PriceLeftBtn setTitle:@"加入时间" forState:UIControlStateNormal];
    PriceLeftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    PriceLeftBtn.frame =  CGRectMake((BgView.ZLP_width / 3 - 60)/2, 10, 45 , 20);
    PriceLeftBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [PriceLeftBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [PriceLeftBtn setTitleColor:YY66Color forState:UIControlStateSelected];
    [PriceView addSubview:PriceLeftBtn];
    self.PriceLeftBtn = PriceLeftBtn;
    
    UIButton * PriceTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    PriceTopBtn.frame = CGRectMake((BgView.ZLP_width / 3 - 45)/2 + 39, 13.5, 8 , 4.8);
    [PriceTopBtn setBackgroundImage:[UIImage imageNamed:@"blacksha"] forState:UIControlStateNormal];
    [PriceTopBtn setBackgroundImage:[UIImage imageNamed:@"YellowSha"] forState:UIControlStateSelected];
    PriceTopBtn.backgroundColor = [UIColor clearColor];
    PriceTopBtn.selected = NO;
    [PriceView addSubview:PriceTopBtn];
    self.PriceTopBtn = PriceTopBtn;
    
    
    UIButton * PriceBotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    PriceBotBtn.frame = CGRectMake((BgView.ZLP_width / 3 - 45)/2 + 39, 21, 8 , 4.8);
    [PriceBotBtn setBackgroundImage:[UIImage imageNamed:@"blackxia"] forState:UIControlStateNormal];
    [PriceBotBtn setBackgroundImage:[UIImage imageNamed:@"YellowXia"] forState:UIControlStateSelected];
    PriceBotBtn.backgroundColor = [UIColor clearColor];
    PriceBotBtn.selected = NO;
    [PriceView addSubview:PriceBotBtn];
    self.PriceBotBtn = PriceBotBtn;
    
    
    UIButton * PriceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    PriceBtn.frame = CGRectMake(0, 0 , BgView.ZLP_width / 3 , 40);
    [PriceBtn addTarget:self action:@selector(PriceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    PriceBtn.backgroundColor = [UIColor clearColor];
    [PriceView addSubview:PriceBtn];
     

}



-(void)LeftButtonClick:(UIButton*)sender{
    
    self.RightLineView.hidden = YES;
    self.LeftLineView.hidden = NO;
    self.MyTeamNavBtnBlockClick(@"1");
}


-(void)RightButtonClick:(UIButton*)sender{
   
    self.RightLineView.hidden = NO;
    self.LeftLineView.hidden = YES;
     self.MyTeamNavBtnBlockClick(@"2");
    
}

-(void)SaleButtonClick:(UIButton*)sender{
    
  
    self.PriceLeftBtn.selected = NO;
    self.SaleLeftBtn.selected = YES;
    self.PriceBotBtn.selected = NO;
    self.PriceTopBtn.selected = NO;
    self.TeamClickNum ++ ;
    if ( self.TeamClickNum % 2 == 0) {
        self.SaleTopBtn.selected = YES;
        self.SaleBotBtn.selected = NO;
        self.MyTeamTopBlockClick(@"team_num_des");
    }else{
        self.SaleTopBtn.selected = NO;
        self.SaleBotBtn.selected = YES;
        self.MyTeamTopBlockClick(@"team_num_asc");
    }
    
}


-(void)PriceButtonClick:(UIButton*)sender{
    
    self.SaleLeftBtn.selected = NO;
    self.SaleTopBtn.selected = NO;
    self.SaleBotBtn.selected = NO;
    
    self.PriceLeftBtn.selected = YES;
    self.TimeClickNum ++ ;
    if ( self.TimeClickNum % 2 == 0) {
        self.PriceTopBtn.selected = YES;
        self.PriceBotBtn.selected = NO;
        self.MyTeamTopBlockClick(@"register_time_asc");
    }else{
        self.PriceTopBtn.selected = NO;
        self.PriceBotBtn.selected = YES;
        self.MyTeamTopBlockClick(@"register_time_des");
     }
    
}


@end

//
//  PersonVipHeadCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "PersonLoginHeadCollectionViewCell.h"

@interface PersonLoginHeadCollectionViewCell ()

@property (nonatomic, strong) UIImageView * Logoimage;

@property (nonatomic, strong) UILabel * NameLabel;

@property (nonatomic, strong) UILabel * CodeLabel;

@property (nonatomic, strong) UIImageView * VipTypeImage;

@property (nonatomic, strong) UIButton * OpenVipBtn;

@property (nonatomic, strong) UILabel * MoneyLabel;

@property (nonatomic, strong) UILabel * VipTypeLabel;

@property (nonatomic, strong) UILabel * TodayLabel;

@property (nonatomic, strong) UILabel * MonthLabel;

@property (nonatomic, strong) UILabel * YearLabel;

@end

@implementation PersonLoginHeadCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
    
        [self setup];
        
    }
    
    return self;
    
}


- (void)setup{
    
    
    UIView * TopBGView = [[UIView alloc] init];
    TopBGView.frame = CGRectMake(0, 0, YYScreenWidth, YYScreenWidth * 0.52);
    [self addSubview:TopBGView];
    [TopBGView.layer addSublayer:[YYTools SetGradLayerView:TopBGView FromColor:@"#FFDD39" ToColor:@"#FFD117"]];
    
    UIImageView * BGimage = [[UIImageView alloc] init];
    BGimage.image = [UIImage imageNamed:@"blackBg"];
    [self addSubview:BGimage];
    [BGimage mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        make.height.offset(145);
    
    }];
    
    UIImageView * HeadImage = [[UIImageView alloc] init];
    HeadImage.image = [UIImage imageNamed:@"Jingdong"];
    HeadImage.frame = CGRectMake(20, YYStatusHeight + 20, 55, 55);
    [self addSubview:HeadImage];
    [YYTools ChangeView:HeadImage RadiusSize:22 BorderColor:[UIColor clearColor]];
    self.Logoimage = HeadImage;
   
    UILabel * NameLabel = [[UILabel alloc]init];
    NameLabel.text = @"我是昵称";
    NameLabel.textAlignment = NSTextAlignmentLeft;
    NameLabel.textColor = YY22Color;
    NameLabel.font = [UIFont systemFontOfSize:17 weight:0];
    [self addSubview:NameLabel];
    [NameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(HeadImage.mas_right).with.offset(10);
        make.top.equalTo(HeadImage.mas_top).with.offset(0);
        make.height.offset(24);
    }];
    self.NameLabel = NameLabel;
    
    
    UIImageView * VipBgImage = [[UIImageView alloc] init];
    VipBgImage.image = [UIImage imageNamed:@"VipTypeBg"];
    [self addSubview:VipBgImage];
    [VipBgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(NameLabel.mas_right).with.offset(5);
        make.top.equalTo(HeadImage.mas_top).with.offset(5);
        make.height.offset(18);
        make.width.offset(67);

    }];
   

    UIImageView * VipVipImage = [[UIImageView alloc] init];
    VipVipImage.image = [UIImage imageNamed:@"VipVip"];
    [self addSubview:VipVipImage];
    [VipVipImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(NameLabel.mas_right).with.offset(15);
        make.top.equalTo(HeadImage.mas_top).with.offset(10);
        make.height.offset(10);
        make.width.offset(9);
    }];
   

    UILabel * VipTypeLabel = [[UILabel alloc]init];
    VipTypeLabel.textAlignment = NSTextAlignmentCenter;
    VipTypeLabel.adjustsFontSizeToFitWidth = YES;
    VipTypeLabel.textColor = YYHexColor(@"#FFE569");
    VipTypeLabel.font = [UIFont systemFontOfSize:11 weight:0];
    [self addSubview:VipTypeLabel];
    [VipTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(NameLabel.mas_right).with.offset(20);
        make.top.equalTo(HeadImage.mas_top).with.offset(5);
        make.height.offset(18);
        make.width.offset(50);

    }];
    self.VipTypeLabel = VipTypeLabel;
 

    
    UILabel * InvitCodeLabel = [[UILabel alloc]init];
    InvitCodeLabel.text = @"邀请码：543575477";
    InvitCodeLabel.textAlignment = NSTextAlignmentLeft;
    InvitCodeLabel.textColor = YY22Color;
    InvitCodeLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:InvitCodeLabel];
    [InvitCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(HeadImage.mas_right).with.offset(10);
        make.bottom.equalTo(HeadImage.mas_bottom).with.offset(-2);
        make.height.offset(20);
    
    }];
    self.CodeLabel = InvitCodeLabel;
    [InvitCodeLabel addLabelTarget:self action:@selector(CopyInvitCodeClick)];
    
    
    UIButton * OpenVipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [OpenVipBtn setImage:[UIImage imageNamed:@"openvip"] forState:UIControlStateNormal];
    [OpenVipBtn addTarget:self action:@selector(OpenVipBtnBackClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:OpenVipBtn];
    [OpenVipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(0);
        make.top.equalTo(self.mas_top).with.offset(YYStatusHeight + 50);
        make.height.offset(22);
        make.width.offset(67);
    }];
    self.OpenVipBtn = OpenVipBtn;
    
    
    UILabel * AllMoneyLabel = [[UILabel alloc]init];
    AllMoneyLabel.text = @"账户余额(元)";
    AllMoneyLabel.textAlignment = NSTextAlignmentLeft;
    AllMoneyLabel.textColor = YYHexColor(@"#FFF6CA");
    AllMoneyLabel.frame = CGRectMake(30 , self.ZLP_height - 135, 72 , 28);
    AllMoneyLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:AllMoneyLabel];
    
    
    UILabel * AllMoney = [[UILabel alloc]init];
    AllMoney.text = @"12222.32";
    AllMoney.textAlignment = NSTextAlignmentLeft;
    AllMoney.textColor = YYHexColor(@"#FFF6CA");
    AllMoney.frame = CGRectMake(30 , self.ZLP_height - 108, 150 , 28);
    AllMoney.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:AllMoney];
    [AllMoney addLabelTarget:self action:@selector(MoneybtnClick)];
    self.MoneyLabel = AllMoney;
    
    
    UILabel * TodayPredictLabel = [[UILabel alloc]init];
    TodayPredictLabel.text = @"今日预估(元)";
    TodayPredictLabel.textAlignment = NSTextAlignmentLeft;
    TodayPredictLabel.textColor = YYHexColor(@"#FFF6CA");
    TodayPredictLabel.frame = CGRectMake(30 , self.ZLP_height - 80, 150 , 28);
    TodayPredictLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:TodayPredictLabel];
    
    UILabel * TodayPredict = [[UILabel alloc]init];
    TodayPredict.text = @"6666";
    TodayPredict.textAlignment = NSTextAlignmentLeft;
    TodayPredict.textColor = YYHexColor(@"#FFF6CA");
    TodayPredict.frame = CGRectMake(30 , self.ZLP_height - 55, 150 , 28);
    TodayPredict.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:TodayPredict];
    [TodayPredict addLabelTarget:self action:@selector(MoneybtnClick)];
    self.TodayLabel = TodayPredict;
    
    
    UILabel * MonthPredictLabel = [[UILabel alloc]init];
    MonthPredictLabel.text = @"本月预估(元)";
    MonthPredictLabel.textAlignment = NSTextAlignmentLeft;
    MonthPredictLabel.textColor = YYHexColor(@"#FFF6CA");
    MonthPredictLabel.frame = CGRectMake(self.ZLP_centerX - 36 , self.ZLP_height - 80, 72 , 28);
    MonthPredictLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:MonthPredictLabel];
    
    UILabel * MonthPredict = [[UILabel alloc]init];
    MonthPredict.text = @"8888";
    MonthPredict.textAlignment = NSTextAlignmentCenter;
    MonthPredict.textColor = YYHexColor(@"#FFF6CA");
    MonthPredict.frame = CGRectMake(self.ZLP_centerX - 75 , self.ZLP_height - 55, 150 , 28);
    MonthPredict.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:MonthPredict];
    [MonthPredict addLabelTarget:self action:@selector(MoneybtnClick)];
    self.MonthLabel = MonthPredict;
    
    UILabel * AllPredictLabel = [[UILabel alloc]init];
    AllPredictLabel.text = @"累计收益(元)";
    AllPredictLabel.textAlignment = NSTextAlignmentLeft;
    AllPredictLabel.textColor = YYHexColor(@"#FFF6CA");
    AllPredictLabel.frame = CGRectMake(self.ZLP_width - 105 , self.ZLP_height - 80, 72 , 28);
    AllPredictLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:AllPredictLabel];
    
    UILabel * AllPredict = [[UILabel alloc]init];
    AllPredict.text = @"99999";
    AllPredict.textAlignment = NSTextAlignmentLeft;
    AllPredict.textColor = YYHexColor(@"#FFF6CA");
    AllPredict.frame = CGRectMake(self.ZLP_width - 105 , self.ZLP_height - 55, 72 , 28);
    AllPredict.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:AllPredict];
    [AllPredict addLabelTarget:self action:@selector(MoneybtnClick)];
    self.YearLabel = AllPredict;
    
    
    UIButton * WdrawBtn = [[UIButton alloc]init];
    [WdrawBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    WdrawBtn.frame = CGRectMake(self.ZLP_width - 105 , self.ZLP_height - 128, 70 , 28);
    [WdrawBtn setAdjustsImageWhenHighlighted:NO];
    [WdrawBtn setBackgroundColor:YYHexColor(@"#FFD409")];
    WdrawBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [WdrawBtn setTitle:@"去提现" forState:UIControlStateNormal];
    WdrawBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [WdrawBtn addTarget:self action:@selector(WdrawButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:WdrawBtn];
    [YYTools ChangeView:WdrawBtn RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    
    UIImageView * SetImage = [[UIImageView alloc] init];
    SetImage.frame = CGRectMake(YYScreenWidth - 46, YYStatusHeight + 10, 24, 22);
    SetImage.image = [UIImage imageNamed:@"Setting"];
    [TopBGView addSubview:SetImage];
    [SetImage addTarget:self action:@selector(SetImgButtonClick)];
    
}



-(void)OpenVipBtnBackClick{
    
    self.PersonVipheadBtnBlockClick(@"开通会员");
    
}

-(void)CopyInvitCodeClick{
    
     self.PersonVipheadBtnBlockClick(@"复制邀请码");
}


-(void)WdrawButtonClick{
    
    self.PersonVipheadBtnBlockClick(@"提现");
    
}

-(void)MoneybtnClick{
    
    self.PersonVipheadBtnBlockClick(@"报表");
    
}


-(void)SetImgButtonClick{
    
    self.PersonVipheadBtnBlockClick(@"设置");
    
}

#pragma mark

-(void)setModel:(UserModel *)Model{
    
     _Model = Model;
    
    [self.Logoimage sd_setImageWithURL:[NSURL URLWithString:Model.avatar] placeholderImage:[UIImage imageNamed:@"Jingdong"]];
    
    self.NameLabel.text = Model.name;
    
    if ([Model.plus_level isEqualToString:@"0"]) {
        self.VipTypeImage.image = [UIImage imageNamed:@"viptype"];
        self.OpenVipBtn.hidden = NO;
    }else{
        self.VipTypeImage.image = [UIImage imageNamed:@"headVip"];
        self.OpenVipBtn.hidden = YES;
    }
    
    self.VipTypeLabel.text = Model.type_text;
    
    self.CodeLabel.text = [NSString stringWithFormat:@"邀请码:%@   复制",Model.recommend_code];
    
    NSMutableAttributedString *  abs = [[NSMutableAttributedString alloc]initWithString:self.CodeLabel.text];
    [abs addAttribute:NSUnderlineStyleAttributeName value:@(1) range:NSMakeRange(self.CodeLabel.text.length -2, 2)];
    self.CodeLabel.attributedText = abs;
    
  
    
    self.MoneyLabel.text = [NSString stringWithFormat:@"%@",Model.withdraw_amount];
    
    self.TodayLabel.text = [NSString stringWithFormat:@"%@",Model.today_plus_amount];
    
    self.MonthLabel.text = [NSString stringWithFormat:@"%@",Model.this_month_plus_amount];
    
    self.YearLabel.text = [NSString stringWithFormat:@"%@",Model.total_plus_amount];
    
    
}




@end

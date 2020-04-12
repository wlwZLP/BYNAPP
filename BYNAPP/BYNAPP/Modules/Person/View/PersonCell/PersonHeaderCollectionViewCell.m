//
//  PersonHeaderCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/3.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "PersonHeaderCollectionViewCell.h"

@interface PersonHeaderCollectionViewCell ()




@end

@implementation PersonHeaderCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
       
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup
{
    
    
    UIView * TopBGView = [[UIView alloc] init];
    TopBGView.frame = CGRectMake(0, 0, YYScreenWidth, YYScreenWidth * 0.52);
    [self addSubview:TopBGView];
    [TopBGView.layer addSublayer:[YYTools SetGradLayerView:TopBGView FromColor:@"#FFDD39" ToColor:@"#FFD117"]];

    
    UIImageView * HeadImage = [[UIImageView alloc] init];
    HeadImage.image = [UIImage imageNamed:@"Jingdong"];
    HeadImage.frame = CGRectMake(20, YYStatusHeight + 20, 55, 55);
    [self addSubview:HeadImage];
    [YYTools ChangeView:HeadImage RadiusSize:22 BorderColor:[UIColor clearColor]];
    
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
    
    
    UIImageView * VipImage = [[UIImageView alloc] init];
    VipImage.image = [UIImage imageNamed:@"headVip"];
    [self addSubview:VipImage];
    [VipImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(NameLabel.mas_right).with.offset(10);
        make.top.equalTo(HeadImage.mas_top).with.offset(2);
        make.height.offset(18);
        make.width.offset(67);
        
    }];
    [VipImage addTarget:self action:@selector(VIPImgClick)];
    
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
    
    
    
    UIImageView * BGimage = [[UIImageView alloc] init];
    BGimage.image = [UIImage imageNamed:@"blackBg"];
    [self addSubview:BGimage];
    [BGimage mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        make.height.offset(145);
    
    }];
    
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
    [AllMoney addTarget:self action:@selector(MoneybtnClick)];
    
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
    [TodayPredict addTarget:self action:@selector(MoneybtnClick)];
    
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
    [MonthPredict addTarget:self action:@selector(MoneybtnClick)];
    
    
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
    [AllPredict addTarget:self action:@selector(MoneybtnClick)];
    
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


-(void)VIPImgClick{
    
    
    
}

-(void)WdrawButtonClick{
    
    self.TopWithdrawBtnBlockClick();
    
}

-(void)MoneybtnClick{
    
    self.TopMoneyBtnBlockClick();
    
}


-(void)SetImgButtonClick{
    
    
    self.TopSetBtnBlockClick();
    
}







@end

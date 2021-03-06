//
//  PersonHeaderCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/3.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "PersonNoLoginCollectionViewCell.h"

@interface PersonNoLoginCollectionViewCell ()




@end

@implementation PersonNoLoginCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
    
        [self setup];
        
    }
    
    return self;
    
}


-(void)setUserType:(NSString *)UserType{
    
 
   
    
        
   
      
}



- (void)setup
{
    
    
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
    HeadImage.image = [UIImage imageNamed:@"MainBG"];
    HeadImage.frame = CGRectMake(20, YYStatusHeight + 10, 55, 55);
    [self addSubview:HeadImage];
    [YYTools ChangeView:HeadImage RadiusSize:22 BorderColor:[UIColor clearColor]];
    
    UILabel * LoginLabel = [[UILabel alloc]init];
    LoginLabel.text = @"立即登录";
    LoginLabel.textAlignment = NSTextAlignmentLeft;
    LoginLabel.textColor = YY22Color;
    LoginLabel.frame = CGRectMake(95 , YYStatusHeight + 25 , 160 , 28);
    LoginLabel.font = [UIFont systemFontOfSize:20 weight:2];
    [self addSubview:LoginLabel];
    [LoginLabel addLabelTarget:self action:@selector(LoginBtnBlockClick)];
   
    UIView * LineView = UIView.new;
    LineView.backgroundColor = YY22Color;
    LineView.frame = CGRectMake(95, YYStatusHeight + 55, 85 , 2);
    [self addSubview:LineView];
    
    UILabel * AllMoneyLabel = [[UILabel alloc]init];
    AllMoneyLabel.text = @"账户余额(元)";
    AllMoneyLabel.textAlignment = NSTextAlignmentLeft;
    AllMoneyLabel.textColor = YYHexColor(@"#FFF6CA");
    AllMoneyLabel.frame = CGRectMake(30 , self.ZLP_height - 135, 72 , 28);
    AllMoneyLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:AllMoneyLabel];
    
    UILabel * AllMoney = [[UILabel alloc]init];
    AllMoney.text = @"0.00";
    AllMoney.textAlignment = NSTextAlignmentLeft;
    AllMoney.textColor = YYHexColor(@"#FFF6CA");
    AllMoney.frame = CGRectMake(30 , self.ZLP_height - 108, 150 , 28);
    AllMoney.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:AllMoney];
    
    UILabel * TodayPredictLabel = [[UILabel alloc]init];
    TodayPredictLabel.text = @"今日预估(元)";
    TodayPredictLabel.textAlignment = NSTextAlignmentLeft;
    TodayPredictLabel.textColor = YYHexColor(@"#FFF6CA");
    TodayPredictLabel.frame = CGRectMake(30 , self.ZLP_height - 80, 150 , 28);
    TodayPredictLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:TodayPredictLabel];
    
    UILabel * TodayPredict = [[UILabel alloc]init];
    TodayPredict.text = @"0.00";
    TodayPredict.textAlignment = NSTextAlignmentLeft;
    TodayPredict.textColor = YYHexColor(@"#FFF6CA");
    TodayPredict.frame = CGRectMake(30 , self.ZLP_height - 55, 150 , 28);
    TodayPredict.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:TodayPredict];
  
    
    UILabel * MonthPredictLabel = [[UILabel alloc]init];
    MonthPredictLabel.text = @"本月预估(元)";
    MonthPredictLabel.textAlignment = NSTextAlignmentLeft;
    MonthPredictLabel.textColor = YYHexColor(@"#FFF6CA");
    MonthPredictLabel.frame = CGRectMake(self.ZLP_centerX - 36 , self.ZLP_height - 80, 72 , 28);
    MonthPredictLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:MonthPredictLabel];
    
    UILabel * MonthPredict = [[UILabel alloc]init];
    MonthPredict.text = @"0.00";
    MonthPredict.textAlignment = NSTextAlignmentCenter;
    MonthPredict.textColor = YYHexColor(@"#FFF6CA");
    MonthPredict.frame = CGRectMake(self.ZLP_centerX - 75 , self.ZLP_height - 55, 150 , 28);
    MonthPredict.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:MonthPredict];
    
    
    UILabel * AllPredictLabel = [[UILabel alloc]init];
    AllPredictLabel.text = @"累计收益(元)";
    AllPredictLabel.textAlignment = NSTextAlignmentLeft;
    AllPredictLabel.textColor = YYHexColor(@"#FFF6CA");
    AllPredictLabel.frame = CGRectMake(self.ZLP_width - 105 , self.ZLP_height - 80, 72 , 28);
    AllPredictLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:AllPredictLabel];
    
    UILabel * AllPredict = [[UILabel alloc]init];
    AllPredict.text = @"0.00";
    AllPredict.textAlignment = NSTextAlignmentLeft;
    AllPredict.textColor = YYHexColor(@"#FFF6CA");
    AllPredict.frame = CGRectMake(self.ZLP_width - 105 , self.ZLP_height - 55, 72 , 28);
    AllPredict.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:AllPredict];
    
    
    UIImageView * SetImage = [[UIImageView alloc] init];
    SetImage.frame = CGRectMake(YYScreenWidth - 46, YYStatusHeight + 10, 24, 22);
    SetImage.image = [UIImage imageNamed:@"Setting"];
    [TopBGView addSubview:SetImage];
//    [SetImage addTarget:self action:@selector(SetImgButtonClick)];
    
}



/// 登录
-(void)LoginBtnBlockClick{
    
    self.TopLoginBtnBlockClick();
    
}









@end

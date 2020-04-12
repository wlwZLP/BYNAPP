//
//  YYReportHeadView.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYReportHeadView.h"

@implementation YYReportHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
   
        self.backgroundColor = UIColor.whiteColor;
        
        [self CreateHeaderView];

    }
    
    return self;
}


-(void)CreateHeaderView{
  
     
    UIView * MainView = UIView.new;
    MainView.backgroundColor = UIColor.whiteColor;
    MainView.frame = CGRectMake(12, 16, self.ZLP_width -  24, self.ZLP_height -  32);
    [self addSubview:MainView];
    [MainView.layer addSublayer:[YYTools SetGradLayerView:MainView FromColor:@"#FFDD39" ToColor:@"#FFD117"]];
    [YYTools ChangeView:MainView RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    UILabel * AllMoneyLabel = [[UILabel alloc]init];
    AllMoneyLabel.text = @"可提现总收益(元))";
    AllMoneyLabel.textAlignment = NSTextAlignmentCenter;
    AllMoneyLabel.textColor = YY11Color;
    AllMoneyLabel.frame = CGRectMake(0 , 16,  MainView.ZLP_width  , 28);
    AllMoneyLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [MainView addSubview:AllMoneyLabel];
    
    UILabel * AllMoney = [[UILabel alloc]init];
    AllMoney.text = @"12222.32";
    AllMoney.textAlignment = NSTextAlignmentCenter;
    AllMoney.textColor = YY22Color;
    AllMoney.frame = CGRectMake((MainView.ZLP_width -200)/2 , 34, 200 , 40);
    AllMoney.font = [UIFont systemFontOfSize:18 weight:0];
    [MainView addSubview:AllMoney];
    
    UIButton * WdrawBtn = [[UIButton alloc]init];
    [WdrawBtn setTitleColor:YYHexColor(@"#FFD82B") forState:UIControlStateNormal];
    WdrawBtn.frame = CGRectMake((MainView.ZLP_width - 70) /2, 80, 70 , 28);
    [WdrawBtn setAdjustsImageWhenHighlighted:NO];
    [WdrawBtn setBackgroundColor:YYHexColor(@"#312903")];
    WdrawBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [WdrawBtn setTitle:@"去提现" forState:UIControlStateNormal];
    WdrawBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [WdrawBtn addTarget:self action:@selector(WdrawButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [MainView addSubview:WdrawBtn];
    [YYTools ChangeView:WdrawBtn RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    
    UILabel * TodayPredict = [[UILabel alloc]init];
    TodayPredict.text = @"6666";
    TodayPredict.textAlignment = NSTextAlignmentCenter;
    TodayPredict.textColor = YY22Color;
    TodayPredict.frame = CGRectMake(20 , 128, 80 , 22);
    TodayPredict.font = [UIFont systemFontOfSize:16 weight:0];
    [MainView addSubview:TodayPredict];
    
    UILabel * TodayPredictLabel = [[UILabel alloc]init];
    TodayPredictLabel.text = @"累计收益(元)";
    TodayPredictLabel.textAlignment = NSTextAlignmentCenter;
    TodayPredictLabel.textColor = YY11Color;
    TodayPredictLabel.frame = CGRectMake(20 , 152, 80 , 18);
    TodayPredictLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainView addSubview:TodayPredictLabel];
   
    
   
    
    UILabel * MonthPredict = [[UILabel alloc]init];
    MonthPredict.text = @"8888";
    MonthPredict.textAlignment = NSTextAlignmentCenter;
    MonthPredict.textColor = YY22Color;
    MonthPredict.frame = CGRectMake(self.ZLP_centerX - 100 , 128, 200 , 22);
    MonthPredict.font = [UIFont systemFontOfSize:18 weight:0];
    [MainView addSubview:MonthPredict];
  
    UILabel * MonthPredictLabel = [[UILabel alloc]init];
    MonthPredictLabel.text = @"本月预估(元)";
    MonthPredictLabel.textAlignment = NSTextAlignmentCenter;
    MonthPredictLabel.textColor = YY11Color;
    MonthPredictLabel.frame = CGRectMake(self.ZLP_centerX - 100 ,152 , 200 , 18);
    MonthPredictLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainView addSubview:MonthPredictLabel];
    
    
    
    
    
    UILabel * AllPredict = [[UILabel alloc]init];
    AllPredict.text = @"99999";
    AllPredict.textAlignment = NSTextAlignmentLeft;
    AllPredict.textColor = YY22Color;
    AllPredict.frame = CGRectMake(self.ZLP_width - 105 , 128, 72 , 22);
    AllPredict.font = [UIFont systemFontOfSize:18 weight:0];
    [MainView addSubview:AllPredict];
    
    UILabel * AllPredictLabel = [[UILabel alloc]init];
    AllPredictLabel.text = @"累计收益(元)";
    AllPredictLabel.textAlignment = NSTextAlignmentLeft;
    AllPredictLabel.textColor = YY11Color;
    AllPredictLabel.frame = CGRectMake(self.ZLP_width - 105 , 152, 72 , 18);
    AllPredictLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainView addSubview:AllPredictLabel];
    
    
   
   
   


}



-(void)WdrawButtonClick{
    
    
    self.WithdrawBtnBlockClick();
    
    
}





@end

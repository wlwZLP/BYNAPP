//
//  DetailsNumCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "DetailsNumCollectionViewCell.h"


@interface DetailsNumCollectionViewCell ()



@end


@implementation DetailsNumCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}




- (void)setup{
    
    UIView * MainView = [[UIView alloc] init];
    MainView.backgroundColor = UIColor.whiteColor;
    MainView.frame = CGRectMake(12, 6, YYScreenWidth -24,self.ZLP_height -12);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView RadiusSize:8 BorderColor:[UIColor clearColor]];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"购买数量";
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.frame = CGRectMake(18, 15, 80, 20);
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:1];
    [MainView addSubview:TitleLabel];
   
    UIButton * DelBtn = [[UIButton alloc] init];
    [DelBtn addTarget:self action:@selector(DelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    DelBtn.frame = CGRectMake(MainView.ZLP_width -110, 15, 20, 20);
    [DelBtn setBackgroundImage:[UIImage imageNamed:@"branddel"] forState:UIControlStateNormal];
    [MainView addSubview:DelBtn];
    
    
   
    UIButton * AddBtn = [[UIButton alloc] init];
    [AddBtn addTarget:self action:@selector(ADDButtonClick) forControlEvents:UIControlEventTouchUpInside];
    AddBtn.frame = CGRectMake(MainView.ZLP_width - 40, 15, 20, 20);
    [AddBtn setBackgroundImage:[UIImage imageNamed:@"brandjia"] forState:UIControlStateNormal];
    [MainView addSubview:AddBtn];
    
    
    UIView * DateView = [[UIView alloc]init];
    DateView.frame = CGRectMake(18, 50 , MainView.ZLP_width - 36, 36);
    DateView.backgroundColor = YYHexColor(@"#FFFCF0");
    [MainView addSubview:DateView];
    
    UILabel * DateLabel = [[UILabel alloc]init];
    DateLabel.text = @"有效日期：购买起24小时内";
    DateLabel.textColor = YYHexColor(@"#DF9600");
    DateLabel.textAlignment = NSTextAlignmentCenter;
    DateLabel.frame = CGRectMake(DateView.ZLP_centerX - 90, 10 , 180, 20);
    DateLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [DateView addSubview:DateLabel];
    
    
    

}


-(void)DelButtonClick{
    
    
    
}



-(void)ADDButtonClick{
    
    
}

@end

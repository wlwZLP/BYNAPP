//
//  BDetailsShuoCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/17.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BDetailsShuoCollectionViewCell.h"

@implementation BDetailsShuoCollectionViewCell

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
    TitleLabel.text = @"产品说明";
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.frame = CGRectMake(18, 15, 80, 20);
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:1];
    [MainView addSubview:TitleLabel];
   
    
    UIView * DateView = [[UIView alloc]init];
    DateView.frame = CGRectMake(18, 50 , MainView.ZLP_width - 36, 36);
    DateView.backgroundColor = YYHexColor(@"#FFFCF0");
    [MainView addSubview:DateView];
    
    UILabel * DateLabel = [[UILabel alloc]init];
    DateLabel.text = @"仅限新用户首次购买";
    DateLabel.textColor = YYHexColor(@"#DF9600");
    DateLabel.textAlignment = NSTextAlignmentCenter;
    DateLabel.frame = CGRectMake(DateView.ZLP_centerX - 90, 10 , 180, 20);
    DateLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [DateView addSubview:DateLabel];
    
    


}


@end

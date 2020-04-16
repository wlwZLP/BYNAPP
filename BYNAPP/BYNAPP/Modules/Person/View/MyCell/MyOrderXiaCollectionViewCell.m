//
//  MyOrderXiaCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyOrderXiaCollectionViewCell.h"

@implementation MyOrderXiaCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}

- (void)setup{
    
    
    UIView * MainBGView = UIView.new;
    MainBGView.backgroundColor = UIColor.whiteColor;
    MainBGView.frame = CGRectMake(12, 12, self.ZLP_width -24, self.ZLP_height -12);
    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [self addSubview:MainBGView];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"生活服务订单";
    TitleLabel.textColor = YY33Color;
    TitleLabel.frame = CGRectMake(14, 7, 180, 20);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:2];
    [MainBGView addSubview:TitleLabel];
   
    
    UIView * LineView = UIView.new;
    LineView.backgroundColor = YYE5Color;
    LineView.frame = CGRectMake(0, 35, MainBGView.ZLP_width, 0.5);
    [MainBGView addSubview:LineView];
    
    NSArray * ImgArray = [[NSArray alloc]initWithObjects:@"ordermt",@"ordermei",@"orderdz",@"orderhotel",nil ];
    
    NSArray * TitleArray = [[NSArray alloc]initWithObjects:@"美团外卖",@"美团",@"大众点评",@"酒店",nil ];
    
    for (NSUInteger i = 0; i < TitleArray.count; i++) {
       
      CGFloat X =  i * 48 + (YYScreenWidth - 262 )/6 * (i + 1);
        
       UIButton *titleButton = [[UIButton alloc]init];
       titleButton.frame = CGRectMake(X + 11 , 45 , 25 , 25);
       titleButton.tag = 3 + i;
       [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
       [MainBGView addSubview:titleButton];
       [titleButton setBackgroundImage:[UIImage imageNamed:ImgArray[i]] forState:UIControlStateNormal];
        
        UILabel * SubLabel = [[UILabel alloc]init];
        SubLabel.text = TitleArray[i];
        SubLabel.adjustsFontSizeToFitWidth = YES;
        SubLabel.textColor = YY33Color;
        SubLabel.frame = CGRectMake(X, 82 , 48, 15);
        SubLabel.textAlignment = NSTextAlignmentCenter;
        SubLabel.font = [UIFont systemFontOfSize:12 weight:0];
        [MainBGView addSubview:SubLabel];
    
     }
    
}



-(void)titleButtonClick:(UIButton*)Sender{
    
    
     self.MyOrderBtnBlockClick(Sender.tag);
    
    
}




@end

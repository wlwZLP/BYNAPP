//
//  ReportCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "ReportCollectionViewCell.h"

@implementation ReportCollectionViewCell

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
    MainView.frame = CGRectMake(0 , 0 , YYScreenWidth , 210);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView  RadiusSize:10 BorderColor:[UIColor clearColor]];
    
//    UILabel * TitleLabel = [[UILabel alloc]init];
//    TitleLabel.text = @"今天";
//    TitleLabel.textColor = YY33Color;
//    TitleLabel.frame = CGRectMake(15 , 16 , 50, 20);
//    TitleLabel.textAlignment = NSTextAlignmentLeft;
//    TitleLabel.font = [UIFont systemFontOfSize:15 weight:1];
//    [self addSubview:TitleLabel];
    
    
    
    
  
    
    
    
    
}




@end

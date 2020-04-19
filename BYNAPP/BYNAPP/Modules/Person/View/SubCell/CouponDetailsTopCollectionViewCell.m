//
//  CouponDetailsTopCollectionViewCell.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/18.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "CouponDetailsTopCollectionViewCell.h"

@interface CouponDetailsTopCollectionViewCell ()



@end

@implementation CouponDetailsTopCollectionViewCell

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
    MainBGView.frame = CGRectMake(12, 0, self.ZLP_width - 24, self.ZLP_height);
    [self addSubview:MainBGView];
    
    UIImageView * TopImage = [[UIImageView alloc] init];
    TopImage.backgroundColor = [UIColor clearColor];
    TopImage.image = [UIImage imageNamed:@"coupontop"];
    TopImage.frame = CGRectMake(0, 0 , MainBGView.ZLP_width , self.ZLP_height);
    [MainBGView addSubview:TopImage];
    
    UIImageView * Iconimage = [[UIImageView alloc] init];
    Iconimage.backgroundColor = [UIColor clearColor];
    Iconimage.image = [UIImage imageNamed:@"iqiyi"];
    Iconimage.frame = CGRectMake(16 , 22 , 55 , 55);
    [MainBGView addSubview:Iconimage];
    [YYTools ChangeView:Iconimage RadiusSize:20 BorderColor:[UIColor clearColor]];
   
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"星巴克 拿铁大杯券";
    TitleLabel.textColor = YY33Color;
    TitleLabel.frame = CGRectMake(83 , 27 , 200 , 20);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:16 weight:1];
    [MainBGView addSubview:TitleLabel];
    
    UILabel * TimeLabel = [[UILabel alloc]init];
    TimeLabel.text = @"质保期至 2019-12-25 12:23:21";
    TimeLabel.textColor = YY33Color;
    TimeLabel.frame = CGRectMake(83 , 53 , 200 , 20);
    TimeLabel.textAlignment = NSTextAlignmentLeft;
    TimeLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [MainBGView addSubview:TimeLabel];
    
  
}











@end

//
//  BrandRecomdCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandRecomdCollectionViewCell.h"

@implementation BrandRecomdCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}

- (void)setup{
    
    UIView * MainBGView = UIView.new;
    MainBGView.backgroundColor = UIColor.whiteColor;
    MainBGView.frame = CGRectMake(12, 4, self.ZLP_width -24, self.ZLP_height -8);
    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [self addSubview:MainBGView];
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.frame = CGRectMake(8, 8, 132.5, 82);
    Mainimage.image = [UIImage imageNamed:@"banner01"];
    [MainBGView addSubview:Mainimage];
    

    UIImageView * XuImage = [[UIImageView alloc] init];
    XuImage.backgroundColor = [UIColor clearColor];
    XuImage.frame = CGRectMake(152, 8 , 1 , 82);
    XuImage.image = [UIImage imageNamed:@"xuxian"];
    [MainBGView addSubview:XuImage];
   
    UIImageView * IconImage = [[UIImageView alloc] init];
    IconImage.backgroundColor = [UIColor clearColor];
    IconImage.frame = CGRectMake(165, 13, 18, 18);
    IconImage.image = [UIImage imageNamed:@"Jingdong"];
    [MainBGView addSubview:IconImage];
   
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"瑞雪黑森林摩卡中杯";
    TitleLabel.textColor = YYHexColor(@"#111111");
    TitleLabel.frame = CGRectMake(188,11, MainBGView.ZLP_width -200, 20);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:TitleLabel];
    
    UILabel * PriceLabel = [[UILabel alloc]init];
    PriceLabel.text = @"¥15.5";
    PriceLabel.textColor = YYHexColor(@"#FB5434");
    PriceLabel.frame = CGRectMake(165, 40, 50, 20);
    PriceLabel.textAlignment = NSTextAlignmentLeft;
    PriceLabel.font = [UIFont systemFontOfSize:15 weight:1];
    [MainBGView addSubview:PriceLabel];
    
    
    UILabel * OldPriceLabel = [[UILabel alloc]init];
    OldPriceLabel.text = @"官方价¥32.5";
    OldPriceLabel.textColor = YYHexColor(@"#888888");
    OldPriceLabel.frame = CGRectMake(165, 68, 180, 20);
    OldPriceLabel.textAlignment = NSTextAlignmentLeft;
    OldPriceLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [MainBGView addSubview:OldPriceLabel];

}




@end
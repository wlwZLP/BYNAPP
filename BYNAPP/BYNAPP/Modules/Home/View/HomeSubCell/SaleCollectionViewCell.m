//
//  SaleCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "SaleCollectionViewCell.h"

@implementation SaleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [YYTools ChangeView:self RadiusSize:0 BorderColor:YY99Color];
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
  
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.frame = CGRectMake(4, 2, 104, 104);
    Mainimage.image = [UIImage imageNamed:@"sale"];
    [self addSubview:Mainimage];
    
   
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"实时热卖";
    TitleLabel.textColor = YY33Color;
    TitleLabel.frame = CGRectMake(5, 113, 102, 15);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [self addSubview:TitleLabel];
    

    
    UILabel * GainMoneyLabel = [[UILabel alloc]init];
    GainMoneyLabel.text = @"最多赚一元";
    GainMoneyLabel.textAlignment = NSTextAlignmentLeft;
    GainMoneyLabel.textColor = YYHexColor(@"#F53C25");
    GainMoneyLabel.frame = CGRectMake(5, 133, 102, 15);
    GainMoneyLabel.font = [UIFont systemFontOfSize:11 weight:0];
    [self addSubview:GainMoneyLabel];
  
    
 
}


@end

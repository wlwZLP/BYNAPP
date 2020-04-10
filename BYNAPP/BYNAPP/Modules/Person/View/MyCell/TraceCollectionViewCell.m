//
//  TraceCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "TraceCollectionViewCell.h"

@implementation TraceCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [YYTools ChangeView:self RadiusSize:5 BorderColor:[UIColor clearColor]];
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
  
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.frame = CGRectMake(0, 0, self.ZLP_width, self.ZLP_width);
    Mainimage.image = [UIImage imageNamed:@"sale"];
    [self addSubview:Mainimage];
    
   
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"实时热卖";
    TitleLabel.textColor = YY33Color;
    TitleLabel.frame = CGRectMake(5, self.ZLP_width + 5 , 102, 20);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [self addSubview:TitleLabel];
    

    
    UILabel * GainMoneyLabel = [[UILabel alloc]init];
    GainMoneyLabel.text = @"最多赚一元";
    GainMoneyLabel.textAlignment = NSTextAlignmentLeft;
    GainMoneyLabel.textColor = YYHexColor(@"#F53C25");
    GainMoneyLabel.frame = CGRectMake(5, self.ZLP_width + 25, 102, 20);
    GainMoneyLabel.font = [UIFont systemFontOfSize:11 weight:0];
    [self addSubview:GainMoneyLabel];
  
    
 
}




@end

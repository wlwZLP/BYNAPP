//
//  WithRecordCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "WithRecordCollectionViewCell.h"

@implementation WithRecordCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColor.whiteColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"withs"];
    Mainimage.frame = CGRectMake(13, 12, 40, 40);
    [self addSubview:Mainimage];
    [YYTools ChangeView:Mainimage RadiusSize:20 BorderColor:[UIColor clearColor]];
  
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"提现成功";
    TitleLabel.textColor = YY33Color;
    TitleLabel.frame = CGRectMake(63, 15 , 150 , 20 );
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [self addSubview:TitleLabel];
    
    UILabel * TimeLabel = [[UILabel alloc]init];
    TimeLabel.text = @"2020-03-30  14:20";
    TimeLabel.textColor = YY99Color;
    TimeLabel.textAlignment = NSTextAlignmentLeft;
    TimeLabel.frame = CGRectMake(63, self.ZLP_height - 30 , 150 , 20 );
    TimeLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:TimeLabel];
    
   
    
    UILabel * MoneyLabel = [[UILabel alloc]init];
    MoneyLabel.text = @"最多赚一元";
    MoneyLabel.textAlignment = NSTextAlignmentRight;
    MoneyLabel.textColor = YY33Color;
    MoneyLabel.frame = CGRectMake(self.ZLP_width -160, 27 , 150 , 25 );
    MoneyLabel.font = [UIFont systemFontOfSize:12 weight:2];
    [self addSubview:MoneyLabel];
   
    
    UIView * FLineView = UIView.new;
    FLineView.backgroundColor = YYE5Color;
    FLineView.frame = CGRectMake(60, 74 , self.ZLP_width - 75 , 0.5);
    [self addSubview:FLineView];
       
   
    
}


@end

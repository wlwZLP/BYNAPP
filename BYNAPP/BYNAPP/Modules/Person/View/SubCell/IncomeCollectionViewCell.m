//
//  IncomeCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "IncomeCollectionViewCell.h"

@implementation IncomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColor.whiteColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    

  
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"佣金奖励";
    TitleLabel.textColor = YY33Color;
    TitleLabel.frame = CGRectMake(12, 22 , 150 , 20 );
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:1];
    [self addSubview:TitleLabel];
    
    UILabel * TimeLabel = [[UILabel alloc]init];
    TimeLabel.text = @"2020-03-30  14:20";
    TimeLabel.textColor = YY99Color;
    TimeLabel.textAlignment = NSTextAlignmentLeft;
    TimeLabel.frame = CGRectMake(12, 45 , 150 , 20 );
    TimeLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:TimeLabel];
    
    
    UILabel * MoneyLabel = [[UILabel alloc]init];
    MoneyLabel.text = @"180";
    MoneyLabel.textAlignment = NSTextAlignmentRight;
    MoneyLabel.textColor = YYHexColor(@"#FB5434");
    MoneyLabel.frame = CGRectMake(self.ZLP_width - 165, 27 , 150 , 25 );
    MoneyLabel.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:MoneyLabel];
   
    
    UIView * FLineView = UIView.new;
    FLineView.backgroundColor = YYE5Color;
    FLineView.frame = CGRectMake( 12, 74 , self.ZLP_width - 24 , 0.5);
    [self addSubview:FLineView];
       
   


}



@end

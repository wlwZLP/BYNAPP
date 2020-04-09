//
//  PersonMainCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/3.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "PersonMainCollectionViewCell.h"

@implementation PersonMainCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setup];
        
       
    }
    
    return self;
    
}



- (void)setup
{
    
    
    UIImageView * LeftImage = [[UIImageView alloc] init];
    LeftImage.backgroundColor = [UIColor clearColor];
    LeftImage.image = [UIImage imageNamed:@"Vip"];
    LeftImage.frame = CGRectMake(13, 15, 20, 20);
    [self addSubview:LeftImage];
    self.LeftImg = LeftImage;
    
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.textColor = YY33Color;
    TitleLabel.frame = CGRectMake(45, 15, 120, 20);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:13 weight:2];
    [self addSubview:TitleLabel];
     self.Leftlabel = TitleLabel;
    
    UIImageView * RightImage = [[UIImageView alloc] init];
    RightImage.backgroundColor = [UIColor clearColor];
    RightImage.image = [UIImage imageNamed:@"Righton"];
    RightImage.frame = CGRectMake(YYScreenWidth - 24, 18.5, 8, 12.5);
    [self addSubview:RightImage];
    
    UIView * LineView = UIView.new;
    LineView.backgroundColor =  YYE5Color;
    LineView.frame = CGRectMake(45, 49, YYScreenWidth, 0.5);
    [self addSubview:LineView];
    
    UIButton * RowBtn = [[UIButton alloc]init];
    RowBtn.backgroundColor = UIColor.clearColor;
    RowBtn.frame = CGRectMake(self.ZLP_width - 100, 0 ,100, 60);
    [RowBtn addTarget:self action:@selector(RowButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:RowBtn];
    self.LeftBtn = RowBtn;
  
}



-(void)RowButtonClick:(UIButton*)sender{
    
    self.TopRowBtnBlockClick(sender.tag);
    
    
}


@end

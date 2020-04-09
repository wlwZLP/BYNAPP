//
//  SetTopCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "SetTopCollectionViewCell.h"

@implementation SetTopCollectionViewCell

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
    MainBGView.frame = CGRectMake(12, 0, self.ZLP_width -24, self.ZLP_height);
    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [self addSubview:MainBGView];
    
    UILabel * headLabel = [[UILabel alloc]init];
    headLabel.text = @"头像";
    headLabel.frame = CGRectMake(12, 27 ,40 , 21);
    headLabel.textColor = YY22Color;
    headLabel.textAlignment = NSTextAlignmentLeft;
    headLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:headLabel];
    
    UIImageView * Iconimage = [[UIImageView alloc] init];
    Iconimage.backgroundColor = [UIColor clearColor];
    Iconimage.image = [UIImage imageNamed:@"Jingdong"];
    Iconimage.frame = CGRectMake(MainBGView.ZLP_width - 87, 10 ,55, 55);
    [MainBGView addSubview:Iconimage];
    [YYTools ChangeView:Iconimage RadiusSize:22.5 BorderColor:[UIColor clearColor]];
    
    UIImageView * RightImage1 = [[UIImageView alloc] init];
    RightImage1.backgroundColor = [UIColor clearColor];
    RightImage1.frame = CGRectMake(MainBGView.ZLP_width - 22, 31 ,8, 13);
    RightImage1.image = [UIImage imageNamed:@"SetRight"];
    [MainBGView addSubview:RightImage1];
    
    UIButton * ImgBtn = [[UIButton alloc]init];
    ImgBtn.backgroundColor = UIColor.clearColor;
    ImgBtn.frame = CGRectMake(MainBGView.ZLP_width - 50, 0 ,50, 75);
    [ImgBtn addTarget:self action:@selector(HeadImgButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:ImgBtn];
    
    UIView * FLineView = UIView.new;
    FLineView.backgroundColor = YYE5Color;
    FLineView.frame = CGRectMake(12, 75, MainBGView.ZLP_width -24, 0.5);
    [MainBGView addSubview:FLineView];
    
    UILabel * NameLabel = [[UILabel alloc]init];
    NameLabel.text = @"用户名";
    NameLabel.frame = CGRectMake(12, 95 , 50 , 21);
    NameLabel.textColor = YY22Color;
    NameLabel.textAlignment = NSTextAlignmentLeft;
    NameLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:NameLabel];
    
    UIImageView * RightImage2 = [[UIImageView alloc] init];
    RightImage2.backgroundColor = [UIColor clearColor];
    RightImage2.frame = CGRectMake(MainBGView.ZLP_width - 22, 99 ,8, 13);
    RightImage2.image = [UIImage imageNamed:@"SetRight"];
    [MainBGView addSubview:RightImage2];
    
    UIButton * NameBtn = [[UIButton alloc]init];
    NameBtn.backgroundColor = UIColor.clearColor;
    NameBtn.frame  = CGRectMake(MainBGView.ZLP_width - 50, 75 ,50, 60);
    [NameBtn addTarget:self action:@selector(PersonNameButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:NameBtn];
    
    UIView * SLineView = UIView.new;
    SLineView.backgroundColor = YYE5Color;
    SLineView.frame = CGRectMake(12, 135, MainBGView.ZLP_width -24, 0.5);
    [MainBGView addSubview:SLineView];
    
    UILabel * IDLabel = [[UILabel alloc]init];
    IDLabel.text = @"ID";
    IDLabel.frame = CGRectMake(12, 156 ,30 , 21);
    IDLabel.textColor = YY22Color;
    IDLabel.textAlignment = NSTextAlignmentLeft;
    IDLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:IDLabel];
    
    
    
    UIView * LLineView = UIView.new;
    LLineView.backgroundColor = YYE5Color;
    LLineView.frame = CGRectMake(12, 200, MainBGView.ZLP_width -24, 0.5);
    [MainBGView addSubview:LLineView];
    
    UILabel * PhoneLabel = [[UILabel alloc]init];
    PhoneLabel.text = @"手机号";
    PhoneLabel.frame = CGRectMake(12, 216 , 50 , 21);
    PhoneLabel.textColor = YY22Color;
    PhoneLabel.textAlignment = NSTextAlignmentLeft;
    PhoneLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:PhoneLabel];
    
    UIImageView * RightImage3 = [[UIImageView alloc] init];
    RightImage3.backgroundColor = [UIColor clearColor];
    RightImage3.frame = CGRectMake(MainBGView.ZLP_width - 22, 220 ,8, 13);
    RightImage3.image = [UIImage imageNamed:@"SetRight"];
    [MainBGView addSubview:RightImage3];
    
    UIButton * PhoneBtn = [[UIButton alloc]init];
    PhoneBtn.backgroundColor = UIColor.clearColor;
    PhoneBtn.frame = CGRectMake(MainBGView.ZLP_width - 50, 200 ,50, 60);
    [PhoneBtn addTarget:self action:@selector(PhoneButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:PhoneBtn];
    
  
}



-(void)HeadImgButtonClick{
    
    self.TopHeadImgBtnBlockClick();
    
}

-(void)PersonNameButtonClick{
    
    self.TopNameBtnBlockClick();
    
}


-(void)PhoneButtonClick{
    
    self.TopPhoneBtnBlockClick();
    
}



@end

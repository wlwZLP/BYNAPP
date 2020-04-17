//
//  BDetailsTopCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/17.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BDetailsTopCollectionViewCell.h"

@implementation BDetailsTopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}







- (void)setup{
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"brandtopbg"];
    Mainimage.frame = CGRectMake(0, 0, YYScreenWidth,self.ZLP_height);
    [self addSubview:Mainimage];
    
    UIImageView * LeftImage = [[UIImageView alloc] init];
    LeftImage.backgroundColor = [UIColor clearColor];
    LeftImage.image = [UIImage imageNamed:@"iqiyi"];
    LeftImage.frame = CGRectMake(13, 19, 48, 48);
    [self addSubview:LeftImage];
    
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"爱奇艺月卡";
    TitleLabel.textColor = UIColor.whiteColor;
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.frame = CGRectMake(68, 30 , 188, 22);
    TitleLabel.font = [UIFont systemFontOfSize:18 weight:1];
    [self addSubview:TitleLabel];
    
    UITextField * PhoneTextField = [[UITextField alloc] init];
    [PhoneTextField setXmg_Placeholder:@"请输入充值手机号码"];
    PhoneTextField.placeholderColor = YYHexColor(@"#CCCCCC");
    PhoneTextField.textColor = YYHexColor(@"#CCCCCC");
    PhoneTextField.frame = CGRectMake(20, 85 , 200 , 30);
    PhoneTextField.font = [UIFont systemFontOfSize:16];
    PhoneTextField.borderStyle = UITextBorderStyleNone;
    PhoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    PhoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:PhoneTextField];
    [self bringSubviewToFront:PhoneTextField];

   
    UIView * LineView = [[UIView alloc] init];
    LineView.backgroundColor = UIColor.whiteColor;
    LineView.frame = CGRectMake(13, 118 , self.ZLP_width - 26 , 0.5);
    [self addSubview:LineView];
    
   
     UIView * BgView = [[UIView alloc] init];
     BgView.backgroundColor = [UIColor whiteColor];
     BgView.frame = CGRectMake(13, self.ZLP_height - 40 , self.ZLP_width - 26 , 40);
     [self addSubview:BgView];

   
     UILabel * TypeLabel = [[UILabel alloc]init];
     TypeLabel.text = @"充值类型";
     TypeLabel.textColor = YY22Color;
     TypeLabel.frame = CGRectMake(14, 20, 160 , 20);
     TypeLabel.textAlignment = NSTextAlignmentLeft;
     TypeLabel.font = [UIFont systemFontOfSize:15 weight:1];
     [BgView addSubview:TypeLabel];
     
 


}





@end

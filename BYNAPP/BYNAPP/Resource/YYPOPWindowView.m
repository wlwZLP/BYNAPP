//
//  YYPOPWindowView.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/27.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYPOPWindowView.h"

@implementation YYPOPWindowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
   
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        
        [self CreateHeaderView];

    }
    
    return self;
}


-(void)CreateHeaderView{
    
    UIView * CenterView = [[UIView alloc]init];
    CenterView.frame = CGRectMake(YYScreenWidth/2 -145, YYScreenHeight * 0.2, 290 , 430);
    CenterView.backgroundColor = UIColor.clearColor;
    [self addSubview:CenterView];
  
    UIButton * DelBtn = [[UIButton alloc]init];
    DelBtn.frame = CGRectMake(260, 20 , 24, 24);
    [DelBtn setImage:[UIImage imageNamed:@"POPWindow"] forState:UIControlStateNormal];
    [DelBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [DelBtn addTarget:self action:@selector(DelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [CenterView addSubview:DelBtn];
       
    
    
    UIImageView * MainImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 60 , CenterView.ZLP_width, CenterView.ZLP_height - 60)];
    MainImgView.image = [UIImage imageNamed:@"bmht"];
    [CenterView addSubview:MainImgView];
    [MainImgView addTarget:self action:@selector(ImgButtonClick)];
    
   
 
}


-(void)DelButtonClick{
    
    [[LPAnimationView sharedMask]dismiss];
    
    
}


-(void)ImgButtonClick{
    
    self.POPWindowImgBlockClick();
    
}


@end

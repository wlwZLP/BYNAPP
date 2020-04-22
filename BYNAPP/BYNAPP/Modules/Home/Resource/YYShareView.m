//
//  YYShareView.m
//  BYNAPP
//
//  Created by apple on 2020/4/22.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYShareView.h"

@implementation YYShareView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
   
        self.backgroundColor = UIColor.whiteColor;
        
        [self CreateHeaderView];

    }
    
    return self;
}


-(void)CreateHeaderView{
    
    
    UIButton * TopBgBtn = UIButton.new;
    TopBgBtn.frame = CGRectMake(0 , 0, YYScreenWidth, YYScreenHeight - 225);
    TopBgBtn.backgroundColor = UIColor.clearColor;
    [TopBgBtn addTarget:self action:@selector(TopBgBtnButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:TopBgBtn];
    
    UIView * CenterView = [[UIView alloc]init];
    CenterView.frame = CGRectMake(0, YYScreenHeight - 225, YYScreenWidth, 225);
    CenterView.backgroundColor = UIColor.whiteColor;
    [self addSubview:CenterView];
    [YYTools ChangeView:CenterView RadiusSize:8 BorderColor:[UIColor clearColor]];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"分享给好友一起享好价";
    TitleLabel.frame = CGRectMake(YYScreenWidth /2 - 90, 15, 180, 25);
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.font = [UIFont systemFontOfSize:16 weight:1];
    [CenterView addSubview:TitleLabel];
    
    
    CGFloat titleButtonW = 70;
    
    CGFloat titleButtonH = 70;
    
    NSArray * ImgNameArray = [NSArray arrayWithObjects:@"taokouling", @"weixinpen",@"pengyouq",@"lianjie",nil];
    
    NSArray * TitleArray = [NSArray arrayWithObjects:@"淘口令", @"微信好友",@"朋友圈",@"复制链接",nil];
    //每行间距
    CGFloat rowMargin = (YYScreenWidth - 280)/5;
    
    // 创建3个标题按钮
    for (NSUInteger i = 0; i < 4; i++) {
        
        CGFloat X =  i * titleButtonW + rowMargin *(i + 1) ;
        UIButton *titleButton = [[UIButton alloc]init];
        titleButton.titleLabel.hidden = YES;
        titleButton.frame = CGRectMake(X , 74 , titleButtonW, titleButtonH);
        [titleButton setBackgroundImage:[UIImage imageNamed:ImgNameArray[i]] forState:UIControlStateNormal];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.layer.masksToBounds = YES;
        titleButton.layer.cornerRadius = 10;
        [CenterView addSubview:titleButton];
        
        UILabel * TitleLabel = [[UILabel alloc]init];
        TitleLabel.text = TitleArray[i];
        TitleLabel.frame = CGRectMake(X , 157 , titleButtonW, 25);
        TitleLabel.textColor = YY33Color;
        TitleLabel.textAlignment = NSTextAlignmentCenter;
        TitleLabel.font = [UIFont systemFontOfSize:16 weight:0];
        [CenterView addSubview:TitleLabel];
        
     
    
    }
    
    
    
}


-(void)titleButtonClick:(UIButton*)SenderBtn{
    
    self.BottomShareBlockClick(SenderBtn.tag);
     
}




-(void)TopBgBtnButtonClick{
    
    [[LPAnimationView sharedMask]dismiss];
    
    
}





@end

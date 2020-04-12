//
//  CustomCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

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
    MainBGView.frame = CGRectMake(21, 60, self.ZLP_width - 42, self.ZLP_height -60);
    [self addSubview:MainBGView];
    [YYTools ChangeView:MainBGView RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.frame = CGRectMake(self.ZLP_centerX - 39, 20, 78, 78);
    Mainimage.image = [UIImage imageNamed:@"iqiyi"];
    [self addSubview:Mainimage];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"贴心小客服";
    TitleLabel.textColor = YY33Color;
    TitleLabel.frame = CGRectMake(MainBGView.width/2 - 50 , 44 , 100, 20);
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.font = [UIFont systemFontOfSize:16 weight:1];
    [MainBGView addSubview:TitleLabel];
    
    
    UILabel * TimeLabel = [[UILabel alloc]init];
    TimeLabel.text = @"客服在线时间：周一-周五：9:00-17:00";
    TimeLabel.textColor = YY66Color;
    TimeLabel.frame = CGRectMake(MainBGView.width/2 - 120, 76 , 240 , 20);
    TimeLabel.textAlignment = NSTextAlignmentCenter;
    TimeLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [MainBGView addSubview:TimeLabel];
    
    UIImageView * WXImage = [[UIImageView alloc] init];
    WXImage.backgroundColor = [UIColor clearColor];
    WXImage.frame = CGRectMake(MainBGView.ZLP_width * 0.215, 110, MainBGView.ZLP_width * 0.57, MainBGView.ZLP_width * 0.57);
    WXImage.image = [UIImage imageNamed:@"MyWX"];
    [MainBGView addSubview:WXImage];
    
    UILabel * ImgLabel = [[UILabel alloc]init];
    ImgLabel.text = @"截图二维码保存到相册，打开微信扫一扫";
    ImgLabel.textColor = YY99Color;
    ImgLabel.frame = CGRectMake(MainBGView.width/2 - 120, WXImage.ZLP_y + WXImage.ZLP_height + 10 , 240 , 20);
    ImgLabel.textAlignment = NSTextAlignmentCenter;
    ImgLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:ImgLabel];
    
    UIButton * CopyWXBtn = [[UIButton alloc] initWithFrame:CGRectMake(MainBGView.ZLP_width * 0.15, self.ZLP_height -150 , MainBGView.ZLP_width * 0.70 , 44)];
    [CopyWXBtn addTarget:self action:@selector(CopyWXButtonClick) forControlEvents:UIControlEventTouchUpInside];
    CopyWXBtn.backgroundColor = YYHexColor(@"#FFD409");
    [CopyWXBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [CopyWXBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [CopyWXBtn.titleLabel setFont :[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [MainBGView addSubview:CopyWXBtn];
    [YYTools ChangeView:CopyWXBtn RadiusSize:16 BorderColor:YYHexColor(@"#FFD409")];
    
    UILabel * BottomLabel = [[UILabel alloc]init];
    BottomLabel.text = @"添加客服好友了解权益";
    BottomLabel.textColor = YY99Color;
    BottomLabel.frame = CGRectMake(MainBGView.width/2 - 120, self.ZLP_height -100, 240 , 20);
    BottomLabel.textAlignment = NSTextAlignmentCenter;
    BottomLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:BottomLabel];
    
    
}


-(void)CopyWXButtonClick{
    
    
    
}


@end

//
//  GoodsShopCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GoodsShopCollectionViewCell.h"

@implementation GoodsShopCollectionViewCell

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
    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [self addSubview:MainBGView];
    [MainBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(8);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-8);
    }];
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"Jingdong"];
    Mainimage.frame = CGRectMake(10, 10, 55, 55);
    [MainBGView addSubview:Mainimage];
    self.ShopImgview = Mainimage;
    
    UILabel * NameLabel = [[UILabel alloc]init];
    NameLabel.text = @"店铺名称";
    NameLabel.frame = CGRectMake(75, 16, 155, 20);
    NameLabel.textColor = YY33Color;
    NameLabel.textAlignment = NSTextAlignmentLeft;
    NameLabel.font = [UIFont systemFontOfSize:15 weight:2];
    [MainBGView addSubview:NameLabel];
    self.ShopLabel = NameLabel;
    
    UILabel * LeftLabel = [[UILabel alloc]init];
    LeftLabel.text = @"宝贝描述：";
    LeftLabel.frame = CGRectMake(75, 45 , 155, 20);
    LeftLabel.textColor = YY66Color;
    LeftLabel.textAlignment = NSTextAlignmentLeft;
    LeftLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:LeftLabel];
    self.LeftNumLabel = LeftLabel;
    
    UILabel * CenterLabel = [[UILabel alloc]init];
    CenterLabel.text = @"卖家服务：";
    CenterLabel.frame = CGRectMake(self.ZLP_centerX - 40, 45, 140 , 20);
    CenterLabel.textColor = YY66Color;
    CenterLabel.textAlignment = NSTextAlignmentCenter;
    CenterLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:CenterLabel];
    self.CenterNumLabel = CenterLabel;
    
    UILabel * RightLabel = [[UILabel alloc]init];
    RightLabel.text = @"处理速度：";
    RightLabel.frame = CGRectMake(self.ZLP_width - 115, 45 , 100, 20);
    RightLabel.textColor = YY66Color;
    RightLabel.textAlignment = NSTextAlignmentRight;
    RightLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:RightLabel];
    self.RightNumLabel = RightLabel;
    
  

}



@end

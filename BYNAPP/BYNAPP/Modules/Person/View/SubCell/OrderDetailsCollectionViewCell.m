//
//  OrderDetailsCollectionViewCell.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/12.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "OrderDetailsCollectionViewCell.h"

@interface OrderDetailsCollectionViewCell ()

@end


@implementation OrderDetailsCollectionViewCell


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
    MainBGView.frame = CGRectMake(12, 10, self.ZLP_width - 24, self.ZLP_height -10);
    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [self addSubview:MainBGView];
    
    UILabel * OrderLabel = [[UILabel alloc]init];
    OrderLabel.text = @"订单编号：234323787645678";
    OrderLabel.textColor = YY66Color;
    OrderLabel.textAlignment = NSTextAlignmentLeft;
    OrderLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:OrderLabel];
    [OrderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(MainBGView.mas_top).with.offset(11);
        make.left.equalTo(MainBGView.mas_left).with.offset(12);
        make.height.offset(17);
    }];
    
    UIButton * CopyBtn = [[UIButton alloc]init];
    [CopyBtn setTitle:@"复制" forState:UIControlStateNormal];
    [CopyBtn addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:CopyBtn];
    [CopyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(MainBGView.mas_top).with.offset(11);
        make.left.equalTo(OrderLabel.mas_right).with.offset(7);
        make.height.offset(17);
        make.width.offset(24);
    }];
    
    UILabel * RightLabel = [[UILabel alloc]init];
    RightLabel.text = @"已结算";
    RightLabel.textColor = YY33Color;
    RightLabel.textAlignment = NSTextAlignmentRight;
    RightLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:RightLabel];
    [RightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(MainBGView.mas_top).with.offset(10);
        make.right.equalTo(MainBGView.mas_right).with.offset(-12);
        make.height.offset(17);
        make.width.offset(46);
    }];
    
    UIView * LineView = UIView.new;
    LineView.backgroundColor = YYE5Color;
    LineView.frame = CGRectMake(0, 35, MainBGView.ZLP_width, 0.5);
    [MainBGView addSubview:LineView];
    [LineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(MainBGView.mas_top).with.offset(35);
        make.right.equalTo(MainBGView.mas_right).with.offset(0);
        make.left.equalTo(MainBGView.mas_left).with.offset(0);
        make.height.offset(0.5);
    }];
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"MyWX"];
    [MainBGView addSubview:Mainimage];
    [Mainimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(MainBGView.mas_top).with.offset(48);
        make.left.equalTo(MainBGView.mas_left).with.offset(12);
        make.width.offset(87.5);
        make.height.offset(87.5);
    }];
   
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"夏季情侣浴室拖鞋男女柔…";
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.textColor = YY33Color;
    TitleLabel.adjustsFontSizeToFitWidth = YES;
    TitleLabel.frame = CGRectMake(110, 51, self.ZLP_width - 180, 15);
    TitleLabel.font = [UIFont systemFontOfSize:12 weight:2];
    [MainBGView addSubview:TitleLabel];
    
    UILabel * PriceLabel = [[UILabel alloc]init];
    PriceLabel.text = @"¥128.00";
    PriceLabel.textColor = YY33Color;
    PriceLabel.textAlignment = NSTextAlignmentRight;
    PriceLabel.adjustsFontSizeToFitWidth = YES;
    PriceLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:PriceLabel];
    [PriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(MainBGView.mas_top).with.offset(51);
        make.right.equalTo(MainBGView.mas_right).with.offset(-10);
        make.height.offset(13);
        make.width.offset(60);
    }];

    UILabel * BuyTimeLabel = [[UILabel alloc]init];
    BuyTimeLabel.text = @"下单时间：2019-12-12 13:34:18";
    BuyTimeLabel.frame = CGRectMake(110, 73, self.ZLP_width - 120, 15);
    BuyTimeLabel.textColor = YY66Color;
    BuyTimeLabel.textAlignment = NSTextAlignmentLeft;
    BuyTimeLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:BuyTimeLabel];

    UILabel * GetTimeLabel = [[UILabel alloc]init];
    GetTimeLabel.text = @"收货时间：2019-12-12 13:34:18";
    GetTimeLabel.textColor = YY66Color;
    GetTimeLabel.frame = CGRectMake(110, 92 , self.ZLP_width - 120, 15);
    GetTimeLabel.textAlignment = NSTextAlignmentLeft;
    GetTimeLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:GetTimeLabel];

    UILabel * GetMoneyLabel = [[UILabel alloc]init];
    GetMoneyLabel.text = @"奖励¥48.00";
    GetMoneyLabel.adjustsFontSizeToFitWidth = YES;
    GetMoneyLabel.frame = CGRectMake(110, 115, 70 , 20);
    GetMoneyLabel.backgroundColor = YYHexColor(@"#FFEEAA");
    GetMoneyLabel.textColor = YYHexColor(@"#DF9600");
    GetMoneyLabel.textAlignment = NSTextAlignmentCenter;
    GetMoneyLabel.font = [UIFont systemFontOfSize:11 weight:0];
    [MainBGView addSubview:GetMoneyLabel];
    [YYTools ChangeView:GetMoneyLabel RadiusSize:5 BorderColor:[UIColor clearColor]];
    

}




@end

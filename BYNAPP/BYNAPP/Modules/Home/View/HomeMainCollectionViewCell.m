//
//  HomeMainCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeMainCollectionViewCell.h"

@interface HomeMainCollectionViewCell ()

@end


@implementation HomeMainCollectionViewCell


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
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"BYNLogo"];
    [self addSubview:Mainimage];
    
    UIImageView * Iconimage = [[UIImageView alloc] init];
    Iconimage.backgroundColor = [UIColor clearColor];
    Iconimage.image = [UIImage imageNamed:@"HomeIcon"];
    [self addSubview:Iconimage];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"实时热卖";
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:20 weight:2];
    [self addSubview:TitleLabel];
    
    UILabel * StoreNameLabel = [[UILabel alloc]init];
    StoreNameLabel.text = @"神犬旗舰店";
    StoreNameLabel.textColor = YY99Color;
    StoreNameLabel.textAlignment = NSTextAlignmentLeft;
    StoreNameLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:StoreNameLabel];
    
    UILabel * CouponLabel = [[UILabel alloc]init];
    CouponLabel.text = @"10元券";
    CouponLabel.textAlignment = NSTextAlignmentCenter;
    CouponLabel.textColor = YYHexColor(@"#FB5434");
    CouponLabel.backgroundColor = [UIColor colorWithRed:255/255.0 green:236/255.0 blue:232/255.0 alpha:1.0];
    CouponLabel.layer.borderColor = [UIColor colorWithRed:255/255.0 green:236/255.0 blue:232/255.0 alpha:1.0].CGColor;
    CouponLabel.layer.borderWidth = 2;
    CouponLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:CouponLabel];
    
    UILabel * GainMoneyLabel = [[UILabel alloc]init];
    GainMoneyLabel.text = @"最多赚一元";
    GainMoneyLabel.textAlignment = NSTextAlignmentCenter;
    GainMoneyLabel.textColor = UIColor.whiteColor;
    GainMoneyLabel.backgroundColor = YYRGBColor(247, 60, 40);
    GainMoneyLabel.font = [UIFont systemFontOfSize:12 weight:2];
    [self addSubview:GainMoneyLabel];
    
    UILabel * CouponPriceLabel = [[UILabel alloc]init];
    CouponPriceLabel.text = @"￥15券后价";
    CouponPriceLabel.textColor = YY33Color;
    CouponPriceLabel.textAlignment = NSTextAlignmentLeft;
    CouponPriceLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:CouponPriceLabel];
    
    UILabel * OldPriceLabel = [[UILabel alloc]init];
    OldPriceLabel.text = @"原价￥32.5";
    OldPriceLabel.textColor = YY99Color;
    OldPriceLabel.textAlignment = NSTextAlignmentLeft;
    OldPriceLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:OldPriceLabel];
    
    UILabel * SaleNumLabel = [[UILabel alloc]init];
    SaleNumLabel.text = @"已售3201件";
    SaleNumLabel.textColor = YY99Color;
    SaleNumLabel.textAlignment = NSTextAlignmentLeft;
    SaleNumLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:SaleNumLabel];
    
    [MainBGView mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(self.mas_top).with.offset(4);
        make.left.equalTo(self.mas_left).with.offset(12);
        make.right.equalTo(self.mas_right).with.offset(-12);
        make.bottom.equalTo(self.mas_bottom).with.offset(-4);
    
    }];
    
    [Mainimage mas_makeConstraints:^(MASConstraintMaker *make) {
         
       make.top.equalTo(MainBGView.mas_top).with.offset(8);
       make.left.equalTo(MainBGView.mas_left).with.offset(8);
       make.bottom.equalTo(MainBGView.mas_bottom).with.offset(-8);
       make.width.equalTo(Mainimage.mas_height);
       
    }];

    [Iconimage mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(Mainimage.mas_right).with.offset(20);
        make.top.equalTo(MainBGView.mas_top).with.offset(10);
        make.height.offset(16);
        make.width.offset(16);

    }];

    [TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(Mainimage.mas_right).with.offset(45);
        make.top.equalTo(MainBGView.mas_top).with.offset(10);
        make.right.equalTo(MainBGView.mas_right).with.offset(-5);
        make.height.offset(16);
        
    }];
    

    [StoreNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(Mainimage.mas_right).with.offset(20);
       make.top.equalTo(MainBGView.mas_top).with.offset(35);
       make.height.offset(20);
       make.right.equalTo(MainBGView.mas_right).with.offset(-5);

    }];

    [CouponLabel mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(Mainimage.mas_right).with.offset(20);
       make.top.equalTo(MainBGView.mas_top).with.offset(58);
       make.width.offset(50);
       make.height.offset(18);

    }];

    [GainMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(CouponLabel.mas_right).with.offset(8);
       make.top.equalTo(MainBGView.mas_top).with.offset(58);
       make.width.offset(70);
       make.height.offset(18);
        
    }];

    [CouponPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(Mainimage.mas_right).with.offset(20);
       make.top.equalTo(MainBGView.mas_top).with.offset(85);
       make.height.offset(20);

    }];


    [OldPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(Mainimage.mas_right).with.offset(20);
        make.bottom.equalTo(MainBGView.mas_bottom).with.offset(-10);
        make.height.offset(15);

    }];

    [SaleNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.right.equalTo(MainBGView.mas_right).with.offset(-10);
        make.bottom.equalTo(MainBGView.mas_bottom).with.offset(-10);
        make.height.offset(15);
    
    }];


}



@end

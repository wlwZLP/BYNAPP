//
//  GoodsSameCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GoodsSameCollectionViewCell.h"

@implementation GoodsSameCollectionViewCell

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
    [self addSubview:MainBGView];
    [MainBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(4);
        make.right.equalTo(self.mas_right).with.offset(-4);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
    }];
    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"sale"];
    [MainBGView addSubview:Mainimage];

    [Mainimage mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(MainBGView.mas_top).with.offset(0);
        make.left.equalTo(MainBGView.mas_left).with.offset(0);
        make.right.equalTo(MainBGView.mas_right).with.offset(0);
        make.bottom.equalTo(MainBGView.mas_bottom).with.offset(-88);

    }];
    
     UIImageView * Iconimage = [[UIImageView alloc] init];
     Iconimage.backgroundColor = [UIColor clearColor];
     Iconimage.image = [UIImage imageNamed:@"HomeIcon"];
     [MainBGView addSubview:Iconimage];
     
     UILabel * TitleLabel = [[UILabel alloc]init];
     TitleLabel.text = @"夏季情侣浴室拖鞋拖…";
     TitleLabel.textColor = YY33Color;
     TitleLabel.textAlignment = NSTextAlignmentLeft;
     TitleLabel.font = [UIFont systemFontOfSize:13 weight:0];
     [MainBGView addSubview:TitleLabel];
    
     UILabel * CouponLabel = [[UILabel alloc]init];
     CouponLabel.text = @"10元券";
     CouponLabel.textAlignment = NSTextAlignmentCenter;
     CouponLabel.textColor = YYHexColor(@"#FB5434");
     CouponLabel.backgroundColor = [UIColor colorWithRed:255/255.0 green:236/255.0 blue:232/255.0 alpha:1.0];
     CouponLabel.layer.borderColor = [UIColor colorWithRed:255/255.0 green:236/255.0 blue:232/255.0 alpha:1.0].CGColor;
     CouponLabel.layer.borderWidth = 2;
     CouponLabel.font = [UIFont systemFontOfSize:12 weight:0];
     [MainBGView addSubview:CouponLabel];
     
     UILabel * GainMoneyLabel = [[UILabel alloc]init];
     GainMoneyLabel.text = @"最多赚一元";
     GainMoneyLabel.textAlignment = NSTextAlignmentCenter;
     GainMoneyLabel.textColor = UIColor.whiteColor;
     GainMoneyLabel.backgroundColor = YYRGBColor(247, 60, 40);
     GainMoneyLabel.font = [UIFont systemFontOfSize:12 weight:2];
     [MainBGView addSubview:GainMoneyLabel];
     
     UILabel * CouponPriceLabel = [[UILabel alloc]init];
     CouponPriceLabel.text = @"￥15";
     CouponPriceLabel.textColor = YY33Color;
     CouponPriceLabel.textAlignment = NSTextAlignmentLeft;
     CouponPriceLabel.font = [UIFont systemFontOfSize:13 weight:0];
     [MainBGView addSubview:CouponPriceLabel];
     
     UILabel * OldPriceLabel = [[UILabel alloc]init];
     OldPriceLabel.text = @"￥32.5";
     OldPriceLabel.textColor = YY99Color;
     OldPriceLabel.textAlignment = NSTextAlignmentLeft;
     OldPriceLabel.font = [UIFont systemFontOfSize:12 weight:0];
     [MainBGView addSubview:OldPriceLabel];
     
     UILabel * SaleNumLabel = [[UILabel alloc]init];
     SaleNumLabel.text = @"已售3201件";
     SaleNumLabel.textColor = YY99Color;
     SaleNumLabel.textAlignment = NSTextAlignmentLeft;
     SaleNumLabel.font = [UIFont systemFontOfSize:12 weight:0];
     [MainBGView addSubview:SaleNumLabel];
    
     [Iconimage mas_makeConstraints:^(MASConstraintMaker *make) {
         
         make.top.equalTo(Mainimage.mas_bottom).with.offset(7);
         make.left.equalTo(MainBGView.mas_left).with.offset(6);
         make.height.offset(16);
         make.width.offset(16);

     }];

     [TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         
         make.top.equalTo(Mainimage.mas_bottom).with.offset(7);
         make.left.equalTo(Iconimage.mas_right).with.offset(4);
         make.right.equalTo(MainBGView.mas_right).with.offset(-2);
         make.height.offset(16);
         
     }];
     

     [CouponLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(Mainimage.mas_bottom).with.offset(30);
        make.left.equalTo(MainBGView.mas_left).with.offset(7);
        make.width.offset(50);
        make.height.offset(18);

     }];

     [GainMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(Mainimage.mas_bottom).with.offset(30);
        make.left.equalTo(CouponLabel.mas_right).with.offset(8);
        make.width.offset(70);
        make.height.offset(18);
         
     }];

    
     [CouponPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(Mainimage.mas_bottom).with.offset(55);
        make.left.equalTo(MainBGView.mas_left).with.offset(7);
        make.height.offset(28);

     }];


     [OldPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {

         make.top.equalTo(Mainimage.mas_bottom).with.offset(60);
         make.left.equalTo(CouponPriceLabel.mas_right).with.offset(5);
         make.height.offset(18);

     }];
    

     [SaleNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         
         make.top.equalTo(Mainimage.mas_bottom).with.offset(60);
         make.right.equalTo(MainBGView.mas_right).with.offset(-7);
         make.height.offset(15);
     
     }];
    
    

}




@end

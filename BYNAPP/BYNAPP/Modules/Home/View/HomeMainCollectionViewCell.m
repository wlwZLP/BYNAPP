//
//  HomeMainCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeMainCollectionViewCell.h"

@interface HomeMainCollectionViewCell ()

@property (nonatomic, strong) UIImageView * Mainimage;

@property (nonatomic, strong) UIImageView * Logoimage;

@property (nonatomic, strong) UILabel * TitleLabel;

@property (nonatomic, strong) UILabel * StoreNameLabel;

@property (nonatomic, strong) UILabel * CouponLabel;

@property (nonatomic, strong) UILabel * GainMoneyLabel;

@property (nonatomic, strong) UILabel * CouponPriceLabel;

@property (nonatomic, strong) UILabel * OldPriceLabel;

@property (nonatomic, strong) UILabel * SaleNumLabel;

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
    self.Mainimage = Mainimage;
    
    UIImageView * Iconimage = [[UIImageView alloc] init];
    Iconimage.backgroundColor = [UIColor clearColor];
    Iconimage.image = [UIImage imageNamed:@"HomeIcon"];
    [self addSubview:Iconimage];
    self.Logoimage = Iconimage;
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"实时热卖";
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:16 weight:1];
    [self addSubview:TitleLabel];
    self.TitleLabel = TitleLabel;
    
    UILabel * StoreNameLabel = [[UILabel alloc]init];
    StoreNameLabel.textColor = YY99Color;
    StoreNameLabel.textAlignment = NSTextAlignmentLeft;
    StoreNameLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:StoreNameLabel];
    self.StoreNameLabel = StoreNameLabel;
    
    UILabel * CouponLabel = [[UILabel alloc]init];
    CouponLabel.textAlignment = NSTextAlignmentCenter;
    CouponLabel.textColor = YYHexColor(@"#FB5434");
    CouponLabel.backgroundColor = [UIColor colorWithRed:255/255.0 green:236/255.0 blue:232/255.0 alpha:1.0];
    CouponLabel.layer.borderColor = [UIColor colorWithRed:255/255.0 green:236/255.0 blue:232/255.0 alpha:1.0].CGColor;
    CouponLabel.layer.borderWidth = 2;
    CouponLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:CouponLabel];
    [YYTools ChangeView:CouponLabel RadiusSize:3 BorderColor:YYHexColor(@"#FB5434")];
    self.CouponLabel = CouponLabel;
    
    
    UILabel * GainMoneyLabel = [[UILabel alloc]init];
//    GainMoneyLabel.text = @"最多赚一元";
    GainMoneyLabel.textAlignment = NSTextAlignmentCenter;
    GainMoneyLabel.textColor = UIColor.whiteColor;
    GainMoneyLabel.backgroundColor = YYRGBColor(247, 60, 40);
    GainMoneyLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:GainMoneyLabel];
    [YYTools ChangeView:GainMoneyLabel RadiusSize:3 BorderColor:[UIColor clearColor]];
    self.GainMoneyLabel = GainMoneyLabel;
    
    UILabel * CouponPriceLabel = [[UILabel alloc]init];
//    CouponPriceLabel.text = @"￥15券后价";
    CouponPriceLabel.textColor = YYHexColor(@"#FB5434");
    CouponPriceLabel.textAlignment = NSTextAlignmentLeft;
    CouponPriceLabel.font = [UIFont systemFontOfSize:17 weight:2];
    [self addSubview:CouponPriceLabel];
    self.CouponPriceLabel = CouponPriceLabel;
    
    UILabel * OldPriceLabel = [[UILabel alloc]init];
//    OldPriceLabel.text = @"原价￥32.5";
    OldPriceLabel.textColor = YY99Color;
    OldPriceLabel.textAlignment = NSTextAlignmentLeft;
    OldPriceLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:OldPriceLabel];
    self.OldPriceLabel = OldPriceLabel;
    
    UILabel * SaleNumLabel = [[UILabel alloc]init];
//    SaleNumLabel.text = @"已售3201件";
    SaleNumLabel.textColor = YY99Color;
    SaleNumLabel.textAlignment = NSTextAlignmentLeft;
    SaleNumLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:SaleNumLabel];
    self.SaleNumLabel = SaleNumLabel;
    
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
       make.top.equalTo(MainBGView.mas_top).with.offset(30);
       make.height.offset(20);
//       make.right.equalTo(MainBGView.mas_right).with.offset(-5);

    }];

    [CouponLabel mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(Mainimage.mas_right).with.offset(20);
       make.top.equalTo(MainBGView.mas_top).with.offset(58);
//       make.width.offset(50);
       make.height.offset(18);

    }];

    [GainMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(CouponLabel.mas_right).with.offset(8);
       make.top.equalTo(MainBGView.mas_top).with.offset(58);
//       make.width.offset(70);
       make.height.offset(18);
        
    }];

    [CouponPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(Mainimage.mas_right).with.offset(20);
       make.top.equalTo(MainBGView.mas_top).with.offset(82);
       make.height.offset(20);

    }];


    [OldPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(Mainimage.mas_right).with.offset(20);
        make.bottom.equalTo(MainBGView.mas_bottom).with.offset(-5);
        make.height.offset(15);

    }];

    [SaleNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.right.equalTo(MainBGView.mas_right).with.offset(-10);
        make.bottom.equalTo(MainBGView.mas_bottom).with.offset(-5);
        make.height.offset(15);
    
    }];


}


-(void)setModel:(HomeMainModel *)Model{
    
    _Model = Model;
    
    [self.Mainimage sd_setImageWithURL:[NSURL URLWithString:Model.cover_image] placeholderImage:[UIImage imageNamed:@"bmht"]];
    
    [self.Logoimage sd_setImageWithURL:[NSURL URLWithString:Model.mall_icon] placeholderImage:[UIImage imageNamed:@"Jingdong"]];
    
    self.TitleLabel.text = Model.title;
    
    self.StoreNameLabel.text = Model.shop_name;
    
    self.CouponLabel.text = [NSString stringWithFormat:@" %@元券 ",Model.coupon_money];
    
    self.GainMoneyLabel.text = [NSString stringWithFormat:@" %@ ",Model.fl_commission];
    
    self.CouponPriceLabel.text = [NSString stringWithFormat:@"￥%@ 券后价",Model.discount_price];
    
    NSMutableAttributedString * CouponString = [[NSMutableAttributedString alloc] initWithString:self.CouponPriceLabel.text];
    NSRange Range1 = NSMakeRange(0, 1);
    NSRange Range2 = NSMakeRange(self.CouponPriceLabel.text.length - 3, 3);
    [CouponString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:Range1];
    [CouponString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:Range2];
    [self.CouponPriceLabel setAttributedText:CouponString];
    
    
    self.OldPriceLabel.text = [NSString stringWithFormat:@"原价￥%@ ", Model.price];
    NSMutableAttributedString *  abs = [[NSMutableAttributedString alloc]initWithString:self.OldPriceLabel.text];
    [abs addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:NSMakeRange(0, self.OldPriceLabel.text.length)];
    self.OldPriceLabel.attributedText = abs;
    
    self.SaleNumLabel.text = [NSString stringWithFormat:@"已售%@件",Model.month_sales];
    
    
    
}





@end

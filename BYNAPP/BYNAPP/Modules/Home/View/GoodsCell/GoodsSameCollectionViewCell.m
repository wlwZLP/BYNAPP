//
//  GoodsSameCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GoodsSameCollectionViewCell.h"

@interface GoodsSameCollectionViewCell ()

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
    self.Mainimage = Mainimage;
    
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
     self.Logoimage = Iconimage;
     
     UILabel * TitleLabel = [[UILabel alloc]init];
     TitleLabel.text = @"夏季情侣浴室拖鞋拖…";
     TitleLabel.textColor = YY33Color;
     TitleLabel.textAlignment = NSTextAlignmentLeft;
     TitleLabel.font = [UIFont systemFontOfSize:13 weight:0];
     [MainBGView addSubview:TitleLabel];
     self.TitleLabel = TitleLabel;
    
     UILabel * CouponLabel = [[UILabel alloc]init];
     CouponLabel.text = @"10元券";
     CouponLabel.textAlignment = NSTextAlignmentCenter;
     CouponLabel.textColor = YYHexColor(@"#FB5434");
     CouponLabel.backgroundColor = YYHexColor(@"#FFECE8");
     CouponLabel.font = [UIFont systemFontOfSize:12 weight:0];
     [MainBGView addSubview:CouponLabel];
     self.CouponLabel = CouponLabel;
     [YYTools ChangeView:CouponLabel RadiusSize:3 BorderColor:YYHexColor(@"#FB5434")];
     
     UILabel * GainMoneyLabel = [[UILabel alloc]init];
     GainMoneyLabel.text = @"最多赚一元";
     GainMoneyLabel.textAlignment = NSTextAlignmentCenter;
     GainMoneyLabel.textColor = UIColor.whiteColor;
     GainMoneyLabel.backgroundColor = YYRGBColor(247, 60, 40);
     GainMoneyLabel.font = [UIFont systemFontOfSize:12 weight:0];
     [MainBGView addSubview:GainMoneyLabel];
     self.GainMoneyLabel = GainMoneyLabel;
     [YYTools ChangeView:GainMoneyLabel RadiusSize:3 BorderColor:[UIColor clearColor]];
     
     UILabel * CouponPriceLabel = [[UILabel alloc]init];
     CouponPriceLabel.text = @"￥15";
     CouponPriceLabel.textColor = YYHexColor(@"#FB5434");
     CouponPriceLabel.textAlignment = NSTextAlignmentLeft;
     CouponPriceLabel.font = [UIFont systemFontOfSize:18 weight:0];
     [MainBGView addSubview:CouponPriceLabel];
     self.CouponPriceLabel = CouponPriceLabel;
     
     UILabel * OldPriceLabel = [[UILabel alloc]init];
     OldPriceLabel.text = @"￥32.5";
     OldPriceLabel.textColor = YY99Color;
     OldPriceLabel.textAlignment = NSTextAlignmentLeft;
     OldPriceLabel.font = [UIFont systemFontOfSize:12 weight:0];
     [MainBGView addSubview:OldPriceLabel];
     self.OldPriceLabel = OldPriceLabel;
     
     UILabel * SaleNumLabel = [[UILabel alloc]init];
     SaleNumLabel.text = @"已售3201件";
     SaleNumLabel.textColor = YY99Color;
     SaleNumLabel.textAlignment = NSTextAlignmentLeft;
     SaleNumLabel.font = [UIFont systemFontOfSize:12 weight:0];
     [MainBGView addSubview:SaleNumLabel];
     self.SaleNumLabel = SaleNumLabel;
    
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
        
        make.top.equalTo(Mainimage.mas_bottom).with.offset(62);
        make.left.equalTo(MainBGView.mas_left).with.offset(6);
        make.height.offset(15);

     }];


     [OldPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {

         make.top.equalTo(Mainimage.mas_bottom).with.offset(64);
         make.left.equalTo(CouponPriceLabel.mas_right).with.offset(2);
         make.height.offset(15);

     }];
    

     [SaleNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         
         make.top.equalTo(Mainimage.mas_bottom).with.offset(64);
         make.right.equalTo(MainBGView.mas_right).with.offset(-7);
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
    
    self.GainMoneyLabel.text = [NSString stringWithFormat:@"%@",Model.fl_commission];
    
    self.CouponPriceLabel.text = [NSString stringWithFormat:@"￥%@",Model.discount_price];
    NSMutableAttributedString * CouponString = [[NSMutableAttributedString alloc] initWithString:self.CouponPriceLabel.text];
    NSRange Range1 = NSMakeRange(0, 1);
    [CouponString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:Range1];
    [self.CouponPriceLabel setAttributedText:CouponString];
    
    
    self.OldPriceLabel.text = [NSString stringWithFormat:@"￥%@ ", Model.price];
    NSMutableAttributedString *  abs = [[NSMutableAttributedString alloc]initWithString:self.OldPriceLabel.text];
    [abs addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:NSMakeRange(0, self.OldPriceLabel.text.length)];
    self.OldPriceLabel.attributedText = abs;
    
    self.SaleNumLabel.text = [NSString stringWithFormat:@"已售%@",Model.month_sales];
    
}


@end

//
//  LimitBuyCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "LimitBuyCollectionViewCell.h"

@interface LimitBuyCollectionViewCell ()

@property (nonatomic, strong) UIImageView * Mainimage;

@property (nonatomic, strong) UIImageView * Logoimage;

@property (nonatomic, strong) UILabel * TitleLabel;

@property (nonatomic, strong) UILabel * StoreNameLabel;

@property (nonatomic, strong) UIView *  ProgressView;

@property (nonatomic, strong) UILabel *  BuyNumLabel;

@property (nonatomic, strong) UILabel *  PriceLabel;

@property (nonatomic, strong) UILabel *  OldPriceLabel;



@end

@implementation LimitBuyCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    
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
    MainBGView.frame = CGRectMake(0, 12, YYScreenWidth - 24, self.ZLP_height);
    [self addSubview:MainBGView];
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"BYNLogo"];
    [MainBGView addSubview:Mainimage];
    self.Mainimage = Mainimage;
    
    UIImageView * Iconimage = [[UIImageView alloc] init];
    Iconimage.backgroundColor = [UIColor clearColor];
    Iconimage.image = [UIImage imageNamed:@"HomeIcon"];
    [MainBGView addSubview:Iconimage];
    self.Logoimage = Iconimage;
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"实时热卖";
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:1];
    [MainBGView addSubview:TitleLabel];
    self.TitleLabel = TitleLabel;
    
    UILabel * StoreNameLabel = [[UILabel alloc]init];
    StoreNameLabel.textColor = YY99Color;
    StoreNameLabel.textAlignment = NSTextAlignmentLeft;
    StoreNameLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [MainBGView addSubview:StoreNameLabel];
    self.StoreNameLabel = StoreNameLabel;
    
    UIView * ProgressBGView = UIView.new;
    ProgressBGView.backgroundColor = YYHexColor(@"#FFEA88");
    [YYTools ChangeView:ProgressBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [MainBGView addSubview:ProgressBGView];
    self.ProgressView = ProgressBGView;
    
    UILabel * BuyNumLabel = [[UILabel alloc]init];
    BuyNumLabel.text = @"￥";
    BuyNumLabel.textColor = YY22Color;
    BuyNumLabel.backgroundColor = YYHexColor(@"#FFD409");
    BuyNumLabel.textAlignment = NSTextAlignmentCenter;
    BuyNumLabel.adjustsFontSizeToFitWidth = YES;
    BuyNumLabel.font = [UIFont systemFontOfSize:10 weight:0];
    [ProgressBGView addSubview:BuyNumLabel];
    [YYTools ChangeView:BuyNumLabel RadiusSize:5 BorderColor:[UIColor clearColor]];
    self.BuyNumLabel = BuyNumLabel;

    UILabel * PriceLabel = [[UILabel alloc]init];
    PriceLabel.text = @"￥15券后价";
    PriceLabel.textColor = YYHexColor(@"#FB5434");
    PriceLabel.textAlignment = NSTextAlignmentLeft;
    PriceLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:PriceLabel];
    self.PriceLabel = PriceLabel;
    
    UILabel * OldPriceLabel = [[UILabel alloc]init];
    OldPriceLabel.text = @"原价￥32.5";
    OldPriceLabel.textColor = YY99Color;
    OldPriceLabel.textAlignment = NSTextAlignmentLeft;
    OldPriceLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:OldPriceLabel];
    self.OldPriceLabel = OldPriceLabel;
    
    
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
    [YYTools ChangeView:Iconimage RadiusSize:8 BorderColor:[UIColor clearColor]];

    [TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(Mainimage.mas_right).with.offset(45);
        make.top.equalTo(MainBGView.mas_top).with.offset(10);
        make.right.equalTo(MainBGView.mas_right).with.offset(-5);
        make.height.offset(16);
        
    }];
    
    [StoreNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(Mainimage.mas_right).with.offset(20);
       make.top.equalTo(MainBGView.mas_top).with.offset(32);
       make.height.offset(20);

    }];
    
    
    [ProgressBGView mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(Mainimage.mas_right).with.offset(20);
       make.top.equalTo(MainBGView.mas_top).with.offset(58);
       make.height.offset(12);
       make.right.equalTo(MainBGView.mas_right).with.offset(-50);
        
    }];
    
    [BuyNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(ProgressBGView.mas_left).with.offset(0);
        make.top.equalTo(ProgressBGView.mas_top).with.offset(0);
        make.height.offset(12);
        make.width.offset(60);
        
    }];
    
    [PriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {

       make.left.equalTo(Mainimage.mas_right).with.offset(20);
       make.bottom.equalTo(MainBGView.mas_bottom).with.offset(-12);
       make.height.offset(24);

    }];


    [OldPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(PriceLabel.mas_right).with.offset(5);
        make.bottom.equalTo(MainBGView.mas_bottom).with.offset(-12);
        make.height.offset(24);

    }];

    
}





-(void)setModel:(HomeMainModel *)Model{
    
    _Model = Model;
    
    [self.Mainimage sd_setImageWithURL:[NSURL URLWithString:Model.cover_image] placeholderImage:[UIImage imageNamed:@"bmht"]];
    
    [self.Logoimage sd_setImageWithURL:[NSURL URLWithString:Model.mall_icon] placeholderImage:[UIImage imageNamed:@"Jingdong"]];
    
    self.TitleLabel.text = Model.title;
    
    self.StoreNameLabel.text = (Model.shop_name.length > 0) ? Model.shop_name: @"天猫官方旗舰店";

    self.PriceLabel.text = [NSString stringWithFormat:@"￥%@",Model.discount_price];
    
    self.OldPriceLabel.text = [NSString stringWithFormat:@"￥%@",Model.price];
  
    NSMutableAttributedString *  abs = [[NSMutableAttributedString alloc]initWithString:self.OldPriceLabel.text];
    [abs addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:NSMakeRange(0, self.OldPriceLabel.text.length)];
    self.OldPriceLabel.attributedText = abs;

    
    double ProgressScale = [self GetchufaMaxString:Model.total_num minString:Model.sold_num];
    
//    if (ProgressScale >= 0.15) {
//        
//        [self.BuyNumLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            
//            make.width.equalTo(self.ProgressView).multipliedBy(0.6);
//         
//        }];
//        
//    }
    
    self.BuyNumLabel.text = [NSString stringWithFormat:@"已抢%@件",Model.sold_num];
    
}

-(double)GetchufaMaxString:(NSString*)MaxString minString:(NSString*)MinString{
    
    NSDecimalNumber * chufa1 = [NSDecimalNumber decimalNumberWithString:MaxString];

    NSDecimalNumber * chufa2 = [NSDecimalNumber decimalNumberWithString:MinString];

    //除法运算函数  decimalNumberByAdding

    NSDecimalNumber *  chufa = [chufa2 decimalNumberByDividingBy:chufa1];

    return chufa.doubleValue;
    
}

@end

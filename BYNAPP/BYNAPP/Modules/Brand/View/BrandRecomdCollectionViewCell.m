//
//  BrandRecomdCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandRecomdCollectionViewCell.h"

@interface BrandRecomdCollectionViewCell ()

@property (nonatomic, strong) UIImageView * Mainimage;

@property (nonatomic, strong) UIImageView * Logoimage;

@property (nonatomic, strong) UILabel * TitleLabel;

@property (nonatomic, strong) UILabel * PriceLabel;

@property (nonatomic, strong) UILabel * CouponLabel;

@property (nonatomic, strong) UILabel * OldPriceLabel;


@end

@implementation BrandRecomdCollectionViewCell

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
    MainBGView.frame = CGRectMake(12, 4, self.ZLP_width -24, self.ZLP_height -8);
    [YYTools ChangeView:MainBGView RadiusSize:5 BorderColor:[UIColor clearColor]];
    [self addSubview:MainBGView];
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.frame = CGRectMake(8, 8, 132.5, 82);
    Mainimage.image = [UIImage imageNamed:@"banner01"];
    [MainBGView addSubview:Mainimage];
    self.Mainimage = Mainimage;

    UIImageView * XuImage = [[UIImageView alloc] init];
    XuImage.backgroundColor = [UIColor clearColor];
    XuImage.frame = CGRectMake(152, 8 , 1 , 82);
    XuImage.image = [UIImage imageNamed:@"xuxian"];
    [MainBGView addSubview:XuImage];
   
    UIImageView * IconImage = [[UIImageView alloc] init];
    IconImage.backgroundColor = [UIColor clearColor];
    IconImage.frame = CGRectMake(165, 13, 18, 18);
    IconImage.image = [UIImage imageNamed:@"Jingdong"];
    [MainBGView addSubview:IconImage];
    self.Logoimage = IconImage;
    
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"瑞雪黑森林摩卡中杯";
    TitleLabel.textColor = YYHexColor(@"#111111");
    TitleLabel.frame = CGRectMake(188,11, MainBGView.ZLP_width -200, 20);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:TitleLabel];
    self.TitleLabel = TitleLabel;
    
    
    UILabel * PriceLabel = [[UILabel alloc]init];
    PriceLabel.text = @"¥15.5";
    PriceLabel.textColor = YYHexColor(@"#FB5434");
    PriceLabel.textAlignment = NSTextAlignmentLeft;
    PriceLabel.font = [UIFont systemFontOfSize:15 weight:1];
    [MainBGView addSubview:PriceLabel];
    self.PriceLabel = PriceLabel;
    [PriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(MainBGView.mas_left).with.offset(165);
        make.top.equalTo(MainBGView.mas_top).with.offset(40);
        make.height.offset(20);
    }];
    
    UIImageView * CouponImage = [[UIImageView alloc] init];
    CouponImage.backgroundColor = [UIColor clearColor];
    CouponImage.image = [UIImage imageNamed:@"biaoqian"];
    [MainBGView addSubview:CouponImage];
    [CouponImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(PriceLabel.mas_right).with.offset(10);
        make.top.equalTo(MainBGView.mas_top).with.offset(40);
        make.width.offset(60);
        make.height.offset(20);
    }];
    
    UILabel * CouponLabel = [[UILabel alloc]init];
    CouponLabel.text = @"¥15.5";
    CouponLabel.textColor = UIColor.whiteColor;
    CouponLabel.textAlignment = NSTextAlignmentCenter;
    CouponLabel.font = [UIFont systemFontOfSize:13 weight:1];
    [MainBGView addSubview:CouponLabel];
    self.CouponLabel = CouponLabel;
    [CouponLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(PriceLabel.mas_right).with.offset(13);
        make.top.equalTo(MainBGView.mas_top).with.offset(40);
        make.width.offset(60);
        make.height.offset(20);
    }];
    
    UILabel * OldPriceLabel = [[UILabel alloc]init];
    OldPriceLabel.text = @"官方价¥32.5";
    OldPriceLabel.textColor = YYHexColor(@"#888888");
    OldPriceLabel.frame = CGRectMake(165, 68, 180, 20);
    OldPriceLabel.textAlignment = NSTextAlignmentLeft;
    OldPriceLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [MainBGView addSubview:OldPriceLabel];
    self.OldPriceLabel = OldPriceLabel;
    

}


-(void)setModel:(BrandMainModel *)Model{
    
    _Model = Model;
       
    [self.Mainimage sd_setImageWithURL:[NSURL URLWithString:Model.coupon_cover] placeholderImage:[UIImage imageNamed:@"banner01"]];
       
    [self.Logoimage sd_setImageWithURL:[NSURL URLWithString:Model.brand_cover] placeholderImage:[UIImage imageNamed:@"Jingdong"]];
       
    self.TitleLabel.text = Model.coupon_name;
    
    self.PriceLabel.text = [NSString stringWithFormat:@" ￥%@ ",Model.member_price];
       
//    self.CouponLabel.text = [NSString stringWithFormat:@"省%@元",[self GetTracMoneyWithAmount:Model.face_price ToMoney:Model.member_price]];
       
    self.OldPriceLabel.text = [NSString stringWithFormat:@"官方价￥%@ ",Model.face_price];
    
    NSMutableAttributedString *  abs = [[NSMutableAttributedString alloc]initWithString:self.OldPriceLabel.text];
    [abs addAttribute:NSStrikethroughStyleAttributeName value:@(2) range:NSMakeRange(0, self.OldPriceLabel.text.length)];
    self.OldPriceLabel.attributedText = abs;
    
    
}

//-(NSString *)GetTracMoneyWithAmount:(NSString *)amount ToMoney:(NSString*)toMoney{
//
//    NSDecimalNumber * number1 = [NSDecimalNumber decimalNumberWithString:amount];
//
//    NSDecimalNumber * number2 = [NSDecimalNumber decimalNumberWithString:toMoney];
//
//    NSDecimalNumber * subTracFeeNum = [number1 decimalNumberBySubtracting:number2];
//
//    return [subTracFeeNum stringValue];
//
//}



@end

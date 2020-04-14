//
//  BrandCardCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandCardCollectionViewCell.h"


@interface BrandCardCollectionViewCell ()

@property (nonatomic, strong) UIImageView * Mainimage;

@property (nonatomic, strong) UILabel * TitleLabel;

@property (nonatomic, strong) UILabel * CouponLabel;


@end

@implementation BrandCardCollectionViewCell

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

    
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"爱奇艺";
    TitleLabel.textColor = YYHexColor(@"#111111");
    TitleLabel.frame = CGRectMake(188,11, MainBGView.ZLP_width -200, 20);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:TitleLabel];
    self.TitleLabel = TitleLabel;
    
    
    
    UILabel * OldPriceLabel = [[UILabel alloc]init];
    OldPriceLabel.text = @"尊享6折起";
    OldPriceLabel.textColor = YYHexColor(@"#888888");
    OldPriceLabel.frame = CGRectMake(165, 68, 180, 20);
    OldPriceLabel.textAlignment = NSTextAlignmentLeft;
    OldPriceLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [MainBGView addSubview:OldPriceLabel];
    self.CouponLabel = OldPriceLabel;

}


-(void)setModel:(BrandMainModel *)Model{
    
    _Model = Model;
       
    [self.Mainimage sd_setImageWithURL:[NSURL URLWithString:Model.coupon_cover] placeholderImage:[UIImage imageNamed:@"banner01"]];
    
    self.TitleLabel.text = Model.short_title;
       
    self.CouponLabel.text = [NSString stringWithFormat:@" ￥%@ ",Model.sale_price];
       

    
    
}


@end

//
//  DetailsTopCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "DetailsTopCollectionViewCell.h"


@interface DetailsTopCollectionViewCell ()



@end


@implementation DetailsTopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"sale"];
    Mainimage.frame = CGRectMake(0, 0, YYScreenWidth,YYScreenWidth * 0.62);
    [self addSubview:Mainimage];
    self.MainBgImgView = Mainimage;
   
    UIView * VipView = [[UIView alloc] init];
    VipView.backgroundColor = UIColor.whiteColor;
    [self addSubview:VipView];
    [VipView mas_makeConstraints:^(MASConstraintMaker *make) {
         
        make.right.equalTo(self.mas_right).with.offset(-12);
        make.left.equalTo(self.mas_left).with.offset(12);
        make.bottom.equalTo(self.mas_bottom).with.offset(-6);
        make.height.offset(130);
       
    }];
    [YYTools ChangeView:VipView RadiusSize:8 BorderColor:[UIColor clearColor]];
    
    
     UILabel * TitleLabel = [[UILabel alloc]init];
     TitleLabel.text = @"瑞雪黑森林摩卡中杯";
     TitleLabel.textColor = YYHexColor(@"#111111");
     TitleLabel.textAlignment = NSTextAlignmentLeft;
     TitleLabel.font = [UIFont systemFontOfSize:18 weight:1];
     [VipView addSubview:TitleLabel];
     self.TitleLabel = TitleLabel;
     [TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(VipView.mas_centerX).with.offset(0);
        make.top.equalTo(VipView.mas_top).with.offset(21);
        make.height.offset(25);
     }];
     
    UIImageView * IconImage = [[UIImageView alloc] init];
    IconImage.backgroundColor = [UIColor clearColor];
    IconImage.image = [UIImage imageNamed:@"Jingdong"];
    [VipView addSubview:IconImage];
    self.Logoimage = IconImage;
    [IconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(TitleLabel.mas_left).with.offset(-5);
        make.top.equalTo(VipView.mas_top).with.offset(22);
        make.height.offset(22);
        make.width.offset(22);
    }];
     
     UILabel * PriceLabel = [[UILabel alloc]init];
     PriceLabel.text = @"¥15.5";
     PriceLabel.textColor = YYHexColor(@"#FB5434");
     PriceLabel.textAlignment = NSTextAlignmentLeft;
     PriceLabel.font = [UIFont systemFontOfSize:20 weight:0];
     [VipView addSubview:PriceLabel];
     self.PriceLabel = PriceLabel;
     [PriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.equalTo(VipView.mas_centerX).with.offset(-5);
         make.top.equalTo(VipView.mas_top).with.offset(54);
         make.height.offset(28);
     }];
     
    UIImageView * CouponImage = [[UIImageView alloc] init];
    CouponImage.backgroundColor = [UIColor clearColor];
    CouponImage.image = [UIImage imageNamed:@"biaoqian"];
    [VipView addSubview:CouponImage];
    [CouponImage mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(VipView.mas_centerX).with.offset(5);
         make.top.equalTo(VipView.mas_top).with.offset(57);
         make.width.offset(60);
         make.height.offset(20);
    }];
    
    UILabel * CouponLabel = [[UILabel alloc]init];
    CouponLabel.text = @"省5元";
    CouponLabel.textColor = UIColor.whiteColor;
    CouponLabel.textAlignment = NSTextAlignmentCenter;
    CouponLabel.font = [UIFont systemFontOfSize:13 weight:1];
    [VipView addSubview:CouponLabel];
    self.CouponLabel = CouponLabel;
    [CouponLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(VipView.mas_centerX).with.offset(10);
        make.top.equalTo(VipView.mas_top).with.offset(57);
        make.width.offset(60);
        make.height.offset(20);
    }];
    
    
    UILabel * OldPriceLabel = [[UILabel alloc]init];
    OldPriceLabel.text = @"官方价¥32.5";
    OldPriceLabel.textColor = YYHexColor(@"#888888");
    OldPriceLabel.textAlignment = NSTextAlignmentLeft;
    OldPriceLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [VipView addSubview:OldPriceLabel];
    self.OldPriceLabel = OldPriceLabel;
    [OldPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(VipView.mas_centerX).with.offset(0);
        make.top.equalTo(VipView.mas_top).with.offset(88);
        make.height.offset(21);
    }];
    
    
    
    
    
    

}







@end

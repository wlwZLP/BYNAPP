//
//  GoodsTitleCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GoodsTitleCollectionViewCell.h"

@implementation GoodsTitleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColor.whiteColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
     UIImageView * IconImage = [[UIImageView alloc] init];
     IconImage.backgroundColor = [UIColor clearColor];
     IconImage.frame = CGRectMake(14, 14, 15, 15);
     IconImage.image = [UIImage imageNamed:@"Jingdong"];
     [self addSubview:IconImage];
     self.Logoimage = IconImage;
    
     UILabel * TitleLabel = [[UILabel alloc]init];
     TitleLabel.text = @"      瑞雪黑森林摩卡中杯瑞雪黑森林摩卡中杯瑞雪黑森林摩卡中杯瑞雪黑森林摩卡中杯瑞雪黑森林摩卡中杯";
     TitleLabel.numberOfLines = 2;
     TitleLabel.textColor = YY22Color;
     TitleLabel.frame = CGRectMake(13 ,12 , self.ZLP_width -26, 40);
     TitleLabel.textAlignment = NSTextAlignmentLeft;
     TitleLabel.font = [UIFont systemFontOfSize:15 weight:1];
//     TitleLabel.backgroundColor = UIColor.yellowColor;
     [self addSubview:TitleLabel];
     TitleLabel.YYLineSpace = 3;
     [TitleLabel YYUpdateConstraints];
     self.TitleLabel = TitleLabel;
     
     UILabel * CouponPriceLabel = [[UILabel alloc]init];
     CouponPriceLabel.text = @"¥15.5券后价";
     CouponPriceLabel.textColor = YYHexColor(@"#FB5434");
     CouponPriceLabel.frame = CGRectMake(12, 57 , 150, 30);
     CouponPriceLabel.textAlignment = NSTextAlignmentLeft;
     CouponPriceLabel.font = [UIFont systemFontOfSize:20 weight:1];
     [self addSubview:CouponPriceLabel];
     self.CouponPriceLabel = CouponPriceLabel;
    
  
     UILabel * GainMoneyLabel = [[UILabel alloc]init];
     GainMoneyLabel.text = @"最多赚一元";
     GainMoneyLabel.textAlignment = NSTextAlignmentCenter;
     GainMoneyLabel.textColor = UIColor.whiteColor;
     GainMoneyLabel.backgroundColor = YYRGBColor(247, 60, 40);
     GainMoneyLabel.font = [UIFont systemFontOfSize:12 weight:0];
     GainMoneyLabel.frame = CGRectMake(self.ZLP_width - 96, 60 , 84 , 22);
     [self addSubview:GainMoneyLabel];
     [YYTools ChangeView:GainMoneyLabel RadiusSize:3 BorderColor:[UIColor clearColor]];
     self.GainMoneyLabel = GainMoneyLabel;
   
     UILabel * OldPriceLabel = [[UILabel alloc]init];
     OldPriceLabel.text = @"原价￥32.5";
     OldPriceLabel.textColor = YY99Color;
     OldPriceLabel.frame = CGRectMake(12, 87 , 150, 20);
     OldPriceLabel.textAlignment = NSTextAlignmentLeft;
     OldPriceLabel.font = [UIFont systemFontOfSize:12 weight:0];
     [self addSubview:OldPriceLabel];
     self.OldPriceLabel = OldPriceLabel;
     
    
     UILabel * SaleNumLabel = [[UILabel alloc]init];
     SaleNumLabel.text = @"已售3201件";
     SaleNumLabel.textColor = YY99Color;
     SaleNumLabel.textAlignment = NSTextAlignmentRight;
     SaleNumLabel.frame = CGRectMake(self.ZLP_width - 167, 87 , 150 , 22);
     SaleNumLabel.font = [UIFont systemFontOfSize:12 weight:0];
     [self addSubview:SaleNumLabel];
     self.SaleNumLabel = SaleNumLabel;
    
}





@end

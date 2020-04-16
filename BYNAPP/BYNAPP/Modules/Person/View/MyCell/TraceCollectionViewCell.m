//
//  TraceCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "TraceCollectionViewCell.h"

@interface TraceCollectionViewCell ()

@property (nonatomic, strong) UIImageView * Mainimage;

@property (nonatomic, strong) UILabel * TitleLabel;

@property (nonatomic, strong) UILabel * PriceLabel;

@property (nonatomic, strong) UILabel * OldPriceLabel;


@end

@implementation TraceCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [YYTools ChangeView:self RadiusSize:5 BorderColor:[UIColor clearColor]];
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
  
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.frame = CGRectMake(0, 0, self.ZLP_width, self.ZLP_width);
    Mainimage.image = [UIImage imageNamed:@"sale"];
    [self addSubview:Mainimage];
    self.Mainimage = Mainimage;
   
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"实时热卖";
    TitleLabel.textColor = YY33Color;
    TitleLabel.frame = CGRectMake(5, self.ZLP_width + 5 , self.ZLP_width - 10 , 20);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [self addSubview:TitleLabel];
    self.TitleLabel = TitleLabel;
    

    
    UILabel * GainMoneyLabel = [[UILabel alloc]init];
    GainMoneyLabel.text = @"最多赚一元";
    GainMoneyLabel.textAlignment = NSTextAlignmentLeft;
    GainMoneyLabel.textColor = YYHexColor(@"#F53C25");
    GainMoneyLabel.frame = CGRectMake(5, self.ZLP_width + 25, 102, 20);
    GainMoneyLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [self addSubview:GainMoneyLabel];
    self.PriceLabel = GainMoneyLabel;
    
    
    
//    UILabel * OldPriceLabel = [[UILabel alloc]init];
//    OldPriceLabel.text = @"最多赚一元";
//    OldPriceLabel.textAlignment = NSTextAlignmentLeft;
//    OldPriceLabel.textColor = YYHexColor(@"#F53C25");
//    OldPriceLabel.frame = CGRectMake(5, self.ZLP_width + 25, 102, 20);
//    OldPriceLabel.font = [UIFont systemFontOfSize:11 weight:0];
//    [self addSubview:OldPriceLabel];
//    self.OldPriceLabel = OldPriceLabel;
    
    
}


-(void)setModel:(MyCollectModel *)Model{
   
    _Model = Model;
    
    [self.Mainimage sd_setImageWithURL:[NSURL URLWithString:Model.item_info_cover_image] placeholderImage:[UIImage imageNamed:@"bmht"]];
       
    self.TitleLabel.text = [NSString stringWithFormat:@"%@",Model.item_info_title];
    
    self.PriceLabel.text = [NSString stringWithFormat:@"￥%@",Model.item_info_price];
    
    
}



@end

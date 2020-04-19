//
//  CouponDetailsBotCollectionViewCell.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/18.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "CouponDetailsBotCollectionViewCell.h"

@interface CouponDetailsBotCollectionViewCell ()

@property(nonatomic,strong)UILabel * ConentLabel;

@end

@implementation CouponDetailsBotCollectionViewCell

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
    MainBGView.frame = CGRectMake(12, 0, self.ZLP_width - 24, self.ZLP_height);
    [self addSubview:MainBGView];

    UIImageView * BomImage = [[UIImageView alloc] init];
    BomImage.backgroundColor = [UIColor clearColor];
    BomImage.image = [UIImage imageNamed:@"couponbot"];
    BomImage.frame = CGRectMake( 0 , 0  , MainBGView.ZLP_width , MainBGView.ZLP_height );
    [MainBGView addSubview:BomImage];
    
    UILabel * NOteLabel = [[UILabel alloc]init];
    NOteLabel.text = @"使用须知";
    NOteLabel.textColor = YY33Color;
    NOteLabel.frame = CGRectMake(16 , 22  , 200 , 20);
    NOteLabel.textAlignment = NSTextAlignmentLeft;
    NOteLabel.font = [UIFont systemFontOfSize:16 weight:1];
    [MainBGView addSubview:NOteLabel];
    
    UILabel * ContentLabel = [[UILabel alloc]init];
    ContentLabel.textColor = YY66Color;
    ContentLabel.frame = CGRectMake(16 , 50  , MainBGView.ZLP_width - 32 , MainBGView.ZLP_height - 50);
    ContentLabel.numberOfLines = 0;
    ContentLabel.textAlignment = NSTextAlignmentLeft;
    ContentLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [MainBGView addSubview:ContentLabel];
    self.ConentLabel = ContentLabel;


}



-(void)setContengString:(NSString *)ContengString{
    
     _ContengString = ContengString;
    
     self.ConentLabel.text = ContengString;
    
    
}



@end

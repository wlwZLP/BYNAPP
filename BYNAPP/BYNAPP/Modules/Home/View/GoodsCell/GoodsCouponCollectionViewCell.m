//
//  GoodsCouponCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GoodsCouponCollectionViewCell.h"

@implementation GoodsCouponCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColor.whiteColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"lingqu"];
    [self addSubview:Mainimage];
    [Mainimage mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(self.mas_top).with.offset(5);
        make.left.equalTo(self.mas_left).with.offset(12);
        make.right.equalTo(self.mas_right).with.offset(-12);
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
    }];
    
    
    UILabel * CouponLabel = [[UILabel alloc]init];
    CouponLabel.textColor = YYHexColor(@"#FF4D12");
    CouponLabel.frame = CGRectMake(30, 20 , 150, 20);
    CouponLabel.textAlignment = NSTextAlignmentLeft;
    CouponLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:CouponLabel];
    self.CouponLabel = CouponLabel;
    
    
    UILabel * TimeLabel = [[UILabel alloc]init];
    TimeLabel.textColor = YYHexColor(@"#FF4D12");
    TimeLabel.frame = CGRectMake(30, 45 , 150, 20);
    TimeLabel.textAlignment = NSTextAlignmentLeft;
    TimeLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:TimeLabel];
    self.TimeLabel = TimeLabel;
    
    
    UILabel * BtnLabel = [[UILabel alloc]init];
    BtnLabel.text = @"立即领取";
    BtnLabel.textColor = UIColor.whiteColor;
    BtnLabel.frame = CGRectMake(self.ZLP_width - 88, 32 , 62, 20);
    BtnLabel.textAlignment = NSTextAlignmentCenter;
    BtnLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [BtnLabel addLabelTarget:self action:@selector(LingquBtnClick)];
    [self addSubview:BtnLabel];
   
    
}

-(void)LingquBtnClick{
    
     self.DrawLabelBlockClick();
    
}




@end

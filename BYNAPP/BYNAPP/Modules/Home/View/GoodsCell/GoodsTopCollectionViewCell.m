//
//  GoodsTopCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GoodsTopCollectionViewCell.h"

@interface GoodsTopCollectionViewCell ()

@property(nonatomic,strong)UIImageView * TopImageView;

@property(nonatomic,strong)UIView * TopView;

@end


@implementation GoodsTopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYRandomColor;
        
        [self setup];
        
    }
    
    return self;
    
}


-(void)setTopImgBottomint:(float)TopImgBottomint{
    
    _TopImgBottomint = TopImgBottomint;
    
    [self.TopImageView mas_updateConstraints:^(MASConstraintMaker *make) {
           
        make.bottom.equalTo(self.mas_bottom).with.offset(_TopImgBottomint);
           
    }];
    
    [self.TopView mas_updateConstraints:^(MASConstraintMaker *make) {
              
        make.top.equalTo(self.TopImageView.mas_bottom).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
              
    }];
    
    
}





- (void)setup{
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"sale"];
    [self addSubview:Mainimage];
    self.TopImageView = Mainimage;
   
    UIView * VipView = [[UIView alloc] init];
    VipView.backgroundColor = UIColor.blackColor;
    [self addSubview:VipView];
    self.TopView = VipView;
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"京东";
    TitleLabel.frame = CGRectMake(20, 8, 120, 20);
    TitleLabel.textColor = UIColor.whiteColor;
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [VipView addSubview:TitleLabel];
    
    
    [self.TopImageView  mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(_TopImgBottomint);
        
    }];
    
    [VipView mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(Mainimage.mas_bottom).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
        
    }];
    
    

}



@end

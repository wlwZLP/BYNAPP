//
//  MyVipImgCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyVipImgCollectionViewCell.h"

@implementation MyVipImgCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    UIView * TopBgView = [[UIView alloc]init];
    TopBgView.backgroundColor = YYHexColor(@"#303030");
    TopBgView.frame = CGRectMake(0, 0, YYScreenWidth, 150);
    [self addSubview:TopBgView];
 
    
    UIImageView * TopImage = [[UIImageView alloc] init];
    TopImage.backgroundColor = [UIColor clearColor];
    TopImage.image = [UIImage imageNamed:@"viptop"];
    TopImage.frame = CGRectMake(12, 25 , YYScreenWidth - 24 , 150);
    [self addSubview:TopImage];
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"vipbg"];
    [self addSubview:Mainimage];
    [Mainimage mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.mas_top).with.offset(190);
       make.left.equalTo(self.mas_left).with.offset(12);
       make.bottom.equalTo(self.mas_bottom).with.offset(0);
       make.right.equalTo(self.mas_right).with.offset(-12);
       
    }];
    
   
    
    
  
    
}


@end

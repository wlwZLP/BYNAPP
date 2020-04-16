//
//  VipGridImgCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "VipGridImgCollectionViewCell.h"

@implementation VipGridImgCollectionViewCell

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
    Mainimage.image = [UIImage imageNamed:@"banner01"];
    [self addSubview:Mainimage];
    [Mainimage mas_makeConstraints:^(MASConstraintMaker *make) {
         
       make.top.equalTo(self.mas_top).with.offset(0);
       make.left.equalTo(self.mas_left).with.offset(0);
       make.bottom.equalTo(self.mas_bottom).with.offset(0);
       make.right.equalTo(self.mas_right).with.offset(0);
       
    }];
    [YYTools ChangeView:Mainimage RadiusSize:5 BorderColor:[UIColor clearColor]];
    self.MainImgView = Mainimage;
  
    
}



@end

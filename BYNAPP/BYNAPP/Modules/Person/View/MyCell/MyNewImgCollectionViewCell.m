//
//  MyNewImgCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyNewImgCollectionViewCell.h"

@implementation MyNewImgCollectionViewCell

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
       make.left.equalTo(self.mas_left).with.offset(12);
       make.bottom.equalTo(self.mas_bottom).with.offset(0);
       make.right.equalTo(self.mas_right).with.offset(-12);
       
    }];
    [YYTools ChangeView:Mainimage RadiusSize:10 BorderColor:[UIColor clearColor]];
    self.MainImgView = Mainimage;
  
    
}


@end

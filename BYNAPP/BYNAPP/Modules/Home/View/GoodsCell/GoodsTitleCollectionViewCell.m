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
        
        self.backgroundColor = YYRandomColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"Jingdong"];
    [self addSubview:Mainimage];
   
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"京东";
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:TitleLabel];
    
    
    [Mainimage mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
    }];
    
  

}

@end

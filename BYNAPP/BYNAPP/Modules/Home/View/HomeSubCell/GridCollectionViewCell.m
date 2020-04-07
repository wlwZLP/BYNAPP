//
//  GridCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GridCollectionViewCell.h"

@implementation GridCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
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
      
        make.top.equalTo(self.mas_top).with.offset(12);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(44, 44));
        
    }];
    
  

    [TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(Mainimage.mas_bottom).with.offset(8);
        make.centerX.equalTo(self);
        make.width.equalTo(self);
        make.height.mas_equalTo(15);
    }];
    



}



@end

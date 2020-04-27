//
//  UpdatetitleCollectionViewCell.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/27.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "UpdatetitleCollectionViewCell.h"

@implementation UpdatetitleCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = YYRandomColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIView * MainBGView = UIView.new;
    MainBGView.backgroundColor = YYMMColor;
    MainBGView.frame = CGRectMake(5, 8 , 8, 8);
    [self addSubview:MainBGView];
    [YYTools ChangeView:MainBGView RadiusSize:4 BorderColor:[UIColor clearColor]];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.frame = CGRectMake(20, 0 , self.ZLP_width - 20, 40);
    TitleLabel.text = @"文案文案文案文案文案文案文案文案文案文案文案文案文案文案文案";
    TitleLabel.numberOfLines = 0;
    TitleLabel.font = [UIFont systemFontOfSize:14];
    TitleLabel.textColor = YY66Color;
    TitleLabel.YYLineSpace = 4;
    [TitleLabel YYUpdateConstraints];
    [self addSubview:TitleLabel];
    self.MainTextLabel = TitleLabel;
 


}







@end

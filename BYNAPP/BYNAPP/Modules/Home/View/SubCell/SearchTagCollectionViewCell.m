//
//  SearchTagCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/20.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "SearchTagCollectionViewCell.h"

@implementation SearchTagCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIView * MainBGView = UIView.new;
    MainBGView.backgroundColor = YYHexColor(@"#F6F6F6");
    MainBGView.frame = CGRectMake(0, 0 , self.ZLP_width, self.ZLP_height);
    [self addSubview:MainBGView];
    [YYTools ChangeView:self RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"实时热卖";
    TitleLabel.frame = CGRectMake(0, 4 , self.ZLP_width, 20);
    TitleLabel.textColor = YY66Color;
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [MainBGView addSubview:TitleLabel];
    self.TextLabel = TitleLabel;
    [TitleLabel addLabelTarget:self action:@selector(LabelButtonClick)];


}


-(void)LabelButtonClick{
    
    self.labelClickBlockClick();
    
}




@end

//
//  WithdrawCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "WithdrawCollectionViewCell.h"

@implementation WithdrawCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
       
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIView * MainView = [[UIView alloc] init];
    MainView.backgroundColor = UIColor.whiteColor;
    MainView.frame = CGRectMake(12 , 0, YYScreenWidth - 24, 220);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView  RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    UIView * FLineView = UIView.new;
    FLineView.backgroundColor = YYE5Color;
    FLineView.frame = CGRectMake(16, 137, MainView.ZLP_width -32, 0.5);
    [MainView addSubview:FLineView];
    
    
    UIView * SLineView = UIView.new;
    SLineView.backgroundColor = YYE5Color;
    SLineView.frame = CGRectMake(16, 192, MainView.ZLP_width -32, 0.5);
    [MainView addSubview:SLineView];
    
  
    

    
    
}


-(void)WithdrawButtonClick{
    
    

    
}



@end

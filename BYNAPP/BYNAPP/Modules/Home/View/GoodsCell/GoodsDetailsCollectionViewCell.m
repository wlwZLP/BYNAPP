//
//  GoodsDetailsCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GoodsDetailsCollectionViewCell.h"

@interface GoodsDetailsCollectionViewCell ()



@end


@implementation GoodsDetailsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColor.whiteColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIView * MainBGView = UIView.new;
    MainBGView.backgroundColor = UIColor.whiteColor;
    MainBGView.frame = CGRectMake(0, 0, self.ZLP_width, 44);
    [self addSubview:MainBGView];
    self.MainBgView = MainBGView;
    
    
    UILabel * MainLabel = [[UILabel alloc]init];
    MainLabel.text = @"查看宝贝详情";
    MainLabel.frame = CGRectMake(12, 11 , 100, 20);
    MainLabel.textColor = YY33Color;
    MainLabel.textAlignment = NSTextAlignmentRight;
    MainLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [MainBGView addSubview:MainLabel];
    
    UIButton * ArrowBtn = [[UIButton alloc] init];
    ArrowBtn.frame = CGRectMake(self.ZLP_width - 20, 15 , 8, 13);
    [ArrowBtn setImage:[UIImage imageNamed:@"Righton"] forState:UIControlStateNormal];
    ArrowBtn.selected= NO;
    [MainBGView addSubview:ArrowBtn];
    self.ArrowBtn = ArrowBtn;
    
    UIButton *  OpenBtn = [[UIButton alloc] init];
    OpenBtn.backgroundColor = [UIColor clearColor];
    OpenBtn.frame = CGRectMake(self.ZLP_width -200, 0, 200, 44);
    [OpenBtn addTarget:self action:@selector(OpenBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [MainBGView addSubview:OpenBtn];
    

}




-(void)OpenBtnClick{
    
    if (self.ArrowBtn.selected == YES) {
        self.OpenDeatilsBtnBlockClick(1);
        self.ArrowBtn.selected = NO;
        [self.ArrowBtn setTransform:CGAffineTransformMakeRotation(0)];
    }else{
        [self.ArrowBtn setTransform:CGAffineTransformMakeRotation(M_PI * 0.5)];
        self.OpenDeatilsBtnBlockClick(0);
        self.ArrowBtn.selected = YES;
    }

}





@end

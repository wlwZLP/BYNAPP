//
//  YYWithdrawHeadView.m
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYWithdrawHeadView.h"

@implementation YYWithdrawHeadView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
   
        self.backgroundColor = UIColor.whiteColor;
        
        [self CreateHeaderView];

    }
    
    return self;
}



-(void)CreateHeaderView{
  
    
    UIButton * LeftBtn = [[UIButton alloc]init];
    [LeftBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [LeftBtn setTitleColor:YY22Color forState:UIControlStateSelected];
    LeftBtn.titleLabel.hidden = NO;
    LeftBtn.frame = CGRectMake( YYScreenWidth/4 - 22 , 11 , 44 , 22);
    [LeftBtn setAdjustsImageWhenHighlighted:NO];
    LeftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [LeftBtn setTitle:@"佣金" forState:UIControlStateNormal];
    LeftBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [LeftBtn addTarget:self action:@selector(LeftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:LeftBtn];
    
    UIView * LineView = [[UIView alloc]init];
    LineView.frame = CGRectMake(YYScreenWidth/4 - 22 , 41 , 44 , 3 );
    LineView.backgroundColor = YYMMColor;
    [self addSubview:LineView];
    
    UIButton * RightBtn = [[UIButton alloc]init];
    [RightBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [RightBtn setTitleColor:YY22Color forState:UIControlStateSelected];
    RightBtn.titleLabel.hidden = NO;
    RightBtn.frame = CGRectMake( YYScreenWidth * 0.75 - 22 , 11 , 44 , 22);
    [RightBtn setAdjustsImageWhenHighlighted:NO];
    RightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [RightBtn setTitle:@"会员费" forState:UIControlStateNormal];
    RightBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [RightBtn addTarget:self action:@selector(RightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:RightBtn];
    
    

}



-(void)LeftButtonClick:(UIButton*)sender{
    
      self.TopLeftBtnBlockClick();
    
}


-(void)RightButtonClick:(UIButton*)sender{
   
      self.TopRightBlockClick();
    
}

@end

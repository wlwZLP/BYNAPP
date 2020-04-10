//
//  YYTeamHeadView.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYTeamHeadView.h"

@implementation YYTeamHeadView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
   
        self.backgroundColor = UIColor.whiteColor;
        
        [self CreateHeaderView];

    }
    
    return self;
}



-(void)CreateHeaderView{
  
     
    UIView * LLineView = UIView.new;
    LLineView.backgroundColor = YYE5Color;
    LLineView.frame = CGRectMake(0, 36, self.ZLP_width, 0.5);
    [self addSubview:LLineView];
    
    UIButton * LeftBtn = [[UIButton alloc]init];
    [LeftBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [LeftBtn setTitleColor:YY22Color forState:UIControlStateSelected];
    LeftBtn.titleLabel.hidden = YES;
    LeftBtn.frame = CGRectMake(0 , 0, self.ZLP_width/2, 35);
    [LeftBtn setAdjustsImageWhenHighlighted:NO];
    LeftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [LeftBtn setTitle:@"直邀" forState:UIControlStateNormal];
    LeftBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [LeftBtn addTarget:self action:@selector(LeftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:LeftBtn];
    
    
    UIView * MLineView = UIView.new;
    MLineView.backgroundColor = YYE5Color;
    MLineView.frame = CGRectMake( self.ZLP_width/2, 8 , 0.5, 21);
    [self addSubview:MLineView];
    
    UIButton * RightBtn = [[UIButton alloc]init];
    [RightBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [RightBtn setTitleColor:YY22Color forState:UIControlStateSelected];
    RightBtn.titleLabel.hidden = YES;
    RightBtn.frame = CGRectMake(self.ZLP_width/2 , 0, self.ZLP_width/2, 35);
    [RightBtn setAdjustsImageWhenHighlighted:NO];
    RightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [RightBtn setTitle:@"其他" forState:UIControlStateNormal];
    RightBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [RightBtn addTarget:self action:@selector(RightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:RightBtn];
    
    
    UIView * BgView = [[UIView alloc]init];
    BgView.backgroundColor = YYHexColor(@"#F9F9F9");
    BgView.frame = CGRectMake(12, 105, YYScreenWidth - 24, 40);
    [self addSubview:BgView];
    
    
    

}



-(void)LeftButtonClick:(UIButton*)sender{
    
      self.TopLeftBtnBlockClick();
    
}


-(void)RightButtonClick:(UIButton*)sender{
   
      self.TopRightBlockClick();
    
}






@end

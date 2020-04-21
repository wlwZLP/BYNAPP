//
//  YYWChatView.m
//  BYNAPP
//
//  Created by apple on 2020/4/21.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYWChatView.h"

@implementation YYWChatView

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
    
    UIView * CenterView = [[UIView alloc]init];
    CenterView.frame = CGRectMake(self.ZLP_centerX -150, self.ZLP_centerY -100, 300, 200);
    CenterView.backgroundColor = UIColor.whiteColor;
    [self addSubview:CenterView];
    [YYTools ChangeView:CenterView RadiusSize:8 BorderColor:[UIColor clearColor]];
    

    
    UIButton * OkBtn = UIButton.new;
    [OkBtn setTitle:@"好的" forState:UIControlStateNormal];
    OkBtn.frame = CGRectMake(20 , CenterView.ZLP_height - 60, CenterView.ZLP_width - 40, 44);
    OkBtn.backgroundColor = YYHexColor(@"#FFD409");
    [OkBtn addTarget:self action:@selector(OKButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [OkBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [CenterView addSubview:OkBtn];
    [YYTools ChangeView:OkBtn RadiusSize:8 BorderColor:[UIColor clearColor]];
    
    
}

@end

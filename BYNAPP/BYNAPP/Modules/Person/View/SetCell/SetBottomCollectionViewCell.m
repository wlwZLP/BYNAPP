//
//  SetBottomCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "SetBottomCollectionViewCell.h"

@implementation SetBottomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self setup];
        
    }
    
    return self;
    
}

- (void)setup{
    
    UIButton * ExitBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, 20 , self.ZLP_width - 24 , 45)];
    [ExitBtn addTarget:self action:@selector(ExitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    ExitBtn.backgroundColor = YYHexColor(@"#FFD409");
    [ExitBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [ExitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [ExitBtn.titleLabel setFont :[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [self addSubview:ExitBtn];
    [YYTools ChangeView:ExitBtn RadiusSize:16 BorderColor:YYHexColor(@"#FFD409")];
    

    
}



-(void)ExitButtonClick{
    
    
    
    
}


@end


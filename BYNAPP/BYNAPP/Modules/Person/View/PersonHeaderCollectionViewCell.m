//
//  PersonHeaderCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/3.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "PersonHeaderCollectionViewCell.h"

@interface PersonHeaderCollectionViewCell ()




@end

@implementation PersonHeaderCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
       
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup
{
    
    
    UIView * TopBGView = [[UIView alloc] init];
    TopBGView.frame = CGRectMake(0, 0, YYScreenWidth, YYScreenWidth * 0.52);
    TopBGView.backgroundColor = [UIColor yellowColor];
    [self addSubview:TopBGView];
    [TopBGView.layer addSublayer:[YYTools setGradualChangingColor:TopBGView fromColor:@"#FFDD39" toColor:@"#FFD117"]];

    
    UIImageView * BGimage = [[UIImageView alloc] init];
    BGimage.image = [UIImage imageNamed:@"blackBg"];
    [self addSubview:BGimage];
    
    [BGimage mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.mas_left).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        make.height.offset(145);
    
    }];
    
    
    
    
    
}












@end

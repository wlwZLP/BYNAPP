//
//  DetailsTopCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "DetailsTopCollectionViewCell.h"


@interface DetailsTopCollectionViewCell ()



@end


@implementation DetailsTopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}







- (void)setup{
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"sale"];
    Mainimage.frame = CGRectMake(0, 0, YYScreenWidth,YYScreenWidth * 0.62);
    [self addSubview:Mainimage];
 
   
    UIView * VipView = [[UIView alloc] init];
    VipView.backgroundColor = UIColor.whiteColor;
    [self addSubview:VipView];
    [VipView mas_makeConstraints:^(MASConstraintMaker *make) {
         
        make.right.equalTo(self.mas_right).with.offset(-12);
        make.left.equalTo(self.mas_left).with.offset(12);
        make.bottom.equalTo(self.mas_bottom).with.offset(-6);
        make.height.offset(130);
       
    }];
    [YYTools ChangeView:VipView RadiusSize:8 BorderColor:[UIColor clearColor]];
    

}







@end

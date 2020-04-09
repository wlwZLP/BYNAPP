//
//  GoodsCouponCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GoodsCouponCollectionViewCell.h"

@implementation GoodsCouponCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColor.whiteColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"lingqu"];
    [self addSubview:Mainimage];
   
    
    [Mainimage mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(self.mas_top).with.offset(5);
        make.left.equalTo(self.mas_left).with.offset(12);
        make.right.equalTo(self.mas_right).with.offset(-12);
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
    }];
    
  

}


@end

//
//  GoodsCourseCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GoodsCourseCollectionViewCell.h"

@implementation GoodsCourseCollectionViewCell

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
    Mainimage.image = [UIImage imageNamed:@"course"];
    [self addSubview:Mainimage];
    
    [Mainimage mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(self.mas_top).with.offset(5);
        make.left.equalTo(self.mas_left).with.offset(12);
        make.right.equalTo(self.mas_right).with.offset(-12);
        make.bottom.equalTo(self.mas_bottom).with.offset(-15);
    }];
    [Mainimage addTarget:self action:@selector(MainImgClick)];
    
  

}


-(void)MainImgClick{
    
    self.IMgClickBlockClick();
    
}



@end

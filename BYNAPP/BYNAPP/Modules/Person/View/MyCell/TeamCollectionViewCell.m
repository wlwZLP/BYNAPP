//
//  TeamCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "TeamCollectionViewCell.h"

@implementation TeamCollectionViewCell

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
    Mainimage.frame = CGRectMake(22, 6, 33, 33);
    Mainimage.image = [UIImage imageNamed:@"BYNLogo"];
    [self addSubview:Mainimage];
    [YYTools ChangeView:Mainimage RadiusSize:16 BorderColor:[UIColor clearColor]];
    
    UILabel * NameLabel = [[UILabel alloc]init];
    NameLabel.text = @"小胡同学";
    NameLabel.frame = CGRectMake(72, 12, 60 , 20);
    NameLabel.textColor = YY33Color;
    NameLabel.textAlignment = NSTextAlignmentLeft;
    NameLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:NameLabel];
    
  
    
    UILabel * TimeLabel = [[UILabel alloc]init];
    TimeLabel.text = @"2019-03-02";
    TimeLabel.textColor = YY33Color;
    TimeLabel.frame = CGRectMake(self.ZLP_width - 110, 12, 84 , 20);
    TimeLabel.textAlignment = NSTextAlignmentRight;
    TimeLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:TimeLabel];
    
  
   
    
   
    


}
@end

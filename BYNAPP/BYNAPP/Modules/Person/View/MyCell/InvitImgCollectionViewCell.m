//
//  InvitImgCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "InvitImgCollectionViewCell.h"

@implementation InvitImgCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [YYTools ChangeView:self RadiusSize:5 BorderColor:[UIColor clearColor]];
        
        [self setup];
        
        
       // @"本地项目添加到github"
        
    }
    
    return self;
    
}



- (void)setup{
    
  
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.frame = CGRectMake(0, 0, self.ZLP_width, self.height);
    Mainimage.image = [UIImage imageNamed:@"Invitcode"];
    [self addSubview:Mainimage];
    
    self.InvitImgView = Mainimage;

    
 
}


@end

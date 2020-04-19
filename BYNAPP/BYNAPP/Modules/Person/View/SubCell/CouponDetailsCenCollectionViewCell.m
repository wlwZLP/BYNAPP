//
//  CouponDetailsCenCollectionViewCell.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/18.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "CouponDetailsCenCollectionViewCell.h"

@implementation CouponDetailsCenCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    UIView * MainBGView = UIView.new;
    MainBGView.backgroundColor = UIColor.whiteColor;
    MainBGView.frame = CGRectMake(12, 0, self.ZLP_width - 24, self.ZLP_height);
    [self addSubview:MainBGView];
    
    UIImageView * CenImage = [[UIImageView alloc] init];
    CenImage.backgroundColor = [UIColor clearColor];
    CenImage.image = [UIImage imageNamed:@"couponcen"];
    CenImage.frame = CGRectMake(0, 0 , MainBGView.ZLP_width,  MainBGView.ZLP_height);
    [MainBGView addSubview:CenImage];
    
    UIImageView * QrCodeImage = [[UIImageView alloc] init];
    QrCodeImage.backgroundColor = [UIColor clearColor];
    QrCodeImage.image = [UIImage imageNamed:@"MyWX"];
    QrCodeImage.frame = CGRectMake(MainBGView.ZLP_width/2 - 98.5, MainBGView.ZLP_height/2 - 98.5 , 197 , 197);
    [MainBGView addSubview:QrCodeImage];
   

}






@end

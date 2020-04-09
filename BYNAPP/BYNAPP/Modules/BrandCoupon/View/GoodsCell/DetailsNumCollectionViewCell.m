//
//  DetailsNumCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "DetailsNumCollectionViewCell.h"


@interface DetailsNumCollectionViewCell ()



@end


@implementation DetailsNumCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}







- (void)setup{
    
    UIView * MainView = [[UIView alloc] init];
    MainView.backgroundColor = UIColor.whiteColor;
    MainView.frame = CGRectMake(12, 6, YYScreenWidth -24,self.ZLP_height -12);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView RadiusSize:8 BorderColor:[UIColor clearColor]];
    
    
    
    
   
    

}





@end

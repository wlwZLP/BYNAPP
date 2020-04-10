//
//  YYReportHeadView.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYReportHeadView.h"

@implementation YYReportHeadView

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
  
     
    UIView * MainView = UIView.new;
    MainView.backgroundColor = UIColor.whiteColor;
    MainView.frame = CGRectMake(12, 16, self.ZLP_width -  24, self.ZLP_height -  32);
    [self addSubview:MainView];
    [MainView.layer addSublayer:[YYTools SetGradLayerView:MainView FromColor:@"#FFDD39" ToColor:@"#FFD117"]];
    [YYTools ChangeView:MainView RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    
   
    
    
    
    

}







@end

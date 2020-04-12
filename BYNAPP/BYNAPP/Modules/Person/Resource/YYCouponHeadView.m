//
//  YYCouponHeadView.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYCouponHeadView.h"




@implementation YYCouponHeadView

- (void)drawRect:(CGRect)rect {
   
    
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
   
//      self.TitleArray = [[NSArray alloc]initWithObjects:@"全部",@"待支付",@"发货中",@"已成功",@"已失败",nil ];
     
        self.TitleArray = [[NSArray alloc]initWithObjects:@"全部",@"待结算",@"已结算",@"已失败",nil ];
        
      [self CreateHeaderBtn];

    }
    return self;
}



-(void)CreateHeaderBtn{
    
    int  HomelabelWith =  [[UIScreen mainScreen] bounds].size.width / self.TitleArray.count;
    
     for (NSUInteger i = 0; i < self.TitleArray.count; i++) {
         
         CGFloat X =  i * HomelabelWith  ;
         UIButton *titleButton = [[UIButton alloc]init];
         [titleButton setTitleColor:YY22Color forState:UIControlStateSelected];
         [titleButton setTitleColor:YY22Color forState:UIControlStateNormal];
         titleButton.titleLabel.hidden = YES;
         // frame
         titleButton.frame = CGRectMake(X , 10, HomelabelWith, 20);
         [titleButton setAdjustsImageWhenHighlighted:NO];
         titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
         titleButton.titleLabel.font = [UIFont systemFontOfSize: 14.0];
         titleButton.tag = i;
         [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
         titleButton.layer.masksToBounds = YES;
         titleButton.layer.cornerRadius = 10;
         [self addSubview:titleButton];
         [titleButton setTitle:self.TitleArray[i] forState:UIControlStateNormal];
     
     }
    

}




-(void)titleButtonClick:(UIButton*)sender{
    
   
    self.TitleBtnBlockClick(sender.tag);
    
    
}





@end

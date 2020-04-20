//
//  YYOrderHeadView.m
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYOrderHeadView.h"


@interface YYOrderHeadView ()

/** 上一次点击的标题按钮 */
@property (nonatomic, strong) UIButton * previousClickedTitleButton;

@property(nonatomic,strong)UIView * titleUnderline;

@end

@implementation YYOrderHeadView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {

     
     }
    
     return self;
    
}

-(void)setTitleArray:(NSArray *)TitleArray{
    
     _TitleArray = TitleArray;
    
     [self CreateHeaderBtn];
    
}


-(void)CreateHeaderBtn{
    
     int  HomelabelWith =  [[UIScreen mainScreen] bounds].size.width / self.TitleArray.count;
    
     for (NSUInteger i = 0; i < self.TitleArray.count; i++) {
         
         CGFloat X =  i * HomelabelWith  ;
         UIButton *titleButton = [[UIButton alloc]init];
         [titleButton setTitleColor:YY22Color forState:UIControlStateSelected];
         [titleButton setTitleColor:YY66Color forState:UIControlStateNormal];
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
    
    // 下划线
    UIButton * firstTitleButton = self.subviews.firstObject;
    firstTitleButton.selected = YES;
    self.previousClickedTitleButton = firstTitleButton;
    UIView *titleUnderline = [[UIView alloc] init];
    titleUnderline.ZLP_height = 3;
    titleUnderline.ZLP_y = self.ZLP_height - titleUnderline.ZLP_height- 3;
    titleUnderline.backgroundColor = YYHexColor(@"#FFD409");
    [self addSubview:titleUnderline];
    self.titleUnderline = titleUnderline;
    self.titleUnderline.ZLP_width = 30;
    self.titleUnderline.ZLP_centerX = firstTitleButton.ZLP_centerX;
    
    
    
}





-(void)titleButtonClick:(UIButton*)sender{
    
     self.previousClickedTitleButton.selected = NO;
    
     sender.selected = YES;
    
     self.previousClickedTitleButton = sender;
     
     self.titleUnderline.ZLP_centerX = sender.ZLP_centerX;
    
     self.TitleBtnBlockClick(sender.tag);
    
}




@end

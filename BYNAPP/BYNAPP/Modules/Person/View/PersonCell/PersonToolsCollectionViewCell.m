//
//  PersonToolsCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/3.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "PersonToolsCollectionViewCell.h"

@implementation PersonToolsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;

        [self setup];
        
    }
    
    return self;
    
}



- (void)setup
{
    
    
    UIView * TopView = UIView.new;
    TopView.backgroundColor =  [UIColor whiteColor];
    TopView.frame = CGRectMake(0, 8, YYScreenWidth, 40);
    [self addSubview:TopView];
    
    UILabel * MainTitle = [[UILabel alloc]init];
    MainTitle.text = @"实用小工具";
    MainTitle.textColor = YY22Color;
    MainTitle.frame = CGRectMake(12, 10, 140, 20);
    MainTitle.textAlignment = NSTextAlignmentLeft;
    MainTitle.font = [UIFont systemFontOfSize:14 weight:0];
    [TopView addSubview:MainTitle];
    
    UIView * LineView = UIView.new;
    LineView.backgroundColor =  YYE1Color;
    LineView.frame = CGRectMake(0, 47, YYScreenWidth, 0.5);
    [self addSubview:LineView];
    
    
    UIView * LeftBGView = [[UIView alloc] init];
    LeftBGView.frame = CGRectMake(0, 48, YYScreenWidth/4, 72);
    LeftBGView.backgroundColor = [UIColor whiteColor];
    [self addSubview:LeftBGView];
    
    UIImageView * LeftImage = [[UIImageView alloc] init];
    LeftImage.backgroundColor = [UIColor clearColor];
    LeftImage.image = [UIImage imageNamed:@"collect"];
    LeftImage.frame = CGRectMake(YYScreenWidth/8 - 12, 10, 24, 22);
    [LeftBGView addSubview:LeftImage];
   
    UILabel * LeftTitle = [[UILabel alloc]init];
    LeftTitle.text = @"我的收藏";
    LeftTitle.textColor = YY22Color;
    LeftTitle.frame = CGRectMake(YYScreenWidth/8 - 26, 40, 52, 13);
    LeftTitle.textAlignment = NSTextAlignmentLeft;
    LeftTitle.font = [UIFont systemFontOfSize:12 weight:0];
    [LeftBGView addSubview:LeftTitle];
    
    UIButton * LeftBtn = [[UIButton alloc]init];
    LeftBtn.frame = CGRectMake(0 , 0, YYScreenWidth/4, 72);
    [LeftBtn setBackgroundColor:[UIColor clearColor]];
    LeftBtn.tag = 0;
    [LeftBtn addTarget:self action:@selector(ToolsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [LeftBGView addSubview:LeftBtn];

    UIView * LeftCenterView = [[UIView alloc] init];
    LeftCenterView.frame = CGRectMake(YYScreenWidth/4, 48, YYScreenWidth/4, 72);
    LeftCenterView.backgroundColor = [UIColor whiteColor];
    [self addSubview:LeftCenterView];
    
    UIImageView * LeftCenterImage = [[UIImageView alloc] init];
    LeftCenterImage.backgroundColor = [UIColor clearColor];
    LeftCenterImage.image = [UIImage imageNamed:@"zuji"];
    LeftCenterImage.frame = CGRectMake(YYScreenWidth/8 - 12, 10, 20, 22);
    [LeftCenterView addSubview:LeftCenterImage];
   
    UILabel * LeftCenterTitle = [[UILabel alloc]init];
    LeftCenterTitle.text = @"我的足迹";
    LeftCenterTitle.textColor = YY22Color;
    LeftCenterTitle.frame = CGRectMake(YYScreenWidth/8 - 26, 40, 52, 13);
    LeftCenterTitle.textAlignment = NSTextAlignmentLeft;
    LeftCenterTitle.font = [UIFont systemFontOfSize:12 weight:0];
    [LeftCenterView addSubview:LeftCenterTitle];
     
    UIButton * LeftCenterBtn = [[UIButton alloc]init];
    LeftCenterBtn.frame = CGRectMake(0 , 0, YYScreenWidth/4, 72);
    [LeftCenterBtn setBackgroundColor:[UIColor clearColor]];
    LeftCenterBtn.tag = 1;
    [LeftCenterBtn addTarget:self action:@selector(ToolsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [LeftCenterView addSubview:LeftCenterBtn];
    
    
    UIView * RightCenterView = [[UIView alloc] init];
    RightCenterView.frame = CGRectMake(YYScreenWidth/2, 48, YYScreenWidth/4, 72);
    RightCenterView.backgroundColor = [UIColor whiteColor];
    [self addSubview:RightCenterView];
    
    UIImageView * RightCenterImage = [[UIImageView alloc] init];
    RightCenterImage.backgroundColor = [UIColor clearColor];
    RightCenterImage.image = [UIImage imageNamed:@"new"];
    RightCenterImage.frame = CGRectMake(YYScreenWidth/8 - 12, 10, 20, 22);
    [RightCenterView addSubview:RightCenterImage];
   
    UILabel * RightCenterTitle = [[UILabel alloc]init];
    RightCenterTitle.text = @"新人必看";
    RightCenterTitle.textColor = YY22Color;
    RightCenterTitle.frame = CGRectMake(YYScreenWidth/8 - 26, 40, 52, 13);
    RightCenterTitle.textAlignment = NSTextAlignmentLeft;
    RightCenterTitle.font = [UIFont systemFontOfSize:12 weight:0];
    [RightCenterView addSubview:RightCenterTitle];

    UIButton * RightCenterBtn = [[UIButton alloc]init];
    RightCenterBtn.frame = CGRectMake(0 , 0, YYScreenWidth/4, 72);
    [RightCenterBtn setBackgroundColor:[UIColor clearColor]];
    RightCenterBtn.tag = 2;
    [RightCenterBtn addTarget:self action:@selector(ToolsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [RightCenterView addSubview:RightCenterBtn];
    
    UIView * RightBGView = [[UIView alloc] init];
    RightBGView.frame = CGRectMake(YYScreenWidth * 0.75, 48, YYScreenWidth/4, 72);
    RightBGView.backgroundColor = [UIColor whiteColor];
    [self addSubview:RightBGView];
    
    UIImageView * RightImage = [[UIImageView alloc] init];
    RightImage.backgroundColor = [UIColor clearColor];
    RightImage.image = [UIImage imageNamed:@"Invit"];
    RightImage.frame = CGRectMake(YYScreenWidth/8 - 12, 10, 24, 24);
    [RightBGView addSubview:RightImage];
   
    UILabel * RightTitle = [[UILabel alloc]init];
    RightTitle.text = @"邀请好友";
    RightTitle.textColor = YY22Color;
    RightTitle.frame = CGRectMake(YYScreenWidth/8 - 26, 40, 52, 13);
    RightTitle.textAlignment = NSTextAlignmentLeft;
    RightTitle.font = [UIFont systemFontOfSize:12 weight:0];
    [RightBGView addSubview:RightTitle];
    
    UIButton * RightBtn = [[UIButton alloc]init];
    RightBtn.frame = CGRectMake(0 , 0, YYScreenWidth/4, 72);
    [RightBtn setBackgroundColor:[UIColor clearColor]];
    RightBtn.tag = 3;
    [RightBtn addTarget:self action:@selector(ToolsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [RightBGView addSubview:RightBtn];
    
    

    
}

-(void)ToolsButtonClick:(UIButton*)titleButton{
    
   if (titleButton.tag == 0) {
        self.PersonToolsBtnBlockClick(@"我的收藏");
    }else if (titleButton.tag == 1){
        self.PersonToolsBtnBlockClick(@"团队足迹");
    }else if (titleButton.tag == 2){
        self.PersonToolsBtnBlockClick(@"新人必看");
    }else if (titleButton.tag == 3){
        self.PersonToolsBtnBlockClick(@"邀请好友");
    }
    
}



@end

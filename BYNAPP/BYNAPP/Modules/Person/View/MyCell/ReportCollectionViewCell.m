//
//  ReportCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "ReportCollectionViewCell.h"

@interface ReportCollectionViewCell ()

@property (nonatomic, strong) UILabel * TodayTopLabel;

@property (nonatomic, strong) UILabel * TodayBotLabel;

@property (nonatomic, strong) UILabel * YesTopLabel;

@property (nonatomic, strong) UILabel * YesBotLabel;

@property (nonatomic, strong) UILabel * MonTopLabel;

@property (nonatomic, strong) UILabel * MonBotLabel;

@property (nonatomic, strong) UILabel * AllTopLabel;

@property (nonatomic, strong) UILabel * AllBotLabel;

@end


@implementation ReportCollectionViewCell

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
    MainView.frame = CGRectMake(0 , 0 , YYScreenWidth , 210);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView  RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
//    TitleLabel.text = @"";
    TitleLabel.textColor = YY33Color;
    TitleLabel.frame = CGRectMake( 15 , 16 , 250, 20);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:TitleLabel];
    self.TitleLabel = TitleLabel;
    
    UIImageView * WenImage = [[UIImageView alloc] init];
    WenImage.backgroundColor = [UIColor clearColor];
    WenImage.frame = CGRectMake( self.ZLP_width -25 , 12 , 15 , 15);
    WenImage.image = [UIImage imageNamed:@"wenhao"];
    [self addSubview:WenImage];
    [WenImage addTarget:self action:@selector(WHImgButtonClick)];
    
    UIView * LineView = [[UIView alloc] init];
    LineView.backgroundColor = YYE5Color;
    LineView.frame = CGRectMake(0 , 44 , YYScreenWidth , 0.5);
    [self addSubview:LineView];
    
    UILabel * TodayTopLabel = [[UILabel alloc]init];
    TodayTopLabel.textColor = YY99Color;
    TodayTopLabel.frame = CGRectMake( 32 , 73 , self.ZLP_width/2 - 32, 20);
    TodayTopLabel.textAlignment = NSTextAlignmentLeft;
    TodayTopLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:TodayTopLabel];
    self.TodayTopLabel = TodayTopLabel;
    
    UILabel * TodayBotLabel = [[UILabel alloc]init];
    TodayBotLabel.textColor = YY22Color;
    TodayBotLabel.frame = CGRectMake( 32 , 93 , self.ZLP_width/2 - 32, 20);
    TodayBotLabel.textAlignment = NSTextAlignmentLeft;
    TodayBotLabel.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:TodayBotLabel];
    self.TodayBotLabel = TodayBotLabel;
    
    UILabel * YesTopLabel = [[UILabel alloc]init];
    YesTopLabel.textColor = YY99Color;
    YesTopLabel.frame = CGRectMake( self.ZLP_width/2 + 32 , 73 , self.ZLP_width/2 - 32, 20);
    YesTopLabel.textAlignment = NSTextAlignmentLeft;
    YesTopLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:YesTopLabel];
    self.YesTopLabel = YesTopLabel;
    
    UILabel * YesBotLabel = [[UILabel alloc]init];
    YesBotLabel.textColor = YY22Color;
    YesBotLabel.frame = CGRectMake( self.ZLP_width/2 + 32 , 93 , self.ZLP_width/2 - 32, 20);
    YesBotLabel.textAlignment = NSTextAlignmentLeft;
    YesBotLabel.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:YesBotLabel];
    self.YesBotLabel = YesBotLabel;
    
    UILabel * MonTopLabel = [[UILabel alloc]init];
    MonTopLabel.text = @"今日预估收益(元)";
    MonTopLabel.textColor = YY99Color;
    MonTopLabel.frame = CGRectMake( 32 , 143 , self.ZLP_width/2 - 32, 20);
    MonTopLabel.textAlignment = NSTextAlignmentLeft;
    MonTopLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:MonTopLabel];
    self.MonTopLabel = MonTopLabel;
    
    UILabel * MonBotLabel = [[UILabel alloc]init];
    MonBotLabel.text = @"今天";
    MonBotLabel.textColor = YY22Color;
    MonBotLabel.frame = CGRectMake( 32 , 164 , self.ZLP_width/2 - 32, 20);
    MonBotLabel.textAlignment = NSTextAlignmentLeft;
    MonBotLabel.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:MonBotLabel];
    self.MonBotLabel = MonBotLabel;
    
    UILabel * AllTopLabel = [[UILabel alloc]init];
    AllTopLabel.text = @"今日预估收益(元)";
    AllTopLabel.textColor = YY99Color;
    AllTopLabel.frame = CGRectMake( self.ZLP_width/2 + 32 , 143 , self.ZLP_width/2 - 32, 20);
    AllTopLabel.textAlignment = NSTextAlignmentLeft;
    AllTopLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:AllTopLabel];
    self.AllTopLabel = AllTopLabel;
    
    UILabel * AllBotLabel = [[UILabel alloc]init];
    AllBotLabel.text = @"今天";
    AllBotLabel.textColor = YY22Color;
    AllBotLabel.frame = CGRectMake( self.ZLP_width/2 + 32 , 164 , self.ZLP_width/2 - 32, 20);
    AllBotLabel.textAlignment = NSTextAlignmentLeft;
    AllBotLabel.font = [UIFont systemFontOfSize:18 weight:0];
    [self addSubview:AllBotLabel];
    self.AllBotLabel = AllBotLabel;
    

    
}


-(void)setDataArray:(NSArray<ReportModel *> *)DataArray{
    
    _DataArray = DataArray;
    
    self.TodayTopLabel.text = self.DataArray[0].title;
    
    self.TodayBotLabel.text = self.DataArray[0].value;
    
    self.YesTopLabel.text = self.DataArray[1].title;
    
    self.YesBotLabel.text = self.DataArray[1].value;
    
    self.MonTopLabel.text = self.DataArray[2].title;
    
    self.MonBotLabel.text = self.DataArray[2].value;
    
    self.AllTopLabel.text = self.DataArray[3].title;
    
    self.AllBotLabel.text = self.DataArray[3].value;
    
}



-(void)WHImgButtonClick{
    
    self.ImgBtnBlockClick();
    
}


@end

//
//  DetailsNotesCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "DetailsNotesCollectionViewCell.h"


@interface DetailsNotesCollectionViewCell ()

@property(nonatomic,assign)UILabel * ContentLabel;

@end


@implementation DetailsNotesCollectionViewCell

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
    MainView.frame = CGRectMake(12, 0 , YYScreenWidth -24,self.ZLP_height -12);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView RadiusSize:8 BorderColor:[UIColor clearColor]];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"使用须知";
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.frame = CGRectMake(14, 15, 150, 20);
    TitleLabel.font = [UIFont systemFontOfSize:15 weight:1];
    [MainView addSubview:TitleLabel];
    
    UILabel * ConentLabel = [[UILabel alloc]init];
    ConentLabel.textColor = YY66Color;
    ConentLabel.textAlignment = NSTextAlignmentLeft;
    ConentLabel.numberOfLines = 0;
    ConentLabel.font = [UIFont systemFontOfSize:14 weight:0];
    [MainView addSubview:ConentLabel];
    [ConentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         
       make.top.equalTo(MainView.mas_top).with.offset(45);
       make.left.equalTo(MainView.mas_left).with.offset(12);
       make.bottom.equalTo(MainView.mas_bottom).with.offset(-8);
       make.right.equalTo(MainView.mas_right).with.offset(-12);
        
    }];
    self.ContentLabel = ConentLabel;
    

}


-(void)setContentLabelString:(NSString *)ContentLabelString{
    
    _ContentLabelString = ContentLabelString;
    
    self.ContentLabel.text = self.ContentLabelString;
    
}

@end

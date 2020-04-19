//
//  TeamCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "TeamCollectionViewCell.h"

@interface TeamCollectionViewCell ()

@property (nonatomic, strong) UIImageView * Mainimage;

@property (nonatomic, strong) UILabel * TitleLabel;

@property (nonatomic, strong) UILabel * TimeLabel;

@property (nonatomic, strong) UILabel * TeamNumLabel;

@end

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
    self.Mainimage = Mainimage;
    
    UILabel * NameLabel = [[UILabel alloc]init];
    NameLabel.text = @"小胡同学";
    NameLabel.frame = CGRectMake(72, 12, 80 , 20);
    NameLabel.adjustsFontSizeToFitWidth = YES;
    NameLabel.textColor = YY33Color;
    NameLabel.textAlignment = NSTextAlignmentLeft;
    NameLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:NameLabel];
    self.TitleLabel = NameLabel;
    
    
    UILabel * TeamNumLabel = [[UILabel alloc]init];
    TeamNumLabel.text = @"团队人数";
    TeamNumLabel.backgroundColor = UIColor.clearColor;
    TeamNumLabel.frame = CGRectMake((self.ZLP_width- 24) * 0.38, 12, (self.ZLP_width- 24) * 0.30 , 20);
    TeamNumLabel.adjustsFontSizeToFitWidth = YES;
    TeamNumLabel.textColor = YY33Color;
    TeamNumLabel.textAlignment = NSTextAlignmentCenter;
    TeamNumLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [self addSubview:TeamNumLabel];
    self.TeamNumLabel = TeamNumLabel;
  
    
    UILabel * TimeLabel = [[UILabel alloc]init];
    TimeLabel.text = @"2019-03-02";
    TimeLabel.backgroundColor = UIColor.clearColor;
    TimeLabel.textColor = YY33Color;
    TimeLabel.frame = CGRectMake((self.ZLP_width- 24) * 0.72, 12, (self.ZLP_width- 24) * 0.30 , 20);
    TimeLabel.textAlignment = NSTextAlignmentCenter;
    TimeLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:TimeLabel];
    self.TimeLabel = TimeLabel;

}



-(void)setModel:(MyTeamModel *)Model{
    
    _Model = Model;
    
    [self.Mainimage sd_setImageWithURL:[NSURL URLWithString:Model.avatar] placeholderImage:[UIImage imageNamed:@"Jingdong"]];
    
    self.TitleLabel.text = Model.name;
    
    self.TeamNumLabel.text = Model.team_num;
    
    self.TimeLabel.text = [Model.last_login_time substringWithRange:NSMakeRange(0, 10)];;
    
}





@end

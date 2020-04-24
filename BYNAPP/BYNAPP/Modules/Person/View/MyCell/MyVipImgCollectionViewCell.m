//
//  MyVipImgCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyVipImgCollectionViewCell.h"
#import "UserModel.h"

@interface MyVipImgCollectionViewCell ()

@property(nonatomic,strong)UserModel * Model;

@end


@implementation MyVipImgCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        self.Model = [YYSaveTool YY_GetSaveModelWithkey:YYUser modelClass:UserModel.class];
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    UIView * TopBgView = [[UIView alloc]init];
    TopBgView.backgroundColor = YYHexColor(@"#303030");
    TopBgView.frame = CGRectMake(0, 0, YYScreenWidth, 150);
    [self addSubview:TopBgView];
 
    
    UIImageView * TopImage = [[UIImageView alloc] init];
    TopImage.backgroundColor = [UIColor clearColor];
    TopImage.image = [UIImage imageNamed:@"viptop"];
    TopImage.frame = CGRectMake(12, 25 , YYScreenWidth - 24 , 150);
    [self addSubview:TopImage];
    
    UIImageView * HeadImage = [[UIImageView alloc] init];
    HeadImage.image = [UIImage imageNamed:@"MainBG"];
    HeadImage.frame = CGRectMake(28, 50 , 45, 45);
    [self addSubview:HeadImage];
    [YYTools ChangeView:HeadImage RadiusSize:22 BorderColor:[UIColor clearColor]];
    [HeadImage sd_setImageWithURL:[NSURL URLWithString:self.Model.avatar] placeholderImage:[UIImage imageNamed:@"MianBG"]];
   
    UILabel * NameLabel = [[UILabel alloc]init];
    NameLabel.text = self.Model.name;
    NameLabel.textAlignment = NSTextAlignmentLeft;
    NameLabel.textColor = YY22Color;
    NameLabel.frame = CGRectMake( 90 , 45 , 160 , 28);
    NameLabel.font = [UIFont systemFontOfSize:17 weight:0];
    [self addSubview:NameLabel];
    
    UIImageView * VipBgImage = [[UIImageView alloc] init];
    VipBgImage.image = [UIImage imageNamed:@"VipTypeBg"];
    VipBgImage.frame = CGRectMake(90, 75 , 67, 18);
    [self addSubview:VipBgImage];
  
    UIImageView * VipVipImage = [[UIImageView alloc] init];
    VipVipImage.image = [UIImage imageNamed:@"VipVip"];
    VipVipImage.frame = CGRectMake(97, 80 , 10 , 9);
    [self addSubview:VipVipImage];
    
    UILabel * VipTypeLabel = [[UILabel alloc]init];
    VipTypeLabel.text = self.Model.type_text;
    VipTypeLabel.textAlignment = NSTextAlignmentCenter;
    VipTypeLabel.adjustsFontSizeToFitWidth = YES;
    VipTypeLabel.textColor = YYHexColor(@"#FFE569");
    VipTypeLabel.frame = CGRectMake( 110 , 75 , 50 , 18);
    VipTypeLabel.font = [UIFont systemFontOfSize:11 weight:0];
    [self addSubview:VipTypeLabel];
    
    
    UILabel * RightLabel = [[UILabel alloc]init];
    RightLabel.text = @"会员协议";
    RightLabel.textAlignment = NSTextAlignmentRight;
    RightLabel.textColor = YYHexColor(@"#645723");
    RightLabel.frame = CGRectMake(self.ZLP_width - 100 , 40 , 70 , 20);
    RightLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [RightLabel addLabelTarget:self action:@selector(RightLabelClick)];
    [self addSubview:RightLabel];
    
    
    UILabel * TimeLabel = [[UILabel alloc]init];
    TimeLabel.text = [NSString stringWithFormat:@"有效期： %@",self.Model.plus_expire];
    TimeLabel.textAlignment = NSTextAlignmentLeft;
    TimeLabel.textColor = YY22Color;
    TimeLabel.frame = CGRectMake(30 , 130 , 260 , 28);
    TimeLabel.font = [UIFont systemFontOfSize:13 weight:0];
    [self addSubview:TimeLabel];
    
    
    UIButton * RightBtn = [[UIButton alloc]init];
    [RightBtn setTitle:@"立即续费" forState:UIControlStateNormal];
    RightBtn.frame = CGRectMake(self.ZLP_width - 100, 130 , 70 , 28);
    [RightBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    RightBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [RightBtn addTarget:self action:@selector(XufeiButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:RightBtn];
    [YYTools ChangeView:RightBtn RadiusSize:10 BorderColor:YY22Color];
    
    
    UIImageView * Mainimage = [[UIImageView alloc] init];
    Mainimage.backgroundColor = [UIColor clearColor];
    Mainimage.image = [UIImage imageNamed:@"vipbg"];
    [self addSubview:Mainimage];
    [Mainimage mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.mas_top).with.offset(190);
       make.left.equalTo(self.mas_left).with.offset(12);
       make.bottom.equalTo(self.mas_bottom).with.offset(0);
       make.right.equalTo(self.mas_right).with.offset(-12);
       
    }];
    
   
    
    
}



-(void)RightLabelClick{
    
    
    
    
    
}


-(void)XufeiButtonClick{
    
    
    
    
    
}


@end

//
//  YYBuyVipHeadView.m
//  BYNAPP
//
//  Created by apple on 2020/4/20.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYBuyVipHeadView.h"

@implementation YYBuyVipHeadView

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {

         [self CreateBuyVipHeadView];
        
    }
    
    return self;
}



-(void)CreateBuyVipHeadView{
    
     UIView * CenterView = [[UIView alloc]init];
     CenterView.frame = CGRectMake(YYScreenWidth * 0.1, YYScreenHeight * 0.2, YYScreenWidth * 0.8, YYScreenHeight * 0.6);
     CenterView.backgroundColor = UIColor.whiteColor;
     [self addSubview:CenterView];
     [YYTools ChangeView:CenterView RadiusSize:8 BorderColor:[UIColor clearColor]];
    
     UIImageView * Mainimage = [[UIImageView alloc] init];
     Mainimage.backgroundColor = [UIColor clearColor];
     Mainimage.frame = CGRectMake(0, 0, CenterView.ZLP_width, 83);
     Mainimage.image = [UIImage imageNamed:@"BrandHead"];
     [CenterView addSubview:Mainimage];
    
     UILabel * TitleLabel = [[UILabel alloc]init];
     TitleLabel.text = @"该权益仅限神犬集市享用，开通会员可享受超200项特权";
     TitleLabel.YYLineSpace = 5;
     [TitleLabel YYUpdateConstraints];
     TitleLabel.numberOfLines = 0 ;
     TitleLabel.frame = CGRectMake(20, 100, CenterView.ZLP_width - 40, 50);
     TitleLabel.textColor = YY33Color;
     TitleLabel.textAlignment = NSTextAlignmentLeft;
     TitleLabel.font = [UIFont systemFontOfSize:16 weight:0];
     [CenterView addSubview:TitleLabel];
     
     UILabel * LeftContent1 = [[UILabel alloc]init];
     LeftContent1.text = @"会员专属0元购";
     LeftContent1.frame = CGRectMake(20, 170, CenterView.ZLP_width - 40, 23);
     LeftContent1.textColor = YY22Color;
     LeftContent1.textAlignment = NSTextAlignmentLeft;
     LeftContent1.font = [UIFont systemFontOfSize:16 weight:1];
     [CenterView addSubview:LeftContent1];
    
     UILabel * LeftContent2 = [[UILabel alloc]init];
     LeftContent2.text = @"视频影音会员充值5折起";
     LeftContent2.frame = CGRectMake(20, 210, CenterView.ZLP_width - 40, 23);
     LeftContent2.textColor = YY22Color;
     LeftContent2.textAlignment = NSTextAlignmentLeft;
     LeftContent2.font = [UIFont systemFontOfSize:16 weight:1];
     [CenterView addSubview:LeftContent2];
    
     UILabel * LeftContent3 = [[UILabel alloc]init];
     LeftContent3.text = @"星巴克、肯德基美食饮品6折起";
     LeftContent3.frame = CGRectMake(20, 250, CenterView.ZLP_width - 40, 23);
     LeftContent3.textColor = YY22Color;
     LeftContent3.textAlignment = NSTextAlignmentLeft;
     LeftContent3.font = [UIFont systemFontOfSize:16 weight:1];
     [CenterView addSubview:LeftContent3];
    
    
     UILabel * LeftContent4 = [[UILabel alloc]init];
     LeftContent4.text = @"商超、生活服务1折起";
     LeftContent4.frame = CGRectMake(20, 290, CenterView.ZLP_width - 40, 23);
     LeftContent4.textColor = YY22Color;
     LeftContent4.textAlignment = NSTextAlignmentLeft;
     LeftContent4.font = [UIFont systemFontOfSize:16 weight:1];
     [CenterView addSubview:LeftContent4];
    
     UILabel * LeftContent5 = [[UILabel alloc]init];
     LeftContent5.text = @"淘宝、京东、拼多多主流电商购物1折起";
     LeftContent5.frame = CGRectMake(20, 330, CenterView.ZLP_width - 40, 23);
     LeftContent5.textColor = YY22Color;
     LeftContent5.textAlignment = NSTextAlignmentLeft;
     LeftContent5.font = [UIFont systemFontOfSize:16 weight:1];
     [CenterView addSubview:LeftContent5];
    
     UIButton * CancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, CenterView.ZLP_height - 80 , 120, 45)];
     [CancelBtn addTarget:self action:@selector(LeftButtonClick) forControlEvents:UIControlEventTouchUpInside];
     CancelBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
     CancelBtn.backgroundColor = UIColor.whiteColor;
     [CancelBtn setTitleColor:YY99Color forState:UIControlStateNormal];
     [YYTools ChangeView:CancelBtn RadiusSize:15 BorderColor:YY99Color];
     [CancelBtn setTitle:@"取消" forState:UIControlStateNormal];
     CancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
     [CenterView addSubview:CancelBtn];
    
    
    
    UIButton * OPenBtn = [[UIButton alloc] initWithFrame:CGRectMake(CenterView.ZLP_width - 140, CenterView.ZLP_height - 80 , 120 , 45)];
    [OPenBtn addTarget:self action:@selector(RightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    OPenBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    OPenBtn.backgroundColor = YYHexColor(@"#FFD409");
    [OPenBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    [OPenBtn setTitle:@"立即开通" forState:UIControlStateNormal];
    OPenBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [YYTools ChangeView:OPenBtn RadiusSize:15 BorderColor:UIColor.clearColor];
    [CenterView addSubview:OPenBtn];
    
    
}



-(void)LeftButtonClick{
        
    self.LeftBtnBlockClick();
    
}


-(void)RightButtonClick{
    
    self.RightBtnBlockClick();
    
}



@end

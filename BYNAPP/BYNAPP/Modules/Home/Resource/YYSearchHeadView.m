//
//  YYSearchHeadView.m
//  BYNAPP
//
//  Created by apple on 2020/4/20.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYSearchHeadView.h"

@interface YYSearchHeadView ()

@property(nonatomic,strong)UIButton * VHDLBtn;

@property(nonatomic,strong)UIButton * SaleLeftBtn;

@property(nonatomic,strong)UIButton * SaleTopBtn;

@property(nonatomic,strong)UIButton * SaleBotBtn;

@property(nonatomic,strong)UIButton * PriceLeftBtn;

@property(nonatomic,strong)UIButton * PriceTopBtn;

@property(nonatomic,strong)UIButton * PriceBotBtn;

@end


@implementation YYSearchHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
   
        [self CreateHeader];
      
    }
    return self;
}



-(void)CreateHeader{
    
    
    UIView * VHDLView = [[UIView alloc]init];
    VHDLView.backgroundColor = [UIColor whiteColor];
    VHDLView.frame = CGRectMake(0, 0, YYScreenWidth / 4  ,40);
    [self addSubview:VHDLView];
    
    UIButton * VHDLBtn = [[UIButton alloc]init];
    [VHDLBtn setTitle:@"综合" forState:UIControlStateNormal];
    VHDLBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    VHDLBtn.frame = CGRectMake((YYScreenWidth / 4 - 30)/2 , 10, 30, 20);
    VHDLBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [VHDLBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [VHDLBtn setTitleColor:YY66Color forState:UIControlStateSelected];
    [VHDLView addSubview:VHDLBtn];
    self.VHDLBtn = VHDLBtn;
    
    
    UIButton * NavLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NavLeftBtn.frame = CGRectMake(0, 0 , YYScreenWidth / 4 , 40);
    [NavLeftBtn addTarget:self action:@selector(VHDLButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    NavLeftBtn.backgroundColor = [UIColor clearColor];
    [VHDLView addSubview:NavLeftBtn];
    
   #pragma mark ===============11111111=============
    
    
    UIView * SaleView = [[UIView alloc]init];
    SaleView.backgroundColor = [UIColor whiteColor];
    SaleView.frame = CGRectMake(YYScreenWidth / 4 , 0, YYScreenWidth / 4, 40);
    [self addSubview:SaleView];
    
    
    UIButton * SaleLeftBtn = [[UIButton alloc]init];
    [SaleLeftBtn setTitle:@"销量" forState:UIControlStateNormal];
    SaleLeftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    SaleLeftBtn.frame =  CGRectMake((YYScreenWidth / 4 - 45)/2, 10, 30 , 20);
    SaleLeftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [SaleLeftBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [SaleLeftBtn setTitleColor:YY66Color forState:UIControlStateSelected];
    [SaleView addSubview:SaleLeftBtn];
    self.SaleLeftBtn = SaleLeftBtn;
    
    
    UIButton * SaleTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SaleTopBtn.frame = CGRectMake((YYScreenWidth / 4 - 45)/2 + 37.8, 13 , 9 , 5);
    [SaleTopBtn setBackgroundImage:[UIImage imageNamed:@"blacksha"] forState:UIControlStateNormal];
    [SaleTopBtn setBackgroundImage:[UIImage imageNamed:@"YellowSha"] forState:UIControlStateSelected];
    SaleTopBtn.backgroundColor = [UIColor clearColor];
    SaleTopBtn.selected = NO;
    [SaleView addSubview:SaleTopBtn];
    self.SaleTopBtn = SaleTopBtn;
    
    
    UIButton * SaleBotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SaleBotBtn.frame = CGRectMake((YYScreenWidth / 4 - 45)/2 + 38, 21 , 9 , 5);
    [SaleBotBtn setBackgroundImage:[UIImage imageNamed:@"blackxia"] forState:UIControlStateNormal];
    [SaleBotBtn setBackgroundImage:[UIImage imageNamed:@"YellowXia"] forState:UIControlStateSelected];
    SaleBotBtn.backgroundColor = [UIColor clearColor];
    SaleBotBtn.selected = NO;
    [SaleView addSubview:SaleBotBtn];
    self.SaleBotBtn = SaleBotBtn;
  
    
    UIButton * SaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SaleBtn.frame = CGRectMake(0, 0 , YYScreenWidth / 4 , 40);
    [SaleBtn addTarget:self action:@selector(SaleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    SaleBtn.backgroundColor = [UIColor clearColor];
    [SaleView addSubview:SaleBtn];
    
    
    
    
#pragma mark ===============2222222=============
    

    UIView * PriceView = [[UIView alloc]init];
    PriceView.backgroundColor = [UIColor whiteColor];
    PriceView.frame = CGRectMake(YYScreenWidth / 4 * 2, 0, YYScreenWidth / 4, 40);
    [self addSubview:PriceView];
    
    
    UIButton * PriceLeftBtn = [[UIButton alloc]init];
    [PriceLeftBtn setTitle:@"价格" forState:UIControlStateNormal];
    PriceLeftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    PriceLeftBtn.frame =  CGRectMake((YYScreenWidth / 4 - 45)/2, 10, 30 , 20);
    PriceLeftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [PriceLeftBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [PriceLeftBtn setTitleColor:YY66Color forState:UIControlStateSelected];
    [PriceView addSubview:PriceLeftBtn];
    self.PriceLeftBtn = PriceLeftBtn;
    
    UIButton * PriceTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    PriceTopBtn.frame = CGRectMake((YYScreenWidth / 4 - 45)/2 + 37.8, 13, 9 , 5);
    [PriceTopBtn setBackgroundImage:[UIImage imageNamed:@"blacksha"] forState:UIControlStateNormal];
    [PriceTopBtn setBackgroundImage:[UIImage imageNamed:@"YellowSha"] forState:UIControlStateSelected];
    PriceTopBtn.backgroundColor = [UIColor clearColor];
    PriceTopBtn.selected = NO;
    [PriceView addSubview:PriceTopBtn];
    self.PriceTopBtn = PriceTopBtn;
    
    
    UIButton * PriceBotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    PriceBotBtn.frame = CGRectMake((YYScreenWidth /4 - 45)/2 + 38, 21 , 9 , 5);
    [PriceBotBtn setBackgroundImage:[UIImage imageNamed:@"blackxia"] forState:UIControlStateNormal];
    [PriceBotBtn setBackgroundImage:[UIImage imageNamed:@"YellowXia"] forState:UIControlStateSelected];
    PriceBotBtn.backgroundColor = [UIColor clearColor];
    PriceBotBtn.selected = NO;
    [PriceView addSubview:PriceBotBtn];
    self.PriceBotBtn = SaleBotBtn;
    
    
    UIButton * PriceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    PriceBtn.frame = CGRectMake(0, 0 , YYScreenWidth / 4 , 40);
    [PriceBtn addTarget:self action:@selector(PriceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    PriceBtn.backgroundColor = [UIColor clearColor];
    [PriceView addSubview:PriceBtn];
 
    
    #pragma mark ===============3333333=============
    
    UIView * CouponView = [[UIView alloc]init];
    CouponView.backgroundColor = [UIColor whiteColor];
    CouponView.frame = CGRectMake(YYScreenWidth * 0.75, 0, YYScreenWidth / 4, 40);
    [self addSubview:CouponView];
    
    UIButton * CouponBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CouponBtn.frame = CGRectMake(CouponView.ZLP_width - 73, 14 , 13 , 13);
    [CouponBtn setBackgroundImage:[UIImage imageNamed:@"Juxing"] forState:UIControlStateNormal];
    [CouponBtn setBackgroundImage:[UIImage imageNamed:@"Juxing"] forState:UIControlStateSelected];
    CouponBtn.backgroundColor = [UIColor clearColor];
    CouponBtn.selected = NO;
    [CouponView addSubview:CouponBtn];
    
    UILabel * CouponLabel = [[UILabel alloc]init];
    CouponLabel.textColor = YY66Color;
    CouponLabel.text = @"优惠券";
    CouponLabel.frame = CGRectMake(CouponView.ZLP_width - 56, 13, 42 , 14);
    CouponLabel.textAlignment = NSTextAlignmentLeft;
    CouponLabel.font = [UIFont systemFontOfSize:12 weight:0];
    [CouponView addSubview:CouponLabel];
  
    
}


-(void)VHDLButtonClick:(UIButton*)sender{
    
   
    
}


-(void)SaleButtonClick:(UIButton*)sender{
    
    sender.selected = ! sender.selected;
    
   
    
    
}


-(void)PriceButtonClick:(UIButton*)sender{
    
    sender.selected = ! sender.selected;
    
   
}



-(void)setHeaderType:(NSString *)HeaderType{
    

    if ([HeaderType isEqualToString:@"default"]){
        
    
       
    }else if ([HeaderType isEqualToString:@"price_des"]){
        
       
       
        
    }else if ([HeaderType isEqualToString:@"price_asc"]){
        
       
        
    }else if ([HeaderType isEqualToString:@"total_sales_des"]){
        
      
        
    }else if ([HeaderType isEqualToString:@"total_sales_asc"]){
        
       
    }
    
    
}



-(void)ShaixuanButtonClick{
    
    
    
}




@end

//
//  YYPDDHeadView.m
//  BYNAPP
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYPDDHeadView.h"

@interface YYPDDHeadView ()

@property(nonatomic,strong)UIButton * VHDLBtn;

@property(nonatomic,strong)UIButton * SaleLeftBtn;

@property(nonatomic,strong)UIButton * SaleRightBtn;

@property(nonatomic,strong)UIButton * PriceLeftBtn;

@property(nonatomic,strong)UIButton * PriceRightBtn;

@property(nonatomic,strong)UIButton * TOPYHBtn;


@end


@implementation YYPDDHeadView

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
    VHDLView.frame = CGRectMake(0, 0, YYScreenWidth / 3 ,40);
    [self addSubview:VHDLView];
    
    UIButton * VHDLBtn = [[UIButton alloc]init];
    [VHDLBtn setTitle:@"综合" forState:UIControlStateNormal];
    VHDLBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    VHDLBtn.frame = CGRectMake((YYScreenWidth / 3 - 30)/2, 10, 30, 20);
    VHDLBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [VHDLBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [VHDLBtn setTitleColor:YY66Color forState:UIControlStateSelected];
    [VHDLView addSubview:VHDLBtn];
    self.VHDLBtn = VHDLBtn;
    
    
    UIButton * NavLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NavLeftBtn.frame = CGRectMake(0, 0 , YYScreenWidth / 3 , 40);
    [NavLeftBtn addTarget:self action:@selector(VHDLButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    NavLeftBtn.backgroundColor = [UIColor clearColor];
    [VHDLView addSubview:NavLeftBtn];
    
   #pragma mark ===============11111111=============
    
    
    UIView * SaleView = [[UIView alloc]init];
    SaleView.backgroundColor = [UIColor whiteColor];
    SaleView.frame = CGRectMake(YYScreenWidth / 3, 0, YYScreenWidth / 3, 40);
    [self addSubview:SaleView];
    
    
    UIButton * SaleLeftBtn = [[UIButton alloc]init];
    [SaleLeftBtn setTitle:@"销量" forState:UIControlStateNormal];
    SaleLeftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    SaleLeftBtn.frame =  CGRectMake((YYScreenWidth / 3 - 45)/2, 10, 30 , 20);
    SaleLeftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [SaleLeftBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [SaleLeftBtn setTitleColor:YY66Color forState:UIControlStateSelected];
    [SaleView addSubview:SaleLeftBtn];
    self.SaleLeftBtn = SaleLeftBtn;
    
    
    UIButton * SaleRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SaleRightBtn.frame = CGRectMake((YYScreenWidth / 3 - 45)/2 + 35, 18, 10, 6);
    [SaleRightBtn setBackgroundImage:[UIImage imageNamed:@"blacksha"] forState:UIControlStateNormal];
    [SaleRightBtn setBackgroundImage:[UIImage imageNamed:@"blackxia"] forState:UIControlStateSelected];
    SaleRightBtn.backgroundColor = [UIColor clearColor];
    SaleRightBtn.selected = NO;
    [SaleView addSubview:SaleRightBtn];
    self.SaleRightBtn = SaleRightBtn;
  
    
    UIButton * SaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SaleBtn.frame = CGRectMake(0, 0 , YYScreenWidth / 3 , 40);
    [SaleBtn addTarget:self action:@selector(SaleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    SaleBtn.backgroundColor = [UIColor clearColor];
    [SaleView addSubview:SaleBtn];
    
    
    
    
#pragma mark ===============2222222=============
    

    UIView * PriceView = [[UIView alloc]init];
    PriceView.backgroundColor = [UIColor whiteColor];
    PriceView.frame = CGRectMake(YYScreenWidth / 3 * 2, 0, YYScreenWidth / 3, 40);
    [self addSubview:PriceView];
    
    
    UIButton * PriceLeftBtn = [[UIButton alloc]init];
    [PriceLeftBtn setTitle:@"价格" forState:UIControlStateNormal];
    PriceLeftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    PriceLeftBtn.frame =  CGRectMake((YYScreenWidth / 3 - 45)/2, 10, 30 , 20);
    PriceLeftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [PriceLeftBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [PriceLeftBtn setTitleColor:YY66Color forState:UIControlStateSelected];
    [PriceView addSubview:PriceLeftBtn];
    self.PriceLeftBtn = PriceLeftBtn;
    
    
    UIButton * PriceRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    PriceRightBtn.frame = CGRectMake((YYScreenWidth / 3 - 45)/2 + 35,18,10, 6);
    [PriceRightBtn setBackgroundImage:[UIImage imageNamed:@"BlackBottom"] forState:UIControlStateNormal];
    [PriceRightBtn setBackgroundImage:[UIImage imageNamed:@"RedTop"] forState:UIControlStateSelected];
    PriceRightBtn.backgroundColor = [UIColor clearColor];
    PriceRightBtn.selected = NO;
    [PriceView addSubview:PriceRightBtn];
    self.PriceRightBtn = PriceRightBtn;
    
    
    UIButton * PriceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    PriceBtn.frame = CGRectMake(0, 0 , YYScreenWidth / 3 , 40);
    [PriceBtn addTarget:self action:@selector(PriceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    PriceBtn.backgroundColor = [UIColor clearColor];
    [PriceView addSubview:PriceBtn];
 
    
   #pragma mark ===============3333333=============
    
    
    
  
    
}


-(void)VHDLButtonClick:(UIButton*)sender{
    
    self.HeaderBtnBlockClick(@"default");
    
}


-(void)SaleButtonClick:(UIButton*)sender{
    
    sender.selected = ! sender.selected;
    
    if (sender.selected ) {
        
        self.HeaderBtnBlockClick(@"total_sales_des");
        
    }else{
        
        self.HeaderBtnBlockClick(@"total_sales_asc");
        
    }
    
    
}


-(void)PriceButtonClick:(UIButton*)sender{
    
    sender.selected = ! sender.selected;
    
    if (sender.selected) {
        
        self.HeaderBtnBlockClick(@"price_des");
        
    }else{
        
        self.HeaderBtnBlockClick(@"price_asc");
        
    }
    
}



-(void)setHeaderType:(NSString *)HeaderType{
    

    if ([HeaderType isEqualToString:@"default"]){
        
        self.VHDLBtn.selected = YES;
        self.SaleLeftBtn.selected = NO;
        self.SaleRightBtn.selected = NO;
        self.PriceLeftBtn.selected = NO;
        self.PriceRightBtn.selected = NO;
       
    }else if ([HeaderType isEqualToString:@"price_des"]){
        
        self.VHDLBtn.selected = NO;
        
        self.SaleLeftBtn.selected = NO;
        self.SaleRightBtn.selected = NO;
        
        self.PriceLeftBtn.selected = YES;
        self.PriceRightBtn.selected = YES;
       
        
    }else if ([HeaderType isEqualToString:@"price_asc"]){
        
        self.VHDLBtn.selected = NO;
        
        self.SaleLeftBtn.selected = NO;
        self.SaleRightBtn.selected = NO;
        
        self.PriceLeftBtn.selected = YES;
        self.PriceRightBtn.selected = NO;
      
        
    }else if ([HeaderType isEqualToString:@"total_sales_des"]){
        
        self.VHDLBtn.selected = NO;
        
        self.SaleLeftBtn.selected = YES;
        self.SaleRightBtn.selected = YES;
        
        self.PriceLeftBtn.selected = NO;
        self.PriceRightBtn.selected = NO;
        
    }else if ([HeaderType isEqualToString:@"total_sales_asc"]){
        
        self.VHDLBtn.selected = NO;
        
        self.SaleLeftBtn.selected = YES;
        self.SaleRightBtn.selected = NO;
        
        self.PriceLeftBtn.selected = NO;
        self.PriceRightBtn.selected = NO;
        
    }
    
    
}




-(void)ShaixuanButtonClick{
    
    self.ShaiXuanButtonBlockClick();
    
}






-(void)setHeaderCoupon:(NSString *)HeaderCoupon{
    
    if ([HeaderCoupon isEqualToString:@"White_Coupon"]){
        
        self.TOPYHBtn.selected = NO;
        
    }else{
        
        self.TOPYHBtn.selected = YES;
        
    }
    
    
}

-(void)CouponButtonClick:(UIButton*)Sender{
    
    if (Sender.selected == YES) {
        
        self.YouHuiButtonBlockClick(@"White_Coupon");
        
    }else{
        
        self.YouHuiButtonBlockClick(@"Red_Coupon");
    }
    
}

@end

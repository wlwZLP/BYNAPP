//
//  BDetailsCenCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/17.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BDetailsCenCollectionViewCell.h"

@interface BDetailsCenCollectionViewCell ()

@property(nonatomic,strong)UIView * TopView;

@property(nonatomic,strong)UIView * BottomView;

@property(nonatomic,strong)UIButton * TopOldBtn;

@property(nonatomic,strong)UIImageView * BottomOldimg;

@end

@implementation BDetailsCenCollectionViewCell

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
    MainView.frame = CGRectMake(12, 0 , YYScreenWidth -24 , self.ZLP_height);
    [self addSubview:MainView];
   
    UIBezierPath * RightPath = [UIBezierPath bezierPathWithRoundedRect:MainView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5,5)];
    CAShapeLayer * RightLayer = [[CAShapeLayer alloc] init];
    RightLayer.frame = MainView.bounds;
    RightLayer.path = RightPath.CGPath;
    MainView.layer.mask = RightLayer;

    UIView * TopView = [[UIView alloc] init];
    TopView.backgroundColor = UIColor.whiteColor;
    TopView.frame = CGRectMake(0, 0 , MainView.ZLP_width ,70);
    [MainView addSubview:TopView];
    self.TopView = TopView;
    
    UILabel * TypeLabel = [[UILabel alloc]init];
    TypeLabel.text = @"充值面额";
    TypeLabel.textColor = YY22Color;
    TypeLabel.frame = CGRectMake(14, 75 , 160 , 20);
    TypeLabel.textAlignment = NSTextAlignmentLeft;
    TypeLabel.font = [UIFont systemFontOfSize:15 weight:1];
    [MainView addSubview:TypeLabel];
    
    UIView * BottomView = [[UIView alloc] init];
    BottomView.backgroundColor = UIColor.whiteColor;
    BottomView.frame = CGRectMake(0 , 105 , MainView.ZLP_width ,MainView.ZLP_height - 105 );
    [MainView addSubview:BottomView];
    self.BottomView = BottomView;

}


-(void)setTitleArray:(NSArray *)TitleArray{
    
      _TitleArray = TitleArray;
    
      for (NSInteger index = 0; index < self.TitleArray.count; index++) {
          
         //一行的列数
          NSInteger cols = 3;
          //图片大小
          NSInteger imageW = 120;
          
          NSInteger imageH = 60;
          
          //每一列的间距
          CGFloat colMargin = (self.TopView.ZLP_width - cols *imageW - 24) / (cols - 1);
          
          //图片所在列
          NSInteger col = index % cols;
          //图片所在行
          NSInteger row = index / cols;
          
          CGFloat shopX = col * (imageW +colMargin)+ 12;
          
          CGFloat shopY = row * (imageH + colMargin) + 5;
          
         UIButton * TitleBtn =[[UIButton alloc]init];
         TitleBtn.frame = CGRectMake(shopX, shopY, imageW, imageH);
         [TitleBtn setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forState:UIControlStateNormal];
         [TitleBtn setBackgroundImage:[UIImage imageNamed:@"BrandVipType"] forState:UIControlStateSelected];
         [TitleBtn setTitleColor:YY11Color forState:UIControlStateNormal];
         [TitleBtn setTitleColor:YY11Color forState:UIControlStateSelected];
         [TitleBtn setTitle:[NSString stringWithFormat:@"%@会员",self.TitleArray[index]] forState:UIControlStateNormal];
         TitleBtn.tag = index;
         [TitleBtn addTarget:self action:@selector(TopBtnClick:) forControlEvents:UIControlEventTouchUpInside];
         TitleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
         [YYTools ChangeView:TitleBtn RadiusSize:10 BorderColor:YY66Color];
         [self.TopView addSubview:TitleBtn];
       
      }

       UIButton * oldButton = self.TopView.subviews.firstObject;
       [YYTools ChangeView:oldButton RadiusSize:0 BorderColor:[UIColor clearColor]];
       oldButton.selected = YES;
       self.TopOldBtn = oldButton;
    
    
}



-(void)setTitleListArray:(NSArray<BrandDetailsModel *> *)TitleListArray{
    
     _TitleListArray = TitleListArray;
    
     for (NSInteger index = 0; index < self.TitleListArray.count; index++) {
              
          //一行的列数
          NSInteger cols = 3;
          //图片大小
          NSInteger imageW = 104;
          
          NSInteger imageH = 78;
         
          //每一列的间距
          CGFloat RowMargin = (self.BottomView.ZLP_width - cols *imageW - 24) / (cols - 1);
         
          //每一行的间距
          CGFloat colMargin = 20;
          
          //图片所在列
          NSInteger col = index % cols;
          //图片所在行
          NSInteger row = index / cols;
          
          CGFloat shopX = col * (imageW + RowMargin) + 12;
          
          CGFloat shopY = row * (imageH + colMargin) + 5;
        
         
          UIImageView * BgImgView = [[UIImageView alloc]init];
          BgImgView.frame = CGRectMake(shopX, shopY, imageW, imageH);
          BgImgView.tag = index;
          [BgImgView addTarget:self action:@selector(BottomBtnClick:)];
          [self.BottomView addSubview:BgImgView];
          if (index == 0) {
              BgImgView.image = [UIImage imageWithColor:YYHexColor(@"#FFD409")];
              [YYTools ChangeView:BgImgView RadiusSize:10 BorderColor:UIColor.whiteColor];
              self.BottomOldimg = BgImgView;
          }else{
              BgImgView.image = [UIImage imageWithColor:UIColor.whiteColor];
              [YYTools ChangeView:BgImgView RadiusSize:10 BorderColor:YY66Color];
          }
          [self.BottomView sendSubviewToBack:BgImgView];
         
          UILabel * MonthLabel = [[UILabel alloc]init];
          MonthLabel.text = self.TitleListArray[index].validity;
          MonthLabel.frame = CGRectMake(shopX, shopY + 8, imageW, 16);
          MonthLabel.textColor = YY66Color;
          MonthLabel.textAlignment = NSTextAlignmentCenter;
          MonthLabel.font = [UIFont systemFontOfSize:12 weight:0];
          [self.BottomView addSubview:MonthLabel];
          
          UILabel * PriceLabel = [[UILabel alloc]init];
          PriceLabel.text = [NSString stringWithFormat:@"￥%@",self.TitleListArray[index].member_price];
          PriceLabel.frame = CGRectMake(shopX, shopY + 24 , imageW, 30);
          PriceLabel.textColor = YY22Color;
          PriceLabel.textAlignment = NSTextAlignmentCenter;
          PriceLabel.font = [UIFont systemFontOfSize:21 weight:0];
          [self.BottomView addSubview:PriceLabel];
       
         
          UILabel * OldPriceLabel = [[UILabel alloc]init];
          OldPriceLabel.text = [NSString stringWithFormat:@"官方价%@",self.TitleListArray[index].face_price];
          OldPriceLabel.frame = CGRectMake(shopX, shopY + 54 , imageW, 16);
          OldPriceLabel.textColor = YY22Color;
          OldPriceLabel.textAlignment = NSTextAlignmentCenter;
          OldPriceLabel.font = [UIFont systemFontOfSize:12 weight:0];
          [self.BottomView addSubview:OldPriceLabel];
          NSMutableAttributedString *  abs = [[NSMutableAttributedString alloc]initWithString:OldPriceLabel.text];
          [abs addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:NSMakeRange(0, OldPriceLabel.text.length)];
          OldPriceLabel.attributedText = abs;

    
     }
    

    
}


-(void)TopBtnClick:(UIButton*)Sender{
    
    self.TopOldBtn.selected = NO;
    [YYTools ChangeView:self.TopOldBtn RadiusSize:10 BorderColor:YY66Color];
    Sender.selected = YES;
    self.TopOldBtn = Sender;
    [YYTools ChangeView:self.TopOldBtn RadiusSize:0 BorderColor:[UIColor clearColor]];
    self.TopBtnBlockClick(Sender.tag);
    
}
-(void)BottomBtnClick:(UITapGestureRecognizer *)tapGesture{

      self.BottomOldimg.image = [UIImage imageWithColor:UIColor.whiteColor];
    
      [YYTools ChangeView:self.BottomOldimg RadiusSize:10 BorderColor:YY66Color];
     
      UITapGestureRecognizer * singleTap = (UITapGestureRecognizer *)tapGesture;
    
      UIImageView * Newimgview = (UIImageView*)singleTap.view;
    
      [YYTools ChangeView:Newimgview RadiusSize:10 BorderColor:UIColor.whiteColor];
    
      Newimgview.image = [UIImage imageWithColor:YYHexColor(@"#FFD409")];
    
      self.BottomOldimg = Newimgview;
     
    
    
    
}




//-(void)BottomBtnClick:(UIButton*)Sender{
//
//    self.BottomOldBtn.selected = NO;
//    [YYTools ChangeView:self.BottomOldBtn RadiusSize:10 BorderColor:YY66Color];
//    Sender.selected = YES;
//    self.BottomOldBtn = Sender;
//    [YYTools ChangeView:self.BottomOldBtn RadiusSize:0 BorderColor:[UIColor clearColor]];
//     self.BottomBtnBlockClick(Sender.tag);
//}
//          [TitleBtn setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forState:UIControlStateNormal];
//          TitleBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
//          [TitleBtn setBackgroundImage:[UIImage imageNamed:@"brandMBg"] forState:UIControlStateSelected];
//          [TitleBtn setTitleColor:YY33Color forState:UIControlStateNormal];
//          [TitleBtn setTitleColor:YY33Color forState:UIControlStateSelected];
//          TitleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//          TitleBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//          NSString * TitleString = [NSString stringWithFormat:@"     %@\n  ￥%@\n官方价%@",self.TitleListArray[index].validity,self.TitleListArray[index].member_price,self.TitleListArray[index].face_price];
//          [TitleBtn setTitle:TitleString forState:UIControlStateNormal];
//          [TitleBtn addTarget:self action:@selector(BottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//          TitleBtn.tag = index;
//          TitleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//          [YYTools ChangeView:TitleBtn RadiusSize:10 BorderColor:YY66Color];
//          [self.BottomView addSubview:TitleBtn];
//          NSMutableAttributedString * CouponString = [[NSMutableAttributedString alloc] initWithString:TitleBtn.titleLabel.text];
//          NSRange range = [CouponString.string rangeOfString:@"\n"];
         
//          NSRange Range1 = NSMakeRange(0, 1);
//          NSRange Range2 = NSMakeRange(cell.CouponPriceLabel.text.length - 3, 3);
//          [CouponString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:Range1];
//          [CouponString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:Range2];
//          [cell.CouponPriceLabel setAttributedText:CouponString];





@end

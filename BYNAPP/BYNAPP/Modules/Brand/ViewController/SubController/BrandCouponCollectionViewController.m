//
//  BrandCouponCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/17.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandCouponCollectionViewController.h"
#import "DetailsTopCollectionViewCell.h"
#import "DetailsNumCollectionViewCell.h"
#import "DetailsNotesCollectionViewCell.h"
#import "YYBuyVipHeadView.h"
#import "LPAnimationView.h"
#import "MyNoVipCollectionViewController.h"

@interface BrandCouponCollectionViewController ()

@property(nonatomic,strong)NSDictionary * DetaisDic;

@property (nonatomic, assign)CGFloat StrViewHeight;

@property (nonatomic, assign)NSInteger BuyNum;

@property(nonatomic,strong)UserModel * UserModel;

@property(nonatomic,strong)YYBuyVipHeadView * BuyHeadView;

@end

@implementation BrandCouponCollectionViewController

;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.frame = CGRectMake(0, 0, YYScreenWidth, YYScreenHeight - YYTabBarHeight);
    
    self.StrViewHeight = 0;
    
    self.BuyNum = 1;
    
    self.UserModel = [YYSaveTool YY_GetSaveModelWithkey:YYUser modelClass:UserModel.class];
    
    self.collectionView.backgroundColor = YYBGColor;
 
    [self.collectionView registerClass:[DetailsTopCollectionViewCell class] forCellWithReuseIdentifier:@"DetailsTopCollectionViewCell"];
    
    [self.collectionView registerClass:[DetailsNumCollectionViewCell class] forCellWithReuseIdentifier:@"DetailsNumCollectionViewCell"];
    
    [self.collectionView registerClass:[DetailsNotesCollectionViewCell class] forCellWithReuseIdentifier:@"DetailsNotesCollectionViewCell"];
    
    [self CreateBrandDetailsBottomView];
    
    [self GetHomeGoodsDetailsNetData];
   
    
}


#pragma mark ===============网络请求=============

-(void)GetHomeGoodsDetailsNetData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVProductDetail];
                 
    NSDictionary * dict = @{@"id":self.Details_id,@"mall_id":self.mall_id};
   
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
        
        self.DetaisDic = EncodeDicFromDic(responseObject, @"data");
        
        self.StrViewHeight = [self getStringHeightWithText:EncodeStringFromDic(self.DetaisDic, @"help") font:[UIFont systemFontOfSize:14] viewWidth:YYScreenWidth - 48];
        
        [self.collectionView reloadData];
    
    } failure:^(NSError *error, id responseCache) {
        
         self.DetaisDic = EncodeDicFromDic(responseCache, @"data");
       
         [self.collectionView reloadData];
        
    }];
    
    
}




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 3;
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == 0) {
        
        DetailsTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailsTopCollectionViewCell" forIndexPath:indexPath];
        
        [cell.MainBgImgView sd_setImageWithURL:[NSURL URLWithString:EncodeStringFromDic(self.DetaisDic, @"coupon_cover")] placeholderImage:[UIImage imageNamed:@"BrandDbg"]];
        
        [cell.Logoimage sd_setImageWithURL:[NSURL URLWithString:EncodeStringFromDic(self.DetaisDic, @"brand_cover")] placeholderImage:[UIImage imageNamed:@"MainBG"]];
        
        cell.CouponLabel.text = [NSString stringWithFormat:@"省%@元",[YYTools YYSetAllMaxSting:EncodeStringFromDic(self.DetaisDic, @"face_price") MinString:EncodeStringFromDic(self.DetaisDic, @"member_price")]];
        
        cell.TitleLabel.text = EncodeStringFromDic(self.DetaisDic, @"coupon_name");
        
        cell.PriceLabel.text = EncodeStringFromDic(self.DetaisDic, @"member_price");
        
        cell.OldPriceLabel.text = [NSString stringWithFormat:@"官方价%@",EncodeStringFromDic(self.DetaisDic, @"face_price")];
        
        NSMutableAttributedString *  abs = [[NSMutableAttributedString alloc]initWithString:cell.OldPriceLabel.text];
        [abs addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:NSMakeRange(0, cell.OldPriceLabel.text.length)];
        cell.OldPriceLabel.attributedText = abs;
        
        return cell;
        
        
    }else if (indexPath.item == 1){
        
        DetailsNumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailsNumCollectionViewCell" forIndexPath:indexPath];
        
        cell.BuyNumTextField.text = [NSString stringWithFormat:@"%ld",(long)self.BuyNum];
        
        cell.DelButtonBlockClick = ^{
            
            if (self.BuyNum <= 1) {
                return;
            }
            
            self.BuyNum -- ;
            
            [self.collectionView reloadData];
            
        };
        
        cell.ADDButtonBlockClick = ^{
            
            self.BuyNum ++ ;
            
            [self.collectionView reloadData];
        };
        
       return cell;
        
        
    }else{
        
        DetailsNotesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailsNotesCollectionViewCell" forIndexPath:indexPath];
        
        cell.ContentLabelString = EncodeStringFromDic(self.DetaisDic, @"help");
        
        return cell;
        
        
    }
    

    
}


#pragma mark <UICollectionViewDelegate>


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    if (indexPath.item == 0) {
        
        return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.62 +100);
        
    }else if (indexPath.item == 1){
       
        return CGSizeMake(YYScreenWidth , 112);
        
    }else{
       
        return CGSizeMake(YYScreenWidth , 50 + self.StrViewHeight);
        
    }
        
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
        return (CGSize){YYScreenWidth,0};
  
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
       return (CGSize){YYScreenWidth,0};
    
}


// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerId" forIndexPath:indexPath];
        
        if(headerView == nil){
            headerView = [[UICollectionReusableView alloc] init];
        }
        
        headerView.backgroundColor = YYBGColor;
        
     
        return headerView;
    
    }
    
     return nil;
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
      return UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

      return 0;

}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
     return 0;

}


#pragma mark 创建地下立即购买按钮


-(void)CreateBrandDetailsBottomView{
    
    
    UIView * BottomView = [[UIView alloc]initWithFrame:CGRectMake(0, YYScreenHeight - YYTabBarHeight - YYBarHeight, YYScreenWidth, YYTabBarHeight)];
    BottomView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:BottomView];
    
    UIImageView * HomeImage = [[UIImageView alloc] init];
    HomeImage.backgroundColor = [UIColor clearColor];
    if (YYTabBarHeight < 50) {
        HomeImage.frame = CGRectMake(24, 15 , 20, 20);
    } else {
        HomeImage.frame = CGRectMake(24, 15 , 20, 20);
    }
    HomeImage.image = [UIImage imageNamed:@"icon_tabbar_homepage"];
    [HomeImage addTarget:self action:@selector(homeImgBtnClick)];
    [BottomView addSubview:HomeImage];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"首页";
    if (YYTabBarHeight < 50) {
      TitleLabel.frame = CGRectMake(22, 40 , 24, 15);
    } else {
      TitleLabel.frame = CGRectMake(22, 40 , 24, 15);
    }
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.font = [UIFont systemFontOfSize:10 weight:0];
    [BottomView addSubview:TitleLabel];
    
    UIButton * BuyButton = [[UIButton alloc]init];
    BuyButton.backgroundColor = YYHexColor(@"#FFD409");
    if (YYTabBarHeight > 50) {
       BuyButton.frame = CGRectMake(63 , 15 , YYScreenWidth - 75, 40);
    }else{
       BuyButton.frame = CGRectMake(63 , 7 , YYScreenWidth - 75, 40);
    }
    [BuyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [BuyButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [BuyButton addTarget:self action:@selector(BrandDetailBuyButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:BuyButton];
    [YYTools ChangeView:BuyButton RadiusSize:10 BorderColor:[UIColor clearColor]];
    
}

#pragma mark ===============返回到首页============

-(void)homeImgBtnClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


#pragma mark 获取字符串高度

- (CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width {
    // 设置文字属性 要和label的一致
    NSDictionary *attrs = @{NSFontAttributeName :font};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);

    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;

    // 计算文字占据的宽高
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;

   // 当你是把获得的高度来布局控件的View的高度的时候.size转化为ceilf(size.height)。
    return  ceilf(size.height);
    
}

- (CGFloat)getString:(NSString *)string lineSpacing:(CGFloat)lineSpacing font:(UIFont*)font width:(CGFloat)width {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = lineSpacing;
    NSDictionary *dic = @{ NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle };
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return  ceilf(size.height);
}

#pragma mark 立即购买商品

-(void)BrandDetailBuyButtonClick{
    
    BOOL alipay = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"alipay://"]];
    
    NSString * ISLogin = [YYSaveTool GetCacheForKey:YYLogin];
    
    if ([ISLogin isEqualToString:@"0"]) {
        LoginCollectionViewController * LoginVc = [[LoginCollectionViewController alloc]init];
        LoginVc.title = @"";
        [self.navigationController pushViewController:LoginVc animated:YES];
        return;
    }

    if (alipay == NO) {

        [self YYShowMessage:@"请先安装支付宝"];
        return;

    }
    
    if (self.UserModel == nil) {

        [self YYShowMessage:@"登录失效，请重新登录"];
        return;

    }
    
    if ([self.UserModel.plus_level isEqualToString:@"0"]) {
        
         [[LPAnimationView sharedMask] show:self.BuyHeadView withType:QWAlertViewStyleAlert];
        
    }else{
      
       NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVProductOrder];
        
        NSString * BuyNumString = [NSString stringWithFormat:@"%ld",(long)self.BuyNum];
       
       NSDictionary * dict = @{@"id":EncodeStringFromDic(self.DetaisDic, @"id"),@"count":BuyNumString,@"type":@"2"};
                     
       [PPNetworkTools POST:url parameters:dict success:^(id responseObject) {
         
           if ([EncodeStringFromDic(responseObject, @"code") isEqualToString:@"0"]) {
               
               NSDictionary * data = EncodeDicFromDic(responseObject, @"data");
               
                NSString * order_no = EncodeStringFromDic(data, @"order_no");
               
                [self GetBarndPaySignNetWork:order_no];
               
           }else{
               
               [self YYShowMessage:EncodeStringFromDic(responseObject, @"msg")];
               
           }
           
       } failure:^(NSError *error, id responseCache) {
        
            [self YYShowMessage:@"网络请求失败"];
          
       }];
        
    }
    
}


#pragma mark ===============得到支付订单参数=============

-(void)GetBarndPaySignNetWork:(NSString*)order_no{
    
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVProductOrder];
    
    NSDictionary * dict = @{@"order_no":order_no};
                  
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
      
        if ([EncodeStringFromDic(responseObject, @"code") isEqualToString:@"0"]) {
            
            NSDictionary * data = EncodeDicFromDic(responseObject, @"data");
            
              if (EncodeStringFromDic(data, @"pay_params") != nil) {
                  
                 //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
                 NSString *appScheme = @"BYNAPP";
                 // NOTE: 调用支付结果开始支付
                 [[AlipaySDK defaultService] payOrder:EncodeStringFromDic(data, @"pay_params")  fromScheme:appScheme callback:^(NSDictionary *resultDic) {

                      NSLog(@"reslut = %@",resultDic);

                }];

            }
            
        }else{
            
           [self YYShowMessage:EncodeStringFromDic(responseObject, @"msg")];
            
        }
        

    } failure:^(NSError *error, id responseCache) {
     
         [self YYShowMessage:@"网络请求失败"];
        
       
    }];
    
    
}




-(NSString *)GetTracFaceMoney:(NSString *)facemongey NumMoney:(NSString*)NumMoney{

    NSDecimalNumber * number1 = [NSDecimalNumber decimalNumberWithString:facemongey];
    
    NSDecimalNumber * number2 = [NSDecimalNumber decimalNumberWithString:NumMoney];

    NSDecimalNumber * subTracFeeNum = [number1 decimalNumberBySubtracting:number2];

    return [subTracFeeNum stringValue];

}


#pragma mark ===============自定义View=============
-(YYBuyVipHeadView*)BuyHeadView{
    
    if (!_BuyHeadView) {
        _BuyHeadView = [[YYBuyVipHeadView alloc]init];
        _BuyHeadView.frame = CGRectMake(0, 0, YYScreenWidth, YYScreenHeight);
        _BuyHeadView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        _BuyHeadView.LeftBtnBlockClick = ^{
            [[LPAnimationView sharedMask] dismiss];
        };
        YYWeakSelf(self);
        _BuyHeadView.RightBtnBlockClick = ^{
            [[LPAnimationView sharedMask] dismiss];
            MyNoVipCollectionViewController * VipVc = [[MyNoVipCollectionViewController alloc]init];
            VipVc.title = @"会员中心";
            [weakself.navigationController pushViewController:VipVc animated:YES];
        };
    }
    return _BuyHeadView;
}



@end

//
//  BrandDetailsCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandRechargeCollectionViewController.h"
#import "BDetailsTopCollectionViewCell.h"
#import "BDetailsCenCollectionViewCell.h"
#import "BDetailsShuoCollectionViewCell.h"
#import "DetailsNotesCollectionViewCell.h"
#import "BrandDetailsModel.h"
#import "YYBuyVipHeadView.h"
#import "MyNoVipCollectionViewController.h"

@interface BrandRechargeCollectionViewController ()

@property(nonatomic,strong)NSDictionary * DetaisDic;

@property(nonatomic,strong)NSArray * TitleArray;

@property(nonatomic,strong)NSArray<BrandDetailsModel*> * TitleListArray;

@property (nonatomic, assign)NSInteger ContengHeight;

@property (nonatomic, assign)NSInteger TopIndex;

@property (nonatomic, assign)NSInteger bottomIndex;

@property(nonatomic,strong)UserModel * UserModel;

@property(nonatomic,strong)YYBuyVipHeadView * BuyHeadView;

@property(nonatomic,strong)NSString * ChargePhone;

@end

@implementation BrandRechargeCollectionViewController

;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.frame = CGRectMake(0, 0, YYScreenWidth, YYScreenHeight - YYTabBarHeight);
    
    self.collectionView.backgroundColor = YYBGColor;
 
    [self.collectionView registerClass:[BDetailsTopCollectionViewCell class] forCellWithReuseIdentifier:@"BDetailsTopCollectionViewCell"];
    
    [self.collectionView registerClass:[BDetailsCenCollectionViewCell class] forCellWithReuseIdentifier:@"BDetailsCenCollectionViewCell"];
    
    [self.collectionView registerClass:[BDetailsShuoCollectionViewCell class] forCellWithReuseIdentifier:@"BDetailsShuoCollectionViewCell"];
    
    [self.collectionView registerClass:[DetailsNotesCollectionViewCell class] forCellWithReuseIdentifier:@"DetailsNotesCollectionViewCell"];
    
    self.TopIndex = 0;
    
    self.bottomIndex = 0;
    
    self.ContengHeight = 0;
    
    self.UserModel = [YYSaveTool YY_GetSaveModelWithkey:YYUser modelClass:UserModel.class];
    
    [self GetHomeGoodsDetailsNetData];
    
    [self CreateBrandDetailsBottomView];
    
    
}



-(void)GetHomeGoodsDetailsNetData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVProductDetail];
                 
    NSDictionary * dict = @{@"id":@"1269xxx",@"mall_id":@"6"};
   
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
        
        YYNSLog(@"直冲数据--------%@",responseObject);
        
        self.DetaisDic = EncodeDicFromDic(responseObject, @"data");
        
        self.TitleArray = self.DetaisDic.allKeys;
        
        self.TitleListArray = [NSArray modelArrayWithClass:[BrandDetailsModel class] json:EncodeArrayFromDic(self.DetaisDic, self.TitleArray[0])];
        
        self.ContengHeight = [self getStringHeightWithText:self.TitleListArray[0].help font:[UIFont systemFontOfSize:14] viewWidth:YYScreenWidth -48] + 30;
        
        [self.collectionView reloadData];
    
    } failure:^(NSError *error, id responseCache) {
        
         self.DetaisDic = EncodeDicFromDic(responseCache, @"data");
        
         self.TitleArray = self.DetaisDic.allKeys;
        
         self.TitleListArray = [NSArray modelArrayWithClass:[BrandDetailsModel class] json:EncodeArrayFromDic(self.DetaisDic, self.TitleArray[0])];
        
         self.ContengHeight = [self getStringHeightWithText:self.TitleListArray[0].help font:[UIFont systemFontOfSize:14] viewWidth:YYScreenWidth -48] + 30;

         [self.collectionView reloadData];
        
        
    }];
    
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == 0) {
        
        BDetailsTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BDetailsTopCollectionViewCell" forIndexPath:indexPath];
        
        [cell.PhoneTextField addTarget:self action:@selector(PhoneFieldWithText:) forControlEvents:UIControlEventEditingChanged];
        
        [cell.MainImgView sd_setImageWithURL:[NSURL URLWithString:self.TitleListArray[self.bottomIndex].brand_cover] placeholderImage:[UIImage imageNamed:@"iqiyi"]];
        
        cell.NameTitleLabel.text = self.TitleListArray[self.bottomIndex].coupon_name;
        
        return cell;
        
        
    }else if (indexPath.item == 1){
        
        BDetailsCenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BDetailsCenCollectionViewCell" forIndexPath:indexPath];
        
        cell.TitleArray = self.TitleArray;
        
        cell.TitleListArray = self.TitleListArray;
        
        cell.TopBtnBlockClick = ^(NSInteger TagIndex) {
          
            self.TopIndex = TagIndex;
            
            self.TitleListArray = [NSArray modelArrayWithClass:[BrandDetailsModel class] json:EncodeArrayFromDic(self.DetaisDic, self.TitleArray[self.TopIndex])];
            
            self.ContengHeight = [self getStringHeightWithText:self.TitleListArray[self.bottomIndex].help font:[UIFont systemFontOfSize:14] viewWidth:YYScreenWidth -48] + 30;
            
            [self.collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:3 inSection:0], nil]];
            
            
        };
        
        cell.BottomBtnBlockClick = ^(NSInteger TagIndex) {
          
            self.bottomIndex = TagIndex;
            
            self.TitleListArray = [NSArray modelArrayWithClass:[BrandDetailsModel class] json:EncodeArrayFromDic(self.DetaisDic, self.TitleArray[self.TopIndex])];
            
            self.ContengHeight = [self getStringHeightWithText:self.TitleListArray[self.bottomIndex].help font:[UIFont systemFontOfSize:14] viewWidth:YYScreenWidth -48] + 30;
            
            [self.collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:0 inSection:0], nil]];
            
            [self.collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:3 inSection:0], nil]];
            
            
        };
        
        return cell;
        
        
    }else if (indexPath.item == 2){
        
        BDetailsShuoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BDetailsShuoCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
        
        
    }else{
        
        DetailsNotesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailsNotesCollectionViewCell" forIndexPath:indexPath];
        
        cell.ContentLabelString = self.TitleListArray[self.bottomIndex].help;
        
        return cell;
        
        
    }
    

    
}

#pragma mark =============监听uitextField值的变化============

- (void)PhoneFieldWithText:(UITextField *)textField{
    
    self.ChargePhone = textField.text;
    
}



#pragma mark <UICollectionViewDelegate>


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    if (indexPath.item == 0) {
        
        return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.46);
        
    }else if (indexPath.item == 1){
       
         return CGSizeMake(YYScreenWidth , 300);
        
    }else if (indexPath.item == 2){
       
        return CGSizeMake(YYScreenWidth , 112);
        
    }else{
       
        return CGSizeMake(YYScreenWidth , self.ContengHeight + 50);
        
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
        HomeImage.frame = CGRectMake(24, 7 , 20, 20);
    } else {
        HomeImage.frame = CGRectMake(24, 15 , 20, 20);
    }
    HomeImage.image = [UIImage imageNamed:@"icon_tabbar_homepage"];
    [BottomView addSubview:HomeImage];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"首页";
    if (YYTabBarHeight < 50) {
      TitleLabel.frame = CGRectMake(22, 33 , 24, 15);
    } else {
      TitleLabel.frame = CGRectMake(22, 40 , 24, 15);
    }
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.font = [UIFont systemFontOfSize:10 weight:0];
    [BottomView addSubview:TitleLabel];
    [HomeImage addTarget:self action:@selector(homeImgBtnClick)];
    
    UIButton * BuyButton = [[UIButton alloc]init];
    BuyButton.backgroundColor = YYHexColor(@"#FFD409");
    if (YYTabBarHeight > 50) {
       BuyButton.frame = CGRectMake(63 , 18 , YYScreenWidth - 75, 40);
    }else{
       BuyButton.frame = CGRectMake(63 , 7 , YYScreenWidth - 75, 40);
    }
    [BuyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [BuyButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [BuyButton addTarget:self action:@selector(ReChargeBottomBuyButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:BuyButton];
    [YYTools ChangeView:BuyButton RadiusSize:10 BorderColor:[UIColor clearColor]];
    
}



#pragma mark ===============立即购买商品=============

-(void)ReChargeBottomBuyButtonClick{
    
   
    
    NSString * ISLogin = [YYSaveTool GetCacheForKey:YYLogin];
    
    if ([ISLogin isEqualToString:@"0"] || self.UserModel == nil) {
         LoginCollectionViewController * LoginVc = [[LoginCollectionViewController alloc]init];
         LoginVc.title = @"";
         [self.navigationController pushViewController:LoginVc animated:YES];
         return;
    }
    
    if (self.ChargePhone.length == 0) {
        [self YYShowMessage:@"请输入充值的账号"];
        return;
    }
    
    BOOL alipay = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"alipay://"]];

    if (alipay == NO) {

        [self YYShowMessage:@"请先安装支付宝"];
        return;

    }
    
    
    if ([self.UserModel.plus_level isEqualToString:@"0"]) {
        
         [[LPAnimationView sharedMask] show:self.BuyHeadView withType:QWAlertViewStyleAlert];
        
    }else{
      
       NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVProductOrder];
       
       NSDictionary * dict = @{@"id":self.TitleListArray[self.bottomIndex].B_id,@"count":@"1",@"type":@"2",@"recharge_number":@"2"};
                     
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

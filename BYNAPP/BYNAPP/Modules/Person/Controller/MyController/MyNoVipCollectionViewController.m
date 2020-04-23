//
//  MyNoVipCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyNoVipCollectionViewController.h"
#import "MyNoVipCollectionViewCell.h"
#import "MyVipGridCollectionViewCell.h"
#import "MyNewImgCollectionViewCell.h"

@interface MyNoVipCollectionViewController ()

@property(nonatomic,strong)NSArray * ImgListArray;

@property(nonatomic,strong)UserModel * UserModel;

@property(nonatomic,strong)NSDictionary * VIPDataDic;

@end

@implementation MyNoVipCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.frame = CGRectMake(0, 0, YYScreenWidth, YYScreenHeight  - 70);
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:YYRGBColor(39, 39, 38)]  forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:YYRGBColor(39, 39, 38)]];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:18]}];

    [self.collectionView registerClass:[MyNoVipCollectionViewCell class] forCellWithReuseIdentifier:@"MyNoVipCollectionViewCell"];
    
    [self.collectionView registerClass:[MyVipGridCollectionViewCell class] forCellWithReuseIdentifier:@"MyVipGridCollectionViewCell"];
    
    [self.collectionView registerClass:[MyNewImgCollectionViewCell class] forCellWithReuseIdentifier:@"MyNewImgCollectionViewCell"];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetMyVipControllerNetData];
    
    [self GetVipControllerNetData];
    
}


#pragma mark 获取当前界面网络数据

-(void)GetMyVipControllerNetData{
    
   NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVCommon];
        
   [PPNetworkTools POST:url parameters:nil success:^(id responseObject) {
               
       NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
       
       self.ImgListArray = EncodeArrayFromDic(DataDic, @"plus_benefit_poster");
 
       [self.collectionView reloadData];
         
   } failure:^(NSError *error, id responseCache) {
             
       NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
       
       self.ImgListArray = EncodeArrayFromDic(DataDic, @"plus_benefit_poster");
       
       [self.collectionView reloadData];
       

    }];
    
}

//id = 3;
//month = 12;
//"ori_price" = 299;
//price = "29.9";
//"short_title" = "\U8d85\U503c1\U6298";
//"single_price" = "\U00a52.49/\U6708";
//title = "\U5e74\U5361";

-(void)GetVipControllerNetData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVMemberpage];
        
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
               
        NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
        
        NSArray * LevelArray = EncodeArrayFromDic(DataDic, @"level");
       
        self.VIPDataDic = LevelArray[0];
        
        [self CreateGoodsDetailsBottomView];
 
        [self.collectionView reloadData];
         
    } failure:^(NSError *error, id responseCache) {
             
        [self YYShowMessage:error.localizedFailureReason];

    }];
    
}


#pragma mark ===============创建下面UIview控制=============

-(void)CreateGoodsDetailsBottomView{
    
    
    UIView * BottomView = [[UIView alloc]init];
    BottomView.backgroundColor = UIColor.clearColor;
    BottomView.frame = CGRectMake(0, YYScreenHeight - YYBarHeight - 70, YYScreenWidth, 70);
    [self.view addSubview:BottomView];
    
    UIButton * ShareButton = [[UIButton alloc]init];
    ShareButton.backgroundColor = YYHexColor(@"#FFD117");
    ShareButton.frame = CGRectMake(0, 20 , YYScreenWidth, 50);
    NSString * TitleString = [NSString stringWithFormat:@"%@元/年 开通会员",EncodeStringFromDic(self.VIPDataDic, @"ori_price")];
    [ShareButton setTitle:TitleString forState:UIControlStateNormal];
    ShareButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [ShareButton setTitleColor:YY22Color forState:UIControlStateNormal];
    [ShareButton addTarget:self action:@selector(BuyVipBtnClick) forControlEvents:UIControlEventTouchUpInside];
    ShareButton.titleLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [BottomView addSubview:ShareButton];
   
    UIImageView * HomeImage = [[UIImageView alloc] init];
    HomeImage.frame = CGRectMake(YYScreenWidth/2 - 151, 0, 302, 28);
    HomeImage.image = [UIImage imageNamed:@"vipbuytop"];
    [BottomView addSubview:HomeImage];
    
    UILabel * VipLabel = [[UILabel alloc]init];
    VipLabel.text = @"开通后7天内，如无享受过任何会员特权，支持退款";
    VipLabel.frame = CGRectMake(YYScreenWidth/2 - 151, 2 , 302, 18);
    VipLabel.textAlignment = NSTextAlignmentCenter;
    VipLabel.font = [UIFont systemFontOfSize:12];
    VipLabel.textColor = YYHexColor(@"#FFF6CA");
    [BottomView addSubview:VipLabel];
    

}


#pragma mark ===============购买按钮=============

-(void)BuyVipBtnClick{
    
    
    BOOL alipay = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"alipay://"]];

    if (alipay == NO) {

        [self YYShowMessage:@"请先安装支付宝"];
        return;

    }
    
    self.UserModel = [YYSaveTool YY_GetSaveModelWithkey:YYUser modelClass:UserModel.class];
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVMemberBuy];
    
    NSDictionary * dict = @{@"id":EncodeStringFromDic(self.VIPDataDic, @"id")};
                  
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

#pragma mark ===============得到支付订单参数=============

-(void)GetBarndPaySignNetWork:(NSString*)order_no{
    
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVMemberBuy];
    
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


-(void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]  forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :YY33Color, NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:YYE5Color]];
    
}




#pragma mark 收益明细
-(void)VipLeftBackClick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 5;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
     return 1;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        MyNoVipCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyNoVipCollectionViewCell" forIndexPath:indexPath];
              
        return cell;
        
        
    }else if (indexPath.section ==1){
       
        MyVipGridCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyVipGridCollectionViewCell" forIndexPath:indexPath];
        
        cell.ImgListArray = self.ImgListArray;
        
        return cell;
        
    }else if (indexPath.section ==2){
       
        MyNewImgCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyNewImgCollectionViewCell" forIndexPath:indexPath];
        
        [cell.MainImgView setImage:[UIImage imageNamed:@"vipbuy"]];
        
        return cell;
        
   }else if (indexPath.section ==3){
       
        MyNewImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyNewImgCollectionViewCell" forIndexPath:indexPath];
       
        [cell.MainImgView setImage:[UIImage imageNamed:@"vipzone"]];
           
        return cell;
        
   }else {
       
        MyNewImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyNewImgCollectionViewCell" forIndexPath:indexPath];
       
        [cell.MainImgView setImage:[UIImage imageNamed:@"vipqidai"]];
           
        return cell;
        
    }
   
    
}



#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     if (indexPath.section == 0) {
        return CGSizeMake(YYScreenWidth , YYScreenWidth);
     }else if (indexPath.section ==1){
        return CGSizeMake(YYScreenWidth , YYScreenWidth);
     }else if (indexPath.section ==2){
        return CGSizeMake(YYScreenWidth , YYScreenWidth);
     }else if (indexPath.section ==3){
        return CGSizeMake(YYScreenWidth , YYScreenWidth * 1.43);
     }else{
        return CGSizeMake(YYScreenWidth , YYScreenWidth);
     }
     
    
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return (CGSize){YYScreenWidth, 0 };
    }else{
        return (CGSize){YYScreenWidth, 75};
    }
     
    
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
        
        for (UIView *view in headerView.subviews) {
            [view removeFromSuperview];
        }
        
        headerView.backgroundColor = YYBGColor;
        
        if (indexPath.section == 1) {
         
            UILabel * TitleLabel = [[UILabel alloc]init];
            TitleLabel.text = @"—— 尊享权益 ——";
            TitleLabel.textColor = YY22Color;
            TitleLabel.frame = CGRectMake(0 , 32, YYScreenWidth, 25);
            TitleLabel.textAlignment = NSTextAlignmentCenter;
            TitleLabel.font = [UIFont systemFontOfSize:18 weight:2];
            [headerView addSubview:TitleLabel];
            
        }else if (indexPath.section == 2){
            
            UILabel * TitleLabel = [[UILabel alloc]init];
            TitleLabel.text = @"—— 购物特权 ——";
            TitleLabel.textColor = YY22Color;
            TitleLabel.frame = CGRectMake(0 , 32, YYScreenWidth, 25);
            TitleLabel.textAlignment = NSTextAlignmentCenter;
            TitleLabel.font = [UIFont systemFontOfSize:18 weight:2];
            [headerView addSubview:TitleLabel];
            
        }else if (indexPath.section == 3){
            
            UILabel * TitleLabel = [[UILabel alloc]init];
            TitleLabel.text = @"—— 0元专属特权 ——";
            TitleLabel.textColor = YY22Color;
            TitleLabel.frame = CGRectMake(0 , 32, YYScreenWidth, 25);
            TitleLabel.textAlignment = NSTextAlignmentCenter;
            TitleLabel.font = [UIFont systemFontOfSize:18 weight:2];
            [headerView addSubview:TitleLabel];
            
        }else if (indexPath.section == 4){
            
            UILabel * TitleLabel = [[UILabel alloc]init];
            TitleLabel.text = @"—— 更多特权正在上线中 ——";
            TitleLabel.textColor = YY22Color;
            TitleLabel.frame = CGRectMake(0 , 32, YYScreenWidth, 25);
            TitleLabel.textAlignment = NSTextAlignmentCenter;
            TitleLabel.font = [UIFont systemFontOfSize:18 weight:2];
            [headerView addSubview:TitleLabel];
            
        }
    
        return headerView;
    
    }
    
    return nil;
    
}


#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
      return UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
      return 0;
    
}


@end

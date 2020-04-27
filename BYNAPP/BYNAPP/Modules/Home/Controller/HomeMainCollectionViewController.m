//
//  HomeMainCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeMainCollectionViewController.h"
#import "HomeBannerCollectionViewCell.h"
#import "HomeGridCollectionViewCell.h"
#import "ImgCollectionViewCell.h"
#import "HomeTopicCollectionViewCell.h"
#import "HomeTimeCollectionViewCell.h"
#import "HomeMainCollectionViewCell.h"

#import "LimitBuyCollectionViewController.h"
#import "HomeBannerModel.h"
#import "HomeTimeModel.h"

#import "TBHotCollectionViewController.h"
#import "JiuJiuCollectionViewController.h"
#import "PDDCollectionViewController.h"
#import "JingDCollectionViewController.h"
#import "TBMatterCollectionViewController.h"
#import "AblumCollectionViewController.h"

#import "BrandCouponCollectionViewController.h"
#import "BrandRechargeCollectionViewController.h"
#import "BrandListCollectionViewController.h"
#import "HomeBrandCateCollectionViewController.h"

@interface HomeMainCollectionViewController ()

@property(nonatomic,strong)NSArray<HomeBannerModel*> * BannerArray;

@property(nonatomic,strong)NSMutableArray * BannerImgArray;

@property(nonatomic,strong)NSArray<HomeBannerModel*> * ChannlesArray;

@property(nonatomic,strong)NSArray<HomeBannerModel*> * MiddlesArray;

@property(nonatomic,strong)NSArray<HomeBannerModel*> * ZonesArray;

@property(nonatomic,strong)NSArray * HotWordsArray;

@property(nonatomic,strong)NSArray<HomeTimeModel*> * TimesArray;

@property(nonatomic,strong)NSMutableArray<HomeMainModel*> * GoodsItemsArray;

@end


@implementation HomeMainCollectionViewController


- (void)viewDidLoad {
    
     [super viewDidLoad];
    
     self.BannerImgArray = [NSMutableArray array];
    
     self.GoodsItemsArray = [NSMutableArray array];
   
     [self.collectionView registerClass:[HomeBannerCollectionViewCell class] forCellWithReuseIdentifier:@"HomeBannerCollectionViewCell"];
    
     [self.collectionView registerClass:[HomeGridCollectionViewCell class] forCellWithReuseIdentifier:@"HomeGridCollectionViewCell"];
    
     [self.collectionView registerClass:[ImgCollectionViewCell class] forCellWithReuseIdentifier:@"ImgCollectionViewCell"];
    
     [self.collectionView registerClass:[HomeTopicCollectionViewCell class] forCellWithReuseIdentifier:@"HomeTopicCollectionViewCell"];
    
     [self.collectionView registerClass:[HomeTimeCollectionViewCell class] forCellWithReuseIdentifier:@"HomeTimeCollectionViewCell"];
    
     [self.collectionView registerClass:[HomeMainCollectionViewCell class] forCellWithReuseIdentifier:@"HomeMainCollectionViewCell"];
        
     [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
     self.collectionView.mj_header = [LPRefreshGifHeader headerWithRefreshingBlock:^{
           
          [self GetHomebannerGoodsNetdata];
           
     }];
   
     self.collectionView.mj_footer = [LPRefreshFooter footerWithRefreshingBlock:^{
       
         [self GetHomeRecommendMoreData];
       
     }];
    
}



-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
    
//    [self YYGetPOPWindowAdverView];
   
    [self GetHomebannerGoodsNetdata];

}


#pragma mark ===============当前界面弹框点击事件============

-(void)POPWindowImgClick{
    
    
    
    
}

#pragma mark ===============网络请求=============

-(void)GetHomebannerGoodsNetdata{
    
    dispatch_group_t group = dispatch_group_create();
    
    [self loadPartOne:group];
    
    [self loadPartTwo:group];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       
        [self.collectionView.mj_header endRefreshing];
        
         YYCache * cache = [[YYCache alloc]initWithName:MyCache];
        
         [cache setObject:self.HotWordsArray forKey:YYHotWords];
      
         [self.collectionView reloadData];
              
    });
    
}


-(void)loadPartOne:(dispatch_group_t)group{
    
     dispatch_group_enter(group);
    
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsHome];
                 
     [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
          
        NSDictionary * Data1 = EncodeDicFromDic(responseObject, @"data");
         
        [self.BannerImgArray removeAllObjects];
         
        YYNSLog(@"获取首页数据--------%@",Data1);
        
        self.BannerArray =  [NSArray modelArrayWithClass:[HomeBannerModel class] json:EncodeArrayFromDic(Data1, @"banners")];
        
        for (HomeBannerModel * Model in self.BannerArray) {
            [self.BannerImgArray addObject:Model.cover];
        }
         
        self.HotWordsArray = EncodeArrayFromDic(Data1, @"hot_words");
         
        self.ChannlesArray =  [NSArray modelArrayWithClass:[HomeBannerModel class] json:EncodeArrayFromDic(Data1, @"channels")];
        
        self.MiddlesArray =  [NSArray modelArrayWithClass:[HomeBannerModel class] json:EncodeArrayFromDic(Data1, @"middles")];

        self.ZonesArray =  [NSArray modelArrayWithClass:[HomeBannerModel class] json:EncodeArrayFromDic(Data1, @"zones")];
        
        self.TimesArray =  [NSArray modelArrayWithClass:[HomeTimeModel class] json:EncodeArrayFromDic(Data1, @"flash_sales")];
         
         dispatch_group_leave(group);
         
     } failure:^(NSError *error, id responseCache) {
         
                 
           dispatch_group_leave(group);
         
                        
     }];

}


-(void)loadPartTwo:(dispatch_group_t)group{
    
     dispatch_group_enter(group);
    
     self.RefreshCount = 1;

     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsTaobaoHot];
                        
     [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
          
          NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
         
          self.RefreshCount ++ ;
         
          [self.GoodsItemsArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(Data, @"items")]];
         
          dispatch_group_leave(group);
                
     } failure:^(NSError *error, id responseCache) {
         
          NSDictionary * Data = EncodeDicFromDic(responseCache, @"data");
         
          [self.GoodsItemsArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(Data, @"items")]];
                           
          dispatch_group_leave(group);
                               
     }];
    
}


#pragma mark ===============网络请求获取更多=============

-(void)GetHomeRecommendMoreData{
    
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsTaobaoHot];
    
    NSDictionary * dict = @{@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                       
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
         
        NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
        
        self.RefreshCount ++ ;
        
        [self.GoodsItemsArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(Data, @"items")]];
        
        [self.collectionView.mj_footer endRefreshing];
        
        [self.collectionView reloadData];
               
    } failure:^(NSError *error, id responseCache) {
        
         NSDictionary * Data = EncodeDicFromDic(responseCache, @"data");
        
         [self.GoodsItemsArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(Data, @"items")]];
        
         [self.collectionView.mj_footer endRefreshing];
        
         [self.collectionView reloadData];
                          
                              
    }];
    
    
    
}


-(void)GetNetdata{
    
    //网络请求1
     RACSignal * signal1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    
         return  nil;
         
     }];
         
    //网络请求2
     RACSignal * signal2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
  
         return  nil;
         
     }];
     
    
     [self rac_liftSelector:@selector(updateUIPic:pic2:) withSignalsFromArray:@[signal1,signal2]];
    
}




#pragma mark <UICollectionViewDataSource>

//相当tableview的几个区，

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
      return 6;
  
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        if (self.BannerImgArray.count == 0) {
            return 0;
        }else{
            return 1;
        }
    }else if (section == 1){
        if (self.ChannlesArray.count == 0) {
            return 0;
        }else{
            return 1;
        }
    }else if (section == 2){
        if (self.MiddlesArray.count == 0) {
            return 0;
        }else{
            return 1;
        }
    }else if (section == 3){
        if (self.ZonesArray.count == 0) {
            return 0;
        }else{
            return 1;
        }
    }else if (section == 4){
       if (self.TimesArray[0].data.count == 0) {
           return 0;
       }else{
           return 1;
       }
    }else{
       return self.GoodsItemsArray.count;
    }

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
         HomeBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeBannerCollectionViewCell" forIndexPath:indexPath];
        
         cell.ImgListArray = self.BannerImgArray;
        
         cell.SdClyImgBlockClick = ^(NSInteger ImgIndex) {
             
             [self HomeMainPushNextController:self.BannerArray[indexPath.item]];
            
         };

         return cell;
        
    }else if (indexPath.section == 1){
        
         HomeGridCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeGridCollectionViewCell" forIndexPath:indexPath];
   
         cell.ChannelListArray = self.ChannlesArray;
        
        cell.GridBtnBlockClick = ^(NSInteger index) {
       
             [self HomeMainPushNextController:self.ChannlesArray[index]];
            
         };
        
         return cell;
        
    }else if (indexPath.section == 2){
        
        ImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImgCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }else if (indexPath.section == 3){
        
        HomeTopicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeTopicCollectionViewCell" forIndexPath:indexPath];
        
        cell.ZonesListArray = self.ZonesArray;
        
        cell.TopicBtnBlockClick = ^(NSInteger index) {
          
             [self HomeMainPushNextController:self.ZonesArray[index]];
            
        };

        return cell;
        
    }else if (indexPath.section == 4){
        
         HomeTimeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeTimeCollectionViewCell" forIndexPath:indexPath];
        
        cell.TimeListArray = self.TimesArray;
        
         cell.PushLimtbuyBlockClick = ^{
         
             LimitBuyCollectionViewController * BuyVc = [[LimitBuyCollectionViewController alloc]init];
             BuyVc.title = @"限时抢购";
             [self.navigationController pushViewController:BuyVc animated:YES];
             
         };
        
         cell.PushLGoodDetailsBlockClick = ^(HomeMainModel * _Nonnull Model) {
          
             HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
             HomeVc.mall_id = Model.mall_id;
             HomeVc.item_id = Model.item_id;
             HomeVc.activity_id = Model.activity_id;
             [self.navigationController pushViewController:HomeVc animated:YES];
            
         };
    
          return cell;
        
        
    }else{
        
        HomeMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeMainCollectionViewCell" forIndexPath:indexPath];
        
        cell.Model = self.GoodsItemsArray[indexPath.item];
        
        return cell;
           
    }

     

}


#pragma mark -选中某item进行跳转
//1-web；2-商品详情；3-聚划算；4-9块9包邮；5-拼多多；6-京东；
//7-专辑详情；10-淘宝物料 11-拼多多官方活动 12-京东官方活动 13-品牌馆
-(void)HomeMainPushNextController:(HomeBannerModel *)HomeModel{
    
//     YYNSLog(@"跳转的类型-----%@",HomeModel.target_type);
    NSString * ISLogin = [YYSaveTool GetCacheForKey:YYLogin];
    
    if ([HomeModel.need_login isEqualToString:@"1"] & [ISLogin isEqualToString:@"0"]) {
        
        LoginCollectionViewController * LoginVc = [[LoginCollectionViewController alloc]init];
        LoginVc.title = @"";
        [self.navigationController pushViewController:LoginVc animated:YES];
        return;
        
    }
    
    if ([HomeModel.target_type isEqualToString:@"1"]) {
        
        YYWebViewController * Web = [[YYWebViewController alloc]init];
        Web.WebUrlString = HomeModel.target_url;
        Web.title = HomeModel.target_title;
        [self.navigationController pushViewController:Web animated:YES];
        
    }else if ([HomeModel.target_type isEqualToString:@"2"]){
       
        HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
        HomeVc.mall_id = HomeModel.target_Sub_type;
        HomeVc.item_id = HomeModel.target_item_id;
        HomeVc.activity_id = HomeModel.target_Tactivity_id;
        [self.navigationController pushViewController:HomeVc animated:YES];
        
    }else if ([HomeModel.target_type isEqualToString:@"3"]){
        
        TBHotCollectionViewController * HotVc = [[TBHotCollectionViewController alloc]init];
        HotVc.title = @"聚划算";
        [self.navigationController pushViewController:HotVc animated:YES];
        
    }else if ([HomeModel.target_type isEqualToString:@"4"]){
        
        JiuJiuCollectionViewController * HotVc = [[JiuJiuCollectionViewController alloc]init];
        HotVc.title = @"9.9包邮";
        [self.navigationController pushViewController:HotVc animated:YES];
        
    }else if ([HomeModel.target_type isEqualToString:@"5"]){
       
        PDDCollectionViewController * PDDVc = [[PDDCollectionViewController alloc]init];
        PDDVc.title = @"拼多多";
        [self.navigationController pushViewController:PDDVc animated:YES];
        
    }else if ([HomeModel.target_type isEqualToString:@"6"]){
       
        JingDCollectionViewController * JDVc = [[JingDCollectionViewController alloc]init];
        JDVc.title = @"京东商城";
        [self.navigationController pushViewController:JDVc animated:YES];
        
    }else if ([HomeModel.target_type isEqualToString:@"7"]){
       
        AblumCollectionViewController * AblumVc = [[AblumCollectionViewController alloc]init];
        AblumVc.title = @"专辑列表";
        [self.navigationController pushViewController:AblumVc animated:YES];
        
        
    }else if ([HomeModel.target_type isEqualToString:@"10"]){
       
        TBMatterCollectionViewController * TBVc = [[TBMatterCollectionViewController alloc]init];
        TBVc.title = @"淘宝物料";
        TBVc.material_id = HomeModel.banner_id;
        [self.navigationController pushViewController:TBVc animated:YES];
        
    }else if ([HomeModel.target_type isEqualToString:@"11"]){
       
        
        
    }else if ([HomeModel.target_type isEqualToString:@"13"]){
       
        
#pragma mark ===============卡券商品详情页=============
        if ([HomeModel.target_path containsString:@"card_coupons"]) {
            
          BrandCouponCollectionViewController * BrandVc = [[BrandCouponCollectionViewController alloc]init];
          BrandVc.title = @"卡券商品详情";
          BrandVc.Details_id = [self HomeGetId:HomeModel.target_path];
          BrandVc.mall_id = [self HomeGetMallId:HomeModel.target_path];
          [self.navigationController pushViewController:BrandVc animated:YES];
#pragma mark ===============直充商品详情页=============
        }else if ([HomeModel.target_path containsString:@"charge_coupons"]){
          
            BrandRechargeCollectionViewController * BrandVc = [[BrandRechargeCollectionViewController alloc]init];
            BrandVc.title = @"卡券商品详情";
            BrandVc.Details_id = [self HomeGetId:HomeModel.target_path];
            BrandVc.mall_id = [self HomeGetMallId:HomeModel.target_path];
            [self.navigationController pushViewController:BrandVc animated:YES];
          
#pragma mark ===============某品牌的商品列表=============
        }else if ([HomeModel.target_path containsString:@"brand-coupons"]){
          
           BrandListCollectionViewController * BrandVc = [[BrandListCollectionViewController alloc]init];
           BrandVc.title =@"商品列表";
           BrandVc.Bid_id = [self HomeGetId:HomeModel.target_path];
           [self.navigationController pushViewController:BrandVc animated:YES];
            
            
 #pragma mark ===============某类目的商品列表页=============
        }else if ([HomeModel.target_path containsString:@"category-coupons"]){
          
            
            HomeBrandCateCollectionViewController * BrandVc = [[HomeBrandCateCollectionViewController alloc]init];
            BrandVc.title =@"商品列表";
            BrandVc.Brand_id = [self HomeGetId:HomeModel.target_path];
            [self.navigationController pushViewController:BrandVc animated:YES];
        }
      
    }
    
    
}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 2) {
        
        [self HomeMainPushNextController:self.MiddlesArray[0]];
        
    }else if (indexPath.section == 5){
        
        HomeMainModel * Model = self.GoodsItemsArray[indexPath.item];
        HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
        HomeVc.mall_id = Model.mall_id;
        HomeVc.item_id = Model.item_id;
        HomeVc.activity_id = Model.activity_id;
        [self.navigationController pushViewController:HomeVc animated:YES];
        
    }
    

}



#pragma mark <UICollectionViewDelegate>

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return CGSizeMake(YYScreenWidth - 24, (YYScreenWidth - 24)*0.364 + 10);
        
    }else if (indexPath.section == 1){
       
        return CGSizeMake(YYScreenWidth - 24 , 170);
        
    }else if (indexPath.section == 2){
       
        return CGSizeMake(YYScreenWidth - 24 , 100);
        
    }else if (indexPath.section == 3){
        
         return CGSizeMake(YYScreenWidth - 24 ,  (self.ZonesArray.count / 2) * 90 + 15);
    
    }else if (indexPath.section == 4){
        
        return CGSizeMake(YYScreenWidth , YYScreenWidth/3 + 100);
        
    }else{
        
        return CGSizeMake(YYScreenWidth , 144);
        
    }
    
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
     if (section == 5) {
        return (CGSize){YYScreenWidth,50};
     }else{
        return (CGSize){YYScreenWidth,0};
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
        
        headerView.backgroundColor = YYBGColor;
        
        UILabel * TitleLabel = [[UILabel alloc]init];
        TitleLabel.text = @"热卖推荐";
        TitleLabel.textColor = YY22Color;
        TitleLabel.frame = CGRectMake(13 , 16, 180, 25);
        TitleLabel.textAlignment = NSTextAlignmentLeft;
        TitleLabel.font = [UIFont systemFontOfSize:18 weight:2];
        [headerView addSubview:TitleLabel];
     
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

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
   
    return 0;

}




#pragma mark ===============品牌券遍历id=============

-(NSString*)HomeGetMallId:(NSString*)HomePath{

    if (HomePath.length == 0) {
        
        return @"1";
        
    }else{
        
       NSRange range = [HomePath rangeOfString:@"&"];
        
       NSRange NewRang = NSMakeRange(range.location + 1, HomePath.length -range.location -1);
        
       NSString * NewSting = [HomePath substringWithRange:NewRang];
        
       return [NewSting substringWithRange:NSMakeRange(8, NewSting.length - 8)];
        
    }
    
}


-(NSString*)HomeGetId:(NSString*)HomePath{

    if (HomePath.length == 0) {
        
        return @"1";
        
    }else{
        
        NSRange range = [HomePath rangeOfString:@"&"];
        
        if (range.length == 0) {
           
             NSRange range1 = [HomePath rangeOfString:@"?"];
            
             return [HomePath substringWithRange:NSMakeRange(range1.location + 4, HomePath.length - range1.location - 4)];
            
        }else{
         
            NSRange range1 = [HomePath rangeOfString:@"?"];
            
            return [HomePath substringWithRange:NSMakeRange(range1.location + 4, range.location - range1.location - 4)];
           
        }
        
    }
    
}

@end

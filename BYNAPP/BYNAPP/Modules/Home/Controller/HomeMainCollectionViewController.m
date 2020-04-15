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
#import "HomeDetailsCollectionViewController.h"
#import "LimitBuyCollectionViewController.h"
#import "HomeBannerModel.h"
#import "HomeTimeModel.h"

#import "TBHotCollectionViewController.h"
#import "JiuJiuCollectionViewController.h"
#import "PDDCollectionViewController.h"
#import "JingDCollectionViewController.h"
#import "TBMatterCollectionViewController.h"
#import "AblumCollectionViewController.h"

@interface HomeMainCollectionViewController ()

@property(nonatomic,strong)NSArray<HomeBannerModel*> * BannerArray;

@property(nonatomic,strong)NSMutableArray * BannerImgArray;

@property(nonatomic,strong)NSArray<HomeBannerModel*> * ChannlesArray;

@property(nonatomic,strong)NSArray<HomeBannerModel*> * MiddlesArray;

@property(nonatomic,strong)NSArray<HomeBannerModel*> * ZonesArray;

@property(nonatomic,strong)NSArray<HomeTimeModel*> * TimesArray;

@property(nonatomic,strong)NSArray<HomeMainModel*> * GoodsItemsArray;

@end

@implementation HomeMainCollectionViewController


- (void)viewDidLoad {
    
     [super viewDidLoad];
    
     self.BannerImgArray = [NSMutableArray array];
   
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
       
//         [self GetHomeMoreHotData];
       
    }];
}


-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
   
    [self GetHomebannerGoodsNetdata];

}


#pragma mark  多个网络请求结束后在这里处理数据


-(void)GetHomebannerGoodsNetdata{
    
    //网络请求1
     RACSignal * signal1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      
         NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsHome];
                     
         [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
                         
              [subscriber sendNext:responseObject];
             
         } failure:^(NSError *error, id responseCache) {
                        
              [subscriber sendNext:responseCache];
                            
         }];
         
         return  nil;
         
     }];
         
    //网络请求2
     RACSignal * signal2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
         NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsTaobaoHot];
                     
         [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
             
              [subscriber sendNext:responseObject];
             
         } failure:^(NSError *error, id responseCache) {
                        
              [subscriber sendNext:responseCache];
                            
         }];
         return  nil;
     }];
     
    
     [self rac_liftSelector:@selector(updateUIPic:pic2:) withSignalsFromArray:@[signal1,signal2]];
    
}

- (void)updateUIPic:(id)pic1 pic2:(id)pic2{
  
    NSDictionary * NetData1 = (NSDictionary*)pic1;
    
    NSDictionary * NetData2 = (NSDictionary*)pic2;
    
//    YYNSLog(@"首页广告位数据------%@",NetData1);
    
    NSDictionary * Data1 = EncodeDicFromDic(NetData1, @"data");
    
    [self.BannerImgArray removeAllObjects];
    
    self.BannerArray =  [NSArray modelArrayWithClass:[HomeBannerModel class] json:EncodeArrayFromDic(Data1, @"banners")];
    
    for (HomeBannerModel * Model in self.BannerArray) {
        [self.BannerImgArray addObject:Model.cover];
    }
    
    self.ChannlesArray =  [NSArray modelArrayWithClass:[HomeBannerModel class] json:EncodeArrayFromDic(Data1, @"channels")];
    
    self.MiddlesArray =  [NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(Data1, @"middles")];

    self.ZonesArray =  [NSArray modelArrayWithClass:[HomeBannerModel class] json:EncodeArrayFromDic(Data1, @"zones")];
    
    self.TimesArray =  [NSArray modelArrayWithClass:[HomeTimeModel class] json:EncodeArrayFromDic(Data1, @"flash_sales")];
    
    NSDictionary * Data2 = EncodeDicFromDic(NetData2, @"data");
    
    self.GoodsItemsArray =  [NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(Data2, @"items")];
    
    [self.collectionView.mj_header endRefreshing];
    
    [self.collectionView reloadData];
    
    
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
         
             LimitBuyCollectionViewController * LimitVc = [[LimitBuyCollectionViewController alloc]init];
             LimitVc.title = @"限时抢购";
             [self.navigationController pushViewController:LimitVc animated:YES];
             
             
         };
        
         cell.PushLGoodDetailsBlockClick = ^(HomeMainModel * _Nonnull Model) {
          
             HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
             HomeVc.Goods_Type = Model.mall_id;
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
//7-专辑详情；10-淘宝物料 11-拼多多官方活动 12-京东官方活动 13-自定义
-(void)HomeMainPushNextController:(HomeBannerModel *)HomeModel{
    
     YYNSLog(@"跳转的类型-----%@",HomeModel.target_type);
    
    if ([HomeModel.target_type isEqualToString:@"1"]) {
        
        YYWebViewController * Web = [[YYWebViewController alloc]init];
        Web.WebUrlString = HomeModel.target_url;
        Web.title = HomeModel.target_title;
        [self.navigationController pushViewController:Web animated:YES];
        
    }else if ([HomeModel.target_type isEqualToString:@"2"]){
       
        HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
        HomeVc.Goods_Type = HomeModel.target_Sub_type;
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
       
        
        
    }
    
    
}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeMainModel * Model = self.GoodsItemsArray[indexPath.item];
    HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
    HomeVc.Goods_Type = Model.mall_id;
    HomeVc.item_id = Model.item_id;
    HomeVc.activity_id = Model.activity_id;
    [self.navigationController pushViewController:HomeVc animated:YES];
    
    
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
        
        return CGSizeMake(YYScreenWidth - 24 ,  (self.ZonesArray.count / 2  + 1) * 90 + 15);
    
    }else if (indexPath.section == 4){
        
         return CGSizeMake(YYScreenWidth , 220);
        
    }else{
        
        return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.36);
        
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


@end

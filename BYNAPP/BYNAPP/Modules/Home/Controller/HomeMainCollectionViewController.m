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
#import "HomeTopicCollectionViewCell.h"
#import "HomeTimeCollectionViewCell.h"
#import "HomeMainCollectionViewCell.h"
#import "HomeDetailsCollectionViewController.h"
#import "LimitBuyCollectionViewController.h"
#import "HomeBannerModel.h"

@interface HomeMainCollectionViewController ()

@property(nonatomic,strong)NSArray<HomeBannerModel*> * BannerArray;

@property(nonatomic,strong)NSMutableArray * BannerImgArray;

@property(nonatomic,strong)NSArray<HomeBannerModel*> * ChannlesArray;

@property(nonatomic,strong)NSArray<HomeBannerModel*> * TimesArray;

@property(nonatomic,strong)NSArray<HomeMainModel*> * GoodsItemsArray;

@end

@implementation HomeMainCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    
     [super viewDidLoad];
    
     self.BannerImgArray = [NSMutableArray array];
   
     [self.collectionView registerClass:[HomeBannerCollectionViewCell class] forCellWithReuseIdentifier:@"HomeBannerCollectionViewCell"];
    
     [self.collectionView registerClass:[HomeGridCollectionViewCell class] forCellWithReuseIdentifier:@"HomeGridCollectionViewCell"];
    
     [self.collectionView registerClass:[HomeTopicCollectionViewCell class] forCellWithReuseIdentifier:@"HomeTopicCollectionViewCell"];
    
     [self.collectionView registerClass:[HomeTimeCollectionViewCell class] forCellWithReuseIdentifier:@"HomeTimeCollectionViewCell"];
    
     [self.collectionView registerClass:[HomeMainCollectionViewCell class] forCellWithReuseIdentifier:@"HomeMainCollectionViewCell"];
        
     [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
   
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

#pragma mark  多个网络请求结束后在这里处理数据

- (void)updateUIPic:(id)pic1 pic2:(id)pic2{
  
    NSDictionary * NetData1 = (NSDictionary*)pic1;
    
    NSDictionary * Data1 = EncodeDicFromDic(NetData1, @"data");
    
    self.BannerArray =  [NSArray modelArrayWithClass:[HomeBannerModel class] json:EncodeArrayFromDic(Data1, @"banners")];
    
    for (HomeBannerModel * Model in self.BannerArray) {
        [self.BannerImgArray addObject:Model.cover];
    }
    
    self.ChannlesArray =  [NSArray modelArrayWithClass:[HomeBannerModel class] json:EncodeArrayFromDic(Data1, @"channels")];
    
    NSDictionary * NetData2 = (NSDictionary*)pic2;
    
    NSDictionary * Data2 = EncodeDicFromDic(NetData2, @"data");
    
    self.GoodsItemsArray =  [NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(Data2, @"items")];
    
    [self.collectionView reloadData];
    
    
}



#pragma mark <UICollectionViewDataSource>

//相当tableview的几个区，

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 5;
  
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 4) {
        return self.GoodsItemsArray.count;
    }
    return 1;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
         HomeBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeBannerCollectionViewCell" forIndexPath:indexPath];
        
         cell.ImgListArray = self.BannerImgArray;
        
         cell.SdClyImgBlockClick = ^(NSInteger ImgIndex) {
            
            HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
            
            [self.navigationController pushViewController:HomeVc animated:YES];
            
        };

         return cell;
        
    }else if (indexPath.section == 1){
        
        HomeGridCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeGridCollectionViewCell" forIndexPath:indexPath];
   
         return cell;
        
    }else if (indexPath.section == 2){
        
        HomeTopicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeTopicCollectionViewCell" forIndexPath:indexPath];
        
        cell.backgroundColor = [UIColor whiteColor];
        
//        cell.ImgListArray = self.LocalImgArray;
    
        return cell;
        
    }else if (indexPath.section == 3){
        
         HomeTimeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeTimeCollectionViewCell" forIndexPath:indexPath];
        
         cell.PushLimtbuyBlockClick = ^{
         
             LimitBuyCollectionViewController * LimitVc = [[LimitBuyCollectionViewController alloc]init];
             LimitVc.title = @"限时抢购";
             [self.navigationController pushViewController:LimitVc animated:YES];
             
          };
    
          return cell;
        
        
    }else{
        
        HomeMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeMainCollectionViewCell" forIndexPath:indexPath];
        
        cell.Model = self.GoodsItemsArray[indexPath.item];
        
         return cell;
           
    }

     

}


#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
    
    [self.navigationController pushViewController:HomeVc animated:YES];
    
    
}



#pragma mark <UICollectionViewDelegate>

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return CGSizeMake(YYScreenWidth - 24, (YYScreenWidth - 24)*0.364 + 10);
        
    }else if (indexPath.section == 1){
       
        return CGSizeMake(YYScreenWidth - 24 , 170);
        
    }else if (indexPath.section == 2){
        
        if (self.BannerImgArray.count == 1) {
            return CGSizeMake(YYScreenWidth - 24 , 105);
        }else{
            return CGSizeMake(YYScreenWidth - 24 , 105 + (self.BannerImgArray.count / 2 ) * 90);
        }
    }else if (indexPath.section == 3){
        
        return CGSizeMake(YYScreenWidth , 220);
        
    }else{
        
        return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.36);
        
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

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
   
    return 0;

}


@end

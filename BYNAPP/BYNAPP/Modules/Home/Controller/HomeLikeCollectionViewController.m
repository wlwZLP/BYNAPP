//
//  HomeLikeCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeLikeCollectionViewController.h"
#import "HomeMainCollectionViewCell.h"
#import "HomeMainViewModel.h"
#import <AdSupport/AdSupport.h>

@interface HomeLikeCollectionViewController ()

@property(nonatomic,strong)HomeMainViewModel * ViewModel;

@property(nonatomic,strong)NSMutableArray<HomeMainModel*> * homeListArray;

@end

@implementation HomeLikeCollectionViewController


- (void)viewDidLoad {
        
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    self.homeListArray = [NSMutableArray array];
 
    [self.collectionView registerClass:[HomeMainCollectionViewCell class] forCellWithReuseIdentifier:@"HomeMainCollectionViewCell"];
     
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    self.collectionView.mj_header = [LPRefreshGifHeader headerWithRefreshingBlock:^{
            
           if ([self.category_id isEqualToString:@"8888"]) {
             
                [self GetHomeGuessLikeNetworkData];
               
           }else{
               
                [self GetHomePlistCateNetworkData];
               
           }
            
    }];
    
    self.collectionView.mj_footer = [LPRefreshFooter footerWithRefreshingBlock:^{
        
         if ([self.category_id isEqualToString:@"8888"]) {
          
              [self GetHomeGuessLikeNetMoreData];
            
         }else{
            
              [self GetHomePlistCateNetMoreData];
            
         }
        
    }];
    
    
}



-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
    
    if ([self.category_id isEqualToString:@"8888"]) {
      
         [self GetHomeGuessLikeNetworkData];
        
    }else{
        
         [self GetHomePlistCateNetworkData];
        
    }
    
    
}


#pragma mark 猜你喜欢

-(void)GetHomeGuessLikeNetworkData{
    
     self.RefreshCount = 1;
                  
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsGuessLike];
         
     NSString * iPhoneIDFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
     NSDictionary * dict = @{@"device_type":@"IDFA",@"device_value":iPhoneIDFA,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                        
       [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
                
           NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
       
           [self.homeListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
           
           self.RefreshCount ++;
           
           [self.collectionView.mj_header endRefreshing];
           
           [self.collectionView reloadData];
          
       } failure:^(NSError *error, id responseCache) {
              
            NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
            
            [self.homeListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                
            [self.collectionView.mj_header endRefreshing];
           
            [self.collectionView reloadData];

       }];

    
}


-(void)GetHomeGuessLikeNetMoreData{
    
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsGuessLike];
         
     NSString * iPhoneIDFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
     NSDictionary * dict = @{@"device_type":@"IDFA",@"device_value":iPhoneIDFA,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                        
       [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
                
           NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
       
           [self.homeListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
           
           self.RefreshCount ++;
           
           [self.collectionView.mj_footer endRefreshing];
           
           [self.collectionView reloadData];
          
       } failure:^(NSError *error, id responseCache) {
              
            NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
            
            [self.homeListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                
            [self.collectionView reloadData];

       }];

    
}



#pragma mark 获取其他类目数据

-(void)GetHomePlistCateNetworkData{
    
    self.RefreshCount = 1;
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsItems];
         
    NSDictionary * dict = @{@"mall_id":@"1",@"category_id":self.category_id,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                        
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
                
        NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
       
        [self.homeListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
        
        self.RefreshCount ++;
        
        [self.collectionView.mj_header endRefreshing];
           
        [self.collectionView reloadData];
          
    } failure:^(NSError *error, id responseCache) {
              
        NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
            
        [self.homeListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                
        [self.collectionView reloadData];

    }];
    
    
}

-(void)GetHomePlistCateNetMoreData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsItems];
         
    NSDictionary * dict = @{@"mall_id":@"1",@"category_id":self.category_id,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                        
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
                
        NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
       
        [self.homeListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
        
        self.RefreshCount ++;
        
        [self.collectionView.mj_footer endRefreshing];
           
        [self.collectionView reloadData];
          
    } failure:^(NSError *error, id responseCache) {
              
        NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
            
        [self.homeListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                
        [self.collectionView reloadData];

    }];
    
    
}

#pragma mark <UICollectionViewDataSource>

//相当tableview的几个区，

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
     return 1;
  
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
     return self.homeListArray.count;
   
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HomeMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeMainCollectionViewCell" forIndexPath:indexPath];
    
    cell.Model = self.homeListArray[indexPath.item];

    return cell;

}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
    HomeVc.mall_id = self.homeListArray[indexPath.item].mall_id;
    HomeVc.item_id = self.homeListArray[indexPath.item].item_id;
    HomeVc.activity_id = self.homeListArray[indexPath.item].activity_id;
    [self.navigationController pushViewController:HomeVc animated:YES];
    
}



#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{


     return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.36);
     

}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
        return (CGSize){YYScreenWidth,8};
    
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


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0;
}


#pragma mark <DZNEmptyDataSetSource>

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    
     return nil;
    
}



@end

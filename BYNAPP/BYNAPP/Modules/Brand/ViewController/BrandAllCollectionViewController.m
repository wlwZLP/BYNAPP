//
//  LiveAllCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandAllCollectionViewController.h"
#import "BrandTopCollectionViewCell.h"
#import "BrandRecomdCollectionViewCell.h"
#import "BrandRechargeCollectionViewController.h"
#import "BrandMainModel.h"
#import "BrandModel.h"
#import "BrandTopTwoCollectionViewCell.h"
#import "BrandListCollectionViewController.h"
#import "BrandCouponCollectionViewController.h"
#import "BrandCardCollectionViewCell.h"

@interface BrandAllCollectionViewController ()

@property(nonatomic,strong)NSArray<BrandModel*> *  BrandArray;

@property(nonatomic,strong)NSMutableArray<BrandMainModel*> *  RecommendsArray;

@end

@implementation BrandAllCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.RecommendsArray = [NSMutableArray array];

    [self.collectionView registerClass:[BrandTopCollectionViewCell class] forCellWithReuseIdentifier:@"BrandTopCollectionViewCell"];
    
    [self.collectionView registerClass:[BrandTopTwoCollectionViewCell class] forCellWithReuseIdentifier:@"BrandTopTwoCollectionViewCell"];
    
    [self.collectionView registerClass:[BrandCardCollectionViewCell class] forCellWithReuseIdentifier:@"BrandCardCollectionViewCell"];
    
    [self.collectionView registerClass:[BrandRecomdCollectionViewCell class] forCellWithReuseIdentifier:@"BrandRecomdCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
    
    [self GetHomeGoodsDetailsNetData];
    
}

-(void)GetHomeGoodsDetailsNetData{
    
    dispatch_group_t group = dispatch_group_create();
    
    [self loadPartOne:group];
    
    [self loadPartTwo:group];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        [self.collectionView reloadData];
      
    });
    
    
}

-(void)loadPartOne:(dispatch_group_t)group{
    
     dispatch_group_enter(group);
    
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVHome];
                   
     [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
         
          NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
        
          NSDictionary * brands = EncodeDicFromDic(DataDic, @"brands");
         
          NSArray * DataArray = EncodeArrayFromDic(brands, @"contents");
            
          self.BrandArray = [NSArray modelArrayWithClass:[BrandModel class] json:DataArray];

          dispatch_group_leave(group);
         
     } failure:^(NSError *error, id responseCache) {
      
          NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
         
          NSDictionary * brands = EncodeDicFromDic(DataDic, @"brands");
          
          NSArray * DataArray = EncodeArrayFromDic(brands, @"contents");
         
          self.BrandArray = [NSArray modelArrayWithClass:[BrandModel class] json:DataArray];
         
          dispatch_group_leave(group);
        
     }];
         

}


-(void)loadPartTwo:(dispatch_group_t)group{
    
     dispatch_group_enter(group);
    
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVRecommends];
                   
     NSDictionary * dict = @{@"is_coupon":@"1"};
    
     [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
      
          NSArray * DataArray = EncodeArrayFromDic(responseObject, @"data");
         
          YYNSLog(@"热门推荐数据------%@",DataArray);
                
          self.RecommendsArray = [[NSArray modelArrayWithClass:[BrandMainModel class] json:DataArray] mutableCopy];
     
          dispatch_group_leave(group);
         
     } failure:^(NSError *error, id responseCache) {
       
          NSArray * DataArray = EncodeArrayFromDic(responseCache, @"data");
         
          self.RecommendsArray = [[NSArray modelArrayWithClass:[BrandMainModel class] json:DataArray] mutableCopy];
         
          dispatch_group_leave(group);
        
     }];
    
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 2;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
       if (self.BrandArray.count == 0) {
            return 0;
        }else{
            return 1;
        }
    }else{
        return self.RecommendsArray.count;
    }
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if (self.BrandArray.count > 15) {
            
            BrandTopTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandTopTwoCollectionViewCell" forIndexPath:indexPath];
                 
            cell.BrandListArray = self.BrandArray;
            
            cell.BrandGridBtnBlockClick = ^(NSInteger GridIndex) {
                
                BrandListCollectionViewController * ListVc = [[BrandListCollectionViewController alloc]init];
                ListVc.Bid_id = self.BrandArray[GridIndex].brand_id;
                ListVc.title =self.BrandArray[GridIndex].name;
                [self.navigationController pushViewController:ListVc animated:YES];
                
            };
                 
            return cell;
            
        }else{
            
            BrandTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandTopCollectionViewCell" forIndexPath:indexPath];
                 
            cell.BrandListArray = self.BrandArray;
            
            cell.BrandGridBtnBlockClick = ^(NSInteger GridIndex) {
                
                BrandListCollectionViewController * ListVc = [[BrandListCollectionViewController alloc]init];
                ListVc.Bid_id = self.BrandArray[GridIndex].brand_id;
                ListVc.title =self.BrandArray[GridIndex].name;
                [self.navigationController pushViewController:ListVc animated:YES];
                
            };
                 
            return cell;
            
        }
        
    }else{
        
        if ([self.RecommendsArray[indexPath.item].coupon_type isEqualToString:@"1"] ||[self.RecommendsArray[indexPath.item].coupon_type isEqualToString:@"3"]) {
            
            BrandCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandCardCollectionViewCell" forIndexPath:indexPath];
               
            cell.Model = self.RecommendsArray[indexPath.item];

            return cell;
        
        }else{
            
            BrandRecomdCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandRecomdCollectionViewCell" forIndexPath:indexPath];
               
            cell.Model = self.RecommendsArray[indexPath.item];

            return cell;
            
        }
        
   
    }
   
    
}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BrandMainModel * Model = self.RecommendsArray[indexPath.item];
    if ([Model.coupon_type isEqualToString:@"2"]) {
        
        BrandCouponCollectionViewController * BrandVc = [[BrandCouponCollectionViewController alloc]init];
        BrandVc.title = Model.coupon_name;
        BrandVc.Details_id = Model.brand_id;
        BrandVc.mall_id = Model.mall_id;
        [self.navigationController pushViewController:BrandVc animated:YES];
        
    } else {
        
        BrandRechargeCollectionViewController * BrandVc = [[BrandRechargeCollectionViewController alloc]init];
        BrandVc.title = Model.coupon_name;
        BrandVc.Details_id = Model.brand_id;
        BrandVc.mall_id = Model.mall_id;
        [self.navigationController pushViewController:BrandVc animated:YES];
        
    }
    
   
}



#pragma mark <UICollectionViewDelegate>


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        if (self.BrandArray.count <=5) {
             return CGSizeMake(YYScreenWidth , 100);
        }else if ( self.BrandArray.count >5 && self.BrandArray.count <= 10){
             return CGSizeMake(YYScreenWidth , 200);
        }else{
            return CGSizeMake(YYScreenWidth , 320);
        }
       
    }else{
        
        return CGSizeMake(YYScreenWidth , 108);
    }
    
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return (CGSize){YYScreenWidth,0};
    }
    return (CGSize){YYScreenWidth,50};
    
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
        
        UILabel * TitleLabel = [[UILabel alloc]init];
        TitleLabel.text = @"为你推荐";
        TitleLabel.textColor = YY22Color;
        TitleLabel.frame = CGRectMake(12, 17, 100, 25);
        TitleLabel.textAlignment = NSTextAlignmentLeft;
        TitleLabel.font = [UIFont systemFontOfSize:18 weight:1];
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


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
       return 0;
    
}







@end

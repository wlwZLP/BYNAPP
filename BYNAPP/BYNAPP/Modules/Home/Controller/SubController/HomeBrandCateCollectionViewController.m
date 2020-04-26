//
//  HomeBrandCateCollectionViewController.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/26.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeBrandCateCollectionViewController.h"
#import "BrandOtherCollectionViewController.h"
#import "BrandRecomdCollectionViewCell.h"
#import "BrandCardCollectionViewCell.h"
#import "BrandModel.h"
#import "BrandRechargeCollectionViewController.h"
#import "BrandCouponCollectionViewController.h"


@interface HomeBrandCateCollectionViewController ()

@property(nonatomic,strong)NSArray<BrandMainModel*> *  BrandArray;


@end

@implementation HomeBrandCateCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    [self.collectionView registerClass:[BrandRecomdCollectionViewCell class] forCellWithReuseIdentifier:@"BrandRecomdCollectionViewCell"];
    
    [self.collectionView registerClass:[BrandCardCollectionViewCell class] forCellWithReuseIdentifier:@"BrandCardCollectionViewCell"];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    
    [self GetBrandOtherNetData];
    
}

#pragma mark <UICollectionViewDataSource>

-(void)GetBrandOtherNetData{
   
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVCategoryProducts];
    
    NSDictionary * dict = @{@"cid":self.Brand_id,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                  
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
    
        NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
        
        NSArray * DataArray = EncodeArrayFromDic(DataDic, @"data");
    
        self.BrandArray = [[NSArray modelArrayWithClass:[BrandMainModel class] json:DataArray] mutableCopy];
        
        [self.collectionView reloadData];
        
    } failure:^(NSError *error, id responseCache) {
     
        NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
            
        NSArray * DataArray = EncodeArrayFromDic(DataDic, @"data");
        
        self.BrandArray = [[NSArray modelArrayWithClass:[BrandMainModel class] json:DataArray] mutableCopy];
            
        [self.collectionView reloadData];
       
    }];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

      return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

      return self.BrandArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.BrandArray[indexPath.item].coupon_type isEqualToString:@"1"] ||[self.BrandArray[indexPath.item].coupon_type isEqualToString:@"3"]) {
        
        BrandCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandCardCollectionViewCell" forIndexPath:indexPath];
           
        cell.Model = self.BrandArray[indexPath.item];

        return cell;
    
    }else{
        
        BrandRecomdCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandRecomdCollectionViewCell" forIndexPath:indexPath];
           
        cell.Model = self.BrandArray[indexPath.item];

        return cell;
        
    }
    
    
}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BrandMainModel * Model = self.BrandArray[indexPath.item];
    
    if ([Model.coupon_type isEqualToString:@"2"] || [Model.coupon_type isEqualToString:@"4"]) {
        
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
  
    if ([self.BrandArray[indexPath.item].coupon_type isEqualToString:@"1"] ||[self.BrandArray[indexPath.item].coupon_type isEqualToString:@"3"]) {
        return CGSizeMake(YYScreenWidth , 92);
    }else{
        return CGSizeMake(YYScreenWidth , 112);
    }
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
       return (CGSize){0,0};
  
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
       return (CGSize){0,0};
    
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

@end

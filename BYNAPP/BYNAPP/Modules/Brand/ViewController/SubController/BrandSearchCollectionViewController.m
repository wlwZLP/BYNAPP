//
//  BrandSearchCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/20.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandSearchCollectionViewController.h"
#import "BrandSearchTopCollectionViewCell.h"
#import "BrandSearchDataCollectionViewCell.h"
#import "BrandCouponCollectionViewController.h"
#import "BrandSearchModel.h"

@interface BrandSearchCollectionViewController ()

@property(nonatomic,strong)NSArray * brandTopArray;

@property(nonatomic,strong)NSArray <BrandSearchModel*> * BrandDataArray;

@end

@implementation BrandSearchCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO animated:nil];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[BrandSearchTopCollectionViewCell class] forCellWithReuseIdentifier:@"BrandSearchTopCollectionViewCell"];
    
    [self.collectionView registerClass:[BrandSearchDataCollectionViewCell class] forCellWithReuseIdentifier:@"BrandSearchDataCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetBrandSearchNetWorkData:@"肯德基"];
    
}


-(void)GetBrandSearchNetWorkData:(NSString *)SearchTitle{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVSearch];
    
    NSDictionary * dict = @{@"keyword":SearchTitle,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                       
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
       
        NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
        
        YYNSLog(@"搜索结果数据-----------%@",Data);
        
        self.brandTopArray =  [NSArray modelArrayWithClass:[BrandSearchModel class] json:EncodeArrayFromDic(Data, @"brands")];
        
        self.BrandDataArray =  [NSArray modelArrayWithClass:[BrandSearchModel class] json:EncodeArrayFromDic(Data, @"data")];
        
        [self.collectionView reloadData];
               
    } failure:^(NSError *error, id responseCache) {
        
         NSDictionary * Data = EncodeDicFromDic(responseCache, @"data");
            
         self.brandTopArray =  [NSArray modelArrayWithClass:[BrandSearchModel class] json:EncodeArrayFromDic(Data, @"brands")];
         
         self.BrandDataArray =  [NSArray modelArrayWithClass:[BrandSearchModel class] json:EncodeArrayFromDic(Data, @"data")];
      
         [self.collectionView reloadData];
   
    }];
    
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

      return 2;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return self.brandTopArray.count;
    }else{
        return self.BrandDataArray.count;
    }

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        BrandSearchTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandSearchTopCollectionViewCell" forIndexPath:indexPath];
         
        return cell;
        
    }else{
        
        BrandSearchDataCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandSearchDataCollectionViewCell" forIndexPath:indexPath];

        cell.Model = self.BrandDataArray[indexPath.item];
         
        return cell;
        
    }

}


#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BrandSearchModel * Model = self.BrandDataArray[indexPath.item];
    BrandCouponCollectionViewController * DetailsVc = [[BrandCouponCollectionViewController alloc]init];
    DetailsVc.Details_id = Model.Brand_id;
    DetailsVc.mall_id = Model.mall_id;
    DetailsVc.title = Model.coupon_name;
    [self.navigationController pushViewController:DetailsVc animated:YES];
    
}



#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
      
        return CGSizeMake((YYScreenWidth - 32)/2 , (YYScreenWidth - 32)/4);
        
    }else{
        
        return CGSizeMake(YYScreenWidth - 12 , (YYScreenWidth - 12) * 0.28);
        
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
    
      return UIEdgeInsetsMake(10, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0;
}

@end

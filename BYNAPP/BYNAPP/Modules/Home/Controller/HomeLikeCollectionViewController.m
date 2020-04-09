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
#import "HomeDetailsCollectionViewController.h"

@interface HomeLikeCollectionViewController ()

@property(nonatomic,strong)HomeMainViewModel * ViewModel;

@end

@implementation HomeLikeCollectionViewController


- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = YYBGColor;
 
    [self.collectionView registerClass:[HomeMainCollectionViewCell class] forCellWithReuseIdentifier:@"HomeMainCollectionViewCell"];
     
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetHomeLikeNetworkData];
  
}


-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
    
}





-(void)GetHomeLikeNetworkData{
    
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsItems];
                  
       NSDictionary * dict = @{@"mall_id":@"1",@"category_id":self.HomeID};
                        
       [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
                
           NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
       
           self.ListDataArray = [NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")];
           
           [self.collectionView reloadData];
          
       } failure:^(NSError *error, id responseCache) {
              
            NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
            
            self.ListDataArray = [NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")];
                
            [self.collectionView reloadData];
          

       }];

    
}


#pragma mark <UICollectionViewDataSource>


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HomeMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeMainCollectionViewCell" forIndexPath:indexPath];

    return cell;

}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
    
    HomeVc.title = @"商品详情";
    
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



@end

//
//  MYCollectCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MYCollectCollectionViewController.h"
#import "CollectCollectionViewCell.h"
#import "MyCollectModel.h"

@interface MYCollectCollectionViewController ()

@property(nonatomic,strong)NSArray<MyCollectModel*> * ListArray;

@end

@implementation MYCollectCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = YYBGColor;

    [self.collectionView registerClass:[CollectCollectionViewCell class] forCellWithReuseIdentifier:@"CollectCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetMyCollectNetworkData];
    
    
}

#pragma mark 获取其他类目数据

-(void)GetMyCollectNetworkData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserCollects];
         
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
                
        NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
        
        self.ListArray = [NSArray modelArrayWithClass:[MyCollectModel class] json:EncodeArrayFromDic(DataDic, @"data")];
            
        [self.collectionView reloadData];
          
    } failure:^(NSError *error, id responseCache) {
              
         NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
           
         self.ListArray = [NSArray modelArrayWithClass:[MyCollectModel class] json:EncodeArrayFromDic(DataDic, @"data")];
               
          [self.collectionView reloadData];

     }];
    
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.ListArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectCollectionViewCell" forIndexPath:indexPath];
    
     cell.Model = self.ListArray[indexPath.item];
    
     return cell;
    
}


#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
    HomeVc.mall_id = self.ListArray[indexPath.item].mall_id;
    HomeVc.item_id = self.ListArray[indexPath.item].item_id;
    HomeVc.activity_id = self.ListArray[indexPath.item].collect_id;
    [self.navigationController pushViewController:HomeVc animated:YES];
    
}


#pragma mark <UICollectionViewDelegate>


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake(YYScreenWidth , 100);
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
       return (CGSize){YYScreenWidth,10};
    
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
      return 10;
}

@end

//
//  MyOrderCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyOrderCollectionViewController.h"
#import "MyOrderTopCollectionViewCell.h"
#import "MyOrderXiaCollectionViewCell.h"
#import "OrderListCollectionViewController.h"

@interface MyOrderCollectionViewController ()

@end

@implementation MyOrderCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = YYBGColor;
    

    [self.collectionView registerClass:[MyOrderTopCollectionViewCell class] forCellWithReuseIdentifier:@"MyOrderTopCollectionViewCell"];
    
    [self.collectionView registerClass:[MyOrderXiaCollectionViewCell class] forCellWithReuseIdentifier:@"MyOrderXiaCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
     return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == 0) {
        
         MyOrderTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyOrderTopCollectionViewCell" forIndexPath:indexPath];
        
        cell.MyOrderBtnBlockClick = ^(NSInteger TagIndex) {
        
            OrderListCollectionViewController * listVc = [[OrderListCollectionViewController alloc]init];
            listVc.title =@"订单列表";
            listVc.OrderType = [NSString stringWithFormat:@"%ld",TagIndex];
            listVc.mode = self.UserType;
            [self.navigationController pushViewController:listVc animated:YES];
            
        };
           
        return cell;
        
    } else {
        
         MyOrderXiaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyOrderXiaCollectionViewCell" forIndexPath:indexPath];
        
        cell.MyOrderBtnBlockClick = ^(NSInteger TagIndex) {
            
            OrderListCollectionViewController * listVc = [[OrderListCollectionViewController alloc]init];
            listVc.title =@"订单列表";
            listVc.OrderType = [NSString stringWithFormat:@"%ld",TagIndex];
            listVc.mode = self.UserType;
            [self.navigationController pushViewController:listVc animated:YES];
            
        };
           
         return cell;
    }
    
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake(YYScreenWidth , 117);
   
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


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0;
}




@end

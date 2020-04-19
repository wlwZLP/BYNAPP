//
//  TaobaoCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "TaobaoCollectionViewController.h"
#import "TaoBaoCollectionViewCell.h"
#import "SetBottomCollectionViewCell.h"

@interface TaobaoCollectionViewController ()



@end

@implementation TaobaoCollectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[TaoBaoCollectionViewCell class] forCellWithReuseIdentifier:@"TaoBaoCollectionViewCell"];
    
    [self.collectionView registerClass:[SetBottomCollectionViewCell class] forCellWithReuseIdentifier:@"SetBottomCollectionViewCell"];
  
    [self.collectionView reloadData];
    
   
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
        
        TaoBaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TaoBaoCollectionViewCell" forIndexPath:indexPath];
        
    
         
        return cell;
        
    }else{
        
        
        SetBottomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SetBottomCollectionViewCell" forIndexPath:indexPath];
                
        cell.TitString = @"确定";
        
        cell.BottomMainBtnBlockClick = ^{
          
             [self YYShowAlertViewTitle:@"退出登录"];
            
        };
        
        return cell;
        
    }
    
}

#pragma mark 确定

-(void)YYShowAlertTitleClick{
    
   
    
    
}




#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.item == 0){
          return CGSizeMake(YYScreenWidth , 130);
    }else{
          return CGSizeMake(YYScreenWidth , 65);
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

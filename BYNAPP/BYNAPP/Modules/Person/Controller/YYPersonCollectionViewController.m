//
//  YYPersonViewController.m
//  BYNAPP
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYPersonCollectionViewController.h"
#import "PersonHeaderCollectionViewCell.h"
#import "PersonTeamCollectionViewCell.h"
#import "PersonToolsCollectionViewCell.h"
#import "PersonMainCollectionViewCell.h"
@interface YYPersonCollectionViewController ()

@end

@implementation YYPersonCollectionViewController



- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    self.collectionView.frame = CGRectMake(0, -YYStatusHeight, YYScreenWidth, YYScreenHeight + YYStatusHeight);
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
      
    [self.collectionView registerClass:[PersonHeaderCollectionViewCell class] forCellWithReuseIdentifier:@"PersonHeaderCollectionViewCell"];
    
    [self.collectionView registerClass:[PersonTeamCollectionViewCell class] forCellWithReuseIdentifier:@"PersonTeamCollectionViewCell"];
    
    [self.collectionView registerClass:[PersonToolsCollectionViewCell class] forCellWithReuseIdentifier:@"PersonToolsCollectionViewCell"];
    
    [self.collectionView registerClass:[PersonMainCollectionViewCell class] forCellWithReuseIdentifier:@"PersonMainCollectionViewCell"];
     
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    

    
    [self GetHomeLikeNetworkData];
  
}


-(void)GetHomeLikeNetworkData{
    
     
    [self.collectionView reloadData];
          
    
    

    
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 4;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (section == 3) {
        return 4;
    }
     return 1;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        PersonHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PersonHeaderCollectionViewCell" forIndexPath:indexPath];

         return cell;
        
    }else if (indexPath.section ==1){
        
        PersonTeamCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PersonTeamCollectionViewCell" forIndexPath:indexPath];
        
        cell.LeftBtnBlockClick = ^{
           
              NSLog(@"1");
             
          };
        
          cell.LeftCenterBtnBlockClick = ^{
            
               NSLog(@"2");
              
          };
        
          cell.RightCenterBtnBlockClick = ^{
            
               NSLog(@"3");
              
          };
        
           cell.RightBtnBlockClick = ^{
            
               NSLog(@"4");
              
           };


         return cell;
        
    }else if (indexPath.section ==2){
        
        PersonToolsCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PersonToolsCollectionViewCell" forIndexPath:indexPath];
       
         cell.LeftBtnBlockClick = ^{
           
              NSLog(@"1");
             
          };
        
          cell.LeftCenterBtnBlockClick = ^{
            
               NSLog(@"2");
              
          };
        
          cell.RightCenterBtnBlockClick = ^{
            
               NSLog(@"3");
              
          };
        
           cell.RightBtnBlockClick = ^{
            
               NSLog(@"4");
              
           };
        
          return cell;
        
    }else{
        
        PersonMainCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PersonMainCollectionViewCell" forIndexPath:indexPath];

        return cell;
        
    }
     

}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.section == 0) {
          return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.52 + 65);
    }else if (indexPath.section == 1){
          return CGSizeMake(YYScreenWidth , 72);
    }else if (indexPath.section == 2){
          return CGSizeMake(YYScreenWidth , 130);
    }else{
          return CGSizeMake(YYScreenWidth , 50);
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


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0;
}



@end

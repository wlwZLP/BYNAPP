//
//  MyReportCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyReportCollectionViewController.h"
#import "ReportCollectionViewCell.h"
#import "YYReportHeadView.h"
#import "MyIncomeCollectionViewController.h"

@interface MyReportCollectionViewController ()


@property(nonatomic,strong)YYReportHeadView * ReportHeadView;


@end

@implementation MyReportCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self YYSetRightNavTitle:@"收益明细" target:self action:@selector(RightRecordButtonClick)];
    
    [self.collectionView registerClass:[ReportCollectionViewCell class] forCellWithReuseIdentifier:@"ReportCollectionViewCell"];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
}


#pragma mark 收益明细
-(void)RightRecordButtonClick{
    
    MyIncomeCollectionViewController * IncomeVc = [[MyIncomeCollectionViewController alloc]init];
    IncomeVc.title = @"收益明细";
    [self.navigationController pushViewController:IncomeVc animated:YES];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
     return 4;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ReportCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ReportCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
    
}



#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake(YYScreenWidth , 125);
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
     return (CGSize){YYScreenWidth,225};
    
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
        
        [headerView addSubview:self.ReportHeadView];
     
        return headerView;
    
    }
    
    return nil;
    
}

/**
 *  @return ReportHeadView
 */
-(YYReportHeadView *)ReportHeadView
{
    
    if (_ReportHeadView == nil) {
        
       _ReportHeadView = [[YYReportHeadView alloc] initWithFrame:CGRectMake(0, 0 , YYScreenWidth , 225)];
        
     }
    
    return _ReportHeadView;
    
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

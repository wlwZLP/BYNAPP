//
//  WithdrawCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyWithdrawCollectionViewController.h"
#import "WithdrawCollectionViewCell.h"
#import "MyWithTopCollectionViewCell.h"
#import "SetBottomCollectionViewCell.h"
#import "WithRecordCollectionViewController.h"
#import "YYOrderHeadView.h"

@interface MyWithdrawCollectionViewController ()

@property(nonatomic,strong)YYOrderHeadView * WithHeadView;

@property(nonatomic,strong)NSString * RecordType;

@end

@implementation MyWithdrawCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.RecordType = @"1";
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[MyWithTopCollectionViewCell class] forCellWithReuseIdentifier:@"MyWithTopCollectionViewCell"];
    
    [self.collectionView registerClass:[WithdrawCollectionViewCell class] forCellWithReuseIdentifier:@"WithdrawCollectionViewCell"];
    
    [self.collectionView registerClass:[SetBottomCollectionViewCell class] forCellWithReuseIdentifier:@"SetBottomCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
//    [self YYSetRightNavTitle:@"提现记录" target:self action:@selector(RightWithdrawClick)];
    
}




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
      return 3;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == 0) {
        
        MyWithTopCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyWithTopCollectionViewCell" forIndexPath:indexPath];
        
        cell.MyRecordBtnBlockClick = ^{
           
            WithRecordCollectionViewController * ListVc = [[WithRecordCollectionViewController alloc]init];
            ListVc.title = @"提现记录";
            ListVc.RecordType = self.RecordType;
            [self.navigationController pushViewController:ListVc animated:YES];
            
        };
           
        return cell;
        
    }else if (indexPath.item == 1){
        
        WithdrawCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WithdrawCollectionViewCell" forIndexPath:indexPath];
           
        return cell;
        
    }else{
        
       SetBottomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SetBottomCollectionViewCell" forIndexPath:indexPath];
        
        cell.TitString = @"提现";
        
        cell.BottomMainBtnBlockClick = ^{
            
            [self YYShowAlertViewTitle:@"提现"];
            
        };
           
        return cell;
        
    }
    
     
    
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item == 0) {
       return CGSizeMake(YYScreenWidth , 150);
    }else if (indexPath.item == 1){
       return CGSizeMake(YYScreenWidth , 260);
    }else{
       return CGSizeMake(YYScreenWidth , 45);
    }
     
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
       return (CGSize){YYScreenWidth, 45};
    
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
        
        [headerView addSubview:self.WithHeadView];
        
     
        return headerView;
    
    }
    
    return nil;
    
}

/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
-(YYOrderHeadView *)WithHeadView
{
    
    if (_WithHeadView == nil) {
        
        _WithHeadView = [[YYOrderHeadView alloc] initWithFrame:CGRectMake(0, 0 , YYScreenWidth , 45)];
        
        _WithHeadView.backgroundColor = UIColor.whiteColor;
        
        _WithHeadView.TitleArray = [[NSArray alloc]initWithObjects:@"佣金",@"会员费",nil ];
        
        _WithHeadView.TitleBtnBlockClick = ^(NSInteger TagIndex) {
        
         
            
        };
        
     }
    
    return _WithHeadView;
    
}


#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
      return UIEdgeInsetsMake(10, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 10;
    
}




@end

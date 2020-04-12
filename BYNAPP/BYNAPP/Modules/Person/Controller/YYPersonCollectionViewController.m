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
#import "SetCollectionViewController.h"
#import "MyOrderCollectionViewController.h"
#import "MyCouponCollectionViewController.h"
#import "MyTeamCollectionViewController.h"
#import "MYCollectCollectionViewController.h"
#import "MyTraceCollectionViewController.h"
#import "MyNewCollectionViewController.h"
#import "MyInvitCollectionViewController.h"
#import "MyVipCollectionViewController.h"
#import "MyCustomCollectionViewController.h"
#import "MyReportCollectionViewController.h"
#import "WithdrawCollectionViewController.h"

@interface YYPersonCollectionViewController ()

@property(nonatomic,strong)NSArray * ImgArray;

@property(nonatomic,strong)NSArray * TitleArray;

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
    
  
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self GetHomeLikeNetworkData];
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
    
    [super viewWillAppear:animated];
    
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
        
         cell.TopMoneyBtnBlockClick = ^{
            
            MyReportCollectionViewController * SetVc = [[MyReportCollectionViewController alloc]init];
            SetVc.title = @"我的报表";
            [self.navigationController pushViewController:SetVc animated:YES];
             
         };
         
         cell.TopSetBtnBlockClick = ^{
            
             SetCollectionViewController * SetVc = [[SetCollectionViewController alloc]init];
             SetVc.title = @"个人信息";
             [self.navigationController pushViewController:SetVc animated:YES];
         
         };
        
        cell.TopWithdrawBtnBlockClick = ^{
            WithdrawCollectionViewController * SetVc = [[WithdrawCollectionViewController alloc]init];
            SetVc.title = @"提现";
            [self.navigationController pushViewController:SetVc animated:YES];
        };
        
         return cell;
        
    }else if (indexPath.section ==1){
        
        PersonTeamCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PersonTeamCollectionViewCell" forIndexPath:indexPath];
        
          cell.LeftBtnBlockClick = ^{
           
              MyOrderCollectionViewController * MyVc = [[MyOrderCollectionViewController alloc]init];
              MyVc.title = @"我的订单";
              [self.navigationController pushViewController:MyVc animated:YES];
             
          };
        
          cell.LeftCenterBtnBlockClick = ^{
            
               MyOrderCollectionViewController * SetVc = [[MyOrderCollectionViewController alloc]init];
               SetVc.title = @"团队订单";
               [self.navigationController pushViewController:SetVc animated:YES];
              
          };
        
          cell.RightCenterBtnBlockClick = ^{
            
               MyCouponCollectionViewController * SetVc = [[MyCouponCollectionViewController alloc]init];
               SetVc.title = @"我的卡券";
               [self.navigationController pushViewController:SetVc animated:YES];
              
          };
        
           cell.RightBtnBlockClick = ^{
            
               MyTeamCollectionViewController * SetVc = [[MyTeamCollectionViewController alloc]init];
               SetVc.title = @"我的团队";
               [self.navigationController pushViewController:SetVc animated:YES];
              
           };


         return cell;
        
    }else if (indexPath.section ==2){
        
        PersonToolsCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PersonToolsCollectionViewCell" forIndexPath:indexPath];
       
         cell.LeftBtnBlockClick = ^{
           
              MYCollectCollectionViewController * SetVc = [[MYCollectCollectionViewController alloc]init];
              SetVc.title = @"我的收藏";
              [self.navigationController pushViewController:SetVc animated:YES];
             
          };
        
          cell.LeftCenterBtnBlockClick = ^{
            
               MyTraceCollectionViewController * SetVc = [[MyTraceCollectionViewController alloc]init];
               SetVc.title = @"我的足迹";
               [self.navigationController pushViewController:SetVc animated:YES];
              
          };
        
          cell.RightCenterBtnBlockClick = ^{
            
               MyNewCollectionViewController * SetVc = [[MyNewCollectionViewController alloc]init];
               SetVc.title = @"新人必看";
               [self.navigationController pushViewController:SetVc animated:YES];
              
          };
        
           cell.RightBtnBlockClick = ^{
            
               MyInvitCollectionViewController * SetVc = [[MyInvitCollectionViewController alloc]init];
               SetVc.title = @"邀请好友";
               [self.navigationController pushViewController:SetVc animated:YES];
              
           };
        
          return cell;
        
    }else{
        
        
        PersonMainCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PersonMainCollectionViewCell" forIndexPath:indexPath];
        
        NSArray * CellImgArray = [[NSArray alloc]initWithObjects:@"Vip",@"custom",@"invitation",@"version",nil ];
        
        NSArray * CellTitleArray = [[NSArray alloc]initWithObjects:@"会员中心",@"召唤客服",@"邀请人微信",@"检查版本",nil];
        
        cell.LeftImg.image = [UIImage imageNamed:CellImgArray[indexPath.item]];
        
        cell.Leftlabel.text = CellTitleArray[indexPath.item];
        
        cell.LeftBtn.tag = indexPath.item;
        
        cell.TopRowBtnBlockClick = ^(NSInteger TagIndex) {
          
            [self PersonPushToViewController:TagIndex];
            
        };

        return cell;
        
    }
     

}
#pragma mark 最后一区间点击事件
-(void)PersonPushToViewController:(NSInteger)rowIndex{
    
    if (rowIndex == 0) {
       
        MyVipCollectionViewController * SetVc = [[MyVipCollectionViewController alloc]init];
        SetVc.title = @"会员中心";
        [self.navigationController pushViewController:SetVc animated:YES];
        
    }else if (rowIndex == 1){
        
        MyCustomCollectionViewController * SetVc = [[MyCustomCollectionViewController alloc]init];
        SetVc.title = @"召唤客服";
        [self.navigationController pushViewController:SetVc animated:YES];

        
    }else if (rowIndex == 2){
     
       
        
        
    }else if (rowIndex == 3){
        
       
        
    }
    
    
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.section == 0) {
          return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.52 + 70);
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

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
#import "MyWithdrawCollectionViewController.h"
#import "ReportModel.h"

@interface MyReportCollectionViewController ()

@property(nonatomic,strong)YYReportHeadView * ReportHeadView;

@property(nonatomic,strong)NSArray<ReportModel*> * OrderListAttay;

@property(nonatomic,strong)NSArray<ReportModel*> * PlusListAttay;

@property(nonatomic,strong)NSDictionary * DataDic;

@end

@implementation MyReportCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self YYSetRightNavTitle:@"收益明细" target:self action:@selector(RightRecordButtonClick)];
    
    [self.collectionView registerClass:[ReportCollectionViewCell class] forCellWithReuseIdentifier:@"ReportCollectionViewCell"];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetMyReportControllNetworkData];
    
}


#pragma mark 获取当前界面网络数据

-(void)GetMyReportControllNetworkData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVUserReport];
         
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
                
        self.DataDic = EncodeDicFromDic(responseObject, @"data");
        
        self.OrderListAttay = [NSArray modelArrayWithClass:[ReportModel class] json:EncodeArrayFromDic(self.DataDic, @"order_data")];
        
        self.PlusListAttay = [NSArray modelArrayWithClass:[ReportModel class] json:EncodeArrayFromDic(self.DataDic, @"plus_data")];
    
        YYNSLog(@"我的数据报表-------%@",self.DataDic);
        
        [self.collectionView reloadData];
          
    } failure:^(NSError *error, id responseCache) {

         self.OrderListAttay = [NSArray modelArrayWithClass:[ReportModel class] json:EncodeArrayFromDic(EncodeDicFromDic(responseCache, @"data"), @"order_data")];
         
         self.PlusListAttay = [NSArray modelArrayWithClass:[ReportModel class] json:EncodeArrayFromDic(EncodeDicFromDic(responseCache, @"data"), @"plus_data")];
        
          [self.collectionView reloadData];

     }];
    
    
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
    
     return 2;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     ReportCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ReportCollectionViewCell" forIndexPath:indexPath];
    
     if (indexPath.item == 0) {
        cell.DataArray = self.OrderListAttay;
        cell.TitleLabel.text = @"佣金收益（预估收益于次月28日进行结算）";
     }else{
        cell.DataArray = self.PlusListAttay;
        cell.TitleLabel.text = @"会员费收益（预估收益于7天后进行结算）";
     }
    
      return cell;
    
}



#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake(YYScreenWidth , 210);
   
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
        
        self.ReportHeadView.WithdrawBtnBlockClick = ^{
           
            MyWithdrawCollectionViewController * RecordVc = [[MyWithdrawCollectionViewController alloc]init];
            RecordVc.title =@"提现";
            [self.navigationController pushViewController:RecordVc animated:YES];
            
        };
        
        self.ReportHeadView.TopLabel.text = EncodeStringFromDic(self.DataDic, @"balance_amount");
        
        self.ReportHeadView.LeftLabel.text = EncodeStringFromDic(self.DataDic, @"total_pre_amount");
        
        self.ReportHeadView.CenterLabel.text = EncodeStringFromDic(self.DataDic, @"withdraw_amount");
        
        self.ReportHeadView.RightLabel.text = EncodeStringFromDic(self.DataDic, @"un_settle_amount");
     
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
    
      return UIEdgeInsetsMake(10, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
      return 10;
    
}






@end

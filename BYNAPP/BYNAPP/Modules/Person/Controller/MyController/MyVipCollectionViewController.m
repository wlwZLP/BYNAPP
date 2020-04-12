//
//  MyVipCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyVipCollectionViewController.h"
#import "ReportCollectionViewCell.h"
#import "YYReportHeadView.h"
#import "MyIncomeCollectionViewController.h"
#import "WithdrawCollectionViewController.h"


@interface MyVipCollectionViewController ()


@property(nonatomic,strong)YYReportHeadView * ReportHeadView;


@end

@implementation MyVipCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self CreateVIPTopNavView];
    //导航栏主题 title文字属性
    self.collectionView.frame = CGRectMake(0, YYBarHeight + 56, YYScreenWidth, YYScreenHeight - YYBarHeight - 56);
    
    [self.collectionView registerClass:[ReportCollectionViewCell class] forCellWithReuseIdentifier:@"ReportCollectionViewCell"];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES;
    
}

#pragma mark 创建头部控件
-(void)CreateVIPTopNavView{
    
   UIView * TopNavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YYScreenWidth, YYBarHeight )];
    TopNavView.backgroundColor = UIColor.blackColor;
   [self.view addSubview:TopNavView];
//   [TopNavView.layer addSublayer:[YYTools SetGradLayerView:TopNavView FromColor:@"#303030" ToColor:@"#303030"]];
   
   UIButton * BackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   [BackBtn setImage:[UIImage imageNamed:@"LeftBack"] forState:UIControlStateNormal];
   [BackBtn setImage:[UIImage imageNamed:@"LeftBack"] forState:UIControlStateHighlighted];
   [BackBtn sizeToFit];
   BackBtn.frame = CGRectMake(15, YYStatusHeight + 11, 10, 17);
   [BackBtn addTarget:self action:@selector(VipLeftBackClick) forControlEvents:UIControlEventTouchUpInside];
   [TopNavView addSubview:BackBtn];
   
   UILabel * Titlelabel = [[UILabel alloc] init];
   Titlelabel.frame = CGRectMake((YYScreenWidth -200)/2,YYStatusHeight + 10 ,200,24);
   Titlelabel.numberOfLines = 0;
   Titlelabel.text= @"会员中心";
   Titlelabel.font = [UIFont fontWithName:@"PangMenZhengDao" size:22.f];
   Titlelabel.textAlignment = NSTextAlignmentCenter;
   Titlelabel.textColor = UIColor.whiteColor;
   [TopNavView addSubview:Titlelabel];
    
    
    
}

#pragma mark 收益明细
-(void)VipLeftBackClick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
           
            WithdrawCollectionViewController * RecordVc = [[WithdrawCollectionViewController alloc]init];
            RecordVc.title =@"提现";
            [self.navigationController pushViewController:RecordVc animated:YES];
            
        };
     
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

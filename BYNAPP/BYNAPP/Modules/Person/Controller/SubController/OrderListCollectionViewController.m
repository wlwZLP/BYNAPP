//
//  OrderDetailsCollectionViewController.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/12.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "OrderListCollectionViewController.h"
#import "OrderDetailsCollectionViewCell.h"
#import "YYOrderHeadView.h"
#import "OrderListModel.h"

@interface OrderListCollectionViewController ()

@property(nonatomic,strong)YYOrderHeadView * OederHeadView;

@property(nonatomic,strong)NSString  * status;

@property(nonatomic,strong)NSMutableArray<OrderListModel*> * OrderListArray;


@end

@implementation OrderListCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.OrderListArray = [NSMutableArray array];
    
    self.status = @"0";
    
    [self.collectionView registerClass:[OrderDetailsCollectionViewCell class] forCellWithReuseIdentifier:@"OrderDetailsCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetMyCollectNetworkData];
    
    
}

#pragma mark 获取当前界面网络数据

-(void)GetMyCollectNetworkData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserMPVOrders];
         
    NSDictionary * dict = @{@"type":self.OrderType,@"mode":self.mode,@"status":self.status,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
    
    [self.OrderListArray removeAllObjects];
    
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
            
        NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
            
        [self.OrderListArray addObjectsFromArray:[NSArray modelArrayWithClass:[OrderListModel class] json:EncodeArrayFromDic(Data, @"data")]];
        
        [self.collectionView reloadData];
        
        
     } failure:^(NSError *error, id responseCache) {
              
      

     }];
    
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
      return self.OrderListArray.count;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
      OrderDetailsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OrderDetailsCollectionViewCell" forIndexPath:indexPath];
    
      cell.Model = self.OrderListArray[indexPath.item];
    
      return cell;
    
    
}


#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake(YYScreenWidth , 160);
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
       return (CGSize){YYScreenWidth,40};
    
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
        
        [headerView addSubview:self.OederHeadView];
        
     
        return headerView;
    
    }
    
    return nil;
    
}

/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
- (YYOrderHeadView *)OederHeadView
{
    
    if (_OederHeadView== nil) {
        
       _OederHeadView = [[YYOrderHeadView alloc] initWithFrame:CGRectMake(0, 0 , YYScreenWidth , 40)];
        
        _OederHeadView.TitleArray = [[NSArray alloc]initWithObjects:@"全部",@"待结算",@"已结算",@"已失败",nil ];
        
        _OederHeadView.backgroundColor = UIColor.whiteColor;
         
        YYWeakSelf(self);
        
        _OederHeadView.TitleBtnBlockClick = ^(NSInteger TagIndex) {
            
            weakself.status = [NSString stringWithFormat:@"%ld",TagIndex];
            
            [weakself GetMyCollectNetworkData];
  
        };
     
     }
    
    return _OederHeadView;
    
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

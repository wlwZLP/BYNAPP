//
//  MyCouponCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyCouponCollectionViewController.h"
#import "CouponCollectionViewCell.h"
#import "YYOrderHeadView.h"
#import "CouponDetailsCollectionViewController.h"
#import "PersonCouponModel.h"
#import "CouponDetailsCollectionViewController.h"

@interface MyCouponCollectionViewController ()

@property(nonatomic,strong)YYOrderHeadView * HeadView;

@property(nonatomic,strong)NSMutableArray<PersonCouponModel*> * CouponListArray;

@property(nonatomic,strong)NSString * OrderStatus;

@end

@implementation MyCouponCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.OrderStatus = @"";
    
    self.collectionView.backgroundColor = YYBGColor;
    
    self.CouponListArray = [NSMutableArray array];
    
    [self.collectionView registerClass:[CouponCollectionViewCell class] forCellWithReuseIdentifier:@"CouponCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetMyCollectNetworkData];
    
    
    
}



#pragma mark 获取当前界面网络数据

-(void)GetMyCollectNetworkData{
    
    [self.CouponListArray removeAllObjects];
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVOerders];
    
    NSDictionary * Dict;
    
    if (self.OrderStatus.length == 0) {
        Dict = @{@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
    }else{
        Dict = @{@"status":self.OrderStatus,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
    }
    
    [PPNetworkTools GET:url parameters:Dict success:^(id responseObject) {
                
        NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
        
        [self.CouponListArray addObjectsFromArray:[NSArray modelArrayWithClass:[PersonCouponModel class] json:EncodeArrayFromDic(Data, @"data")]];
    
        [self.collectionView reloadData];
        
          
     } failure:^(NSError *error, id responseCache) {
              
      

     }];
    
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
      return self.CouponListArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
      CouponCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CouponCollectionViewCell" forIndexPath:indexPath];
    
      cell.Model = self.CouponListArray[indexPath.item];
     
      YYWeakSelf(self);
    
      cell.CouponListBtnBlockClick = ^(NSString * _Nonnull Title) {
        
           [weakself SetCellBtnClick:Title ClickIndex:indexPath.item];
          
      };
    
      return cell;
    
}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
        
}




#pragma mark ===============按钮请求=============

-(void)SetCellBtnClick:(NSString*)TitleString ClickIndex:(NSInteger)ClickIndex{
    
     PersonCouponModel * Model = self.CouponListArray[ClickIndex];

    if ([TitleString isEqualToString:@"查看卡券"]) {
        
       CouponDetailsCollectionViewController * CouponVc = [[CouponDetailsCollectionViewController alloc]init];
       CouponVc.CouponType = @"1";
       CouponVc.title = @"查看卡券";
       [self.navigationController pushViewController:CouponVc animated:YES];

        
    }else if ([TitleString isEqualToString:@"取消订单"]){
        
        
       NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVOerdersCancel];
       
       NSDictionary * Dict = @{@"order_no":Model.order_no};
     
       [PPNetworkTools POST:url parameters:Dict success:^(id responseObject) {
                   
            NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
     
            [self GetMyCollectNetworkData];
           
             
        } failure:^(NSError *error, id responseCache) {
                 
         

        }];
        
    }else if ([TitleString isEqualToString:@"立即支付"]){
        
       
        
    }
    

}


#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake(YYScreenWidth , (YYScreenWidth -24) * 0.38 );
   
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
        
        [headerView addSubview:self.HeadView];
        
     
        return headerView;
    
    }
    
    return nil;
    
}



/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
- (YYOrderHeadView *)HeadView
{
    
    if (_HeadView== nil) {
        
       _HeadView = [[YYOrderHeadView alloc] initWithFrame:CGRectMake(0, 0 , YYScreenWidth , 40)];
        
        _HeadView.backgroundColor = UIColor.whiteColor;
        
        _HeadView.TitleArray = [[NSArray alloc]initWithObjects:@"全部",@"待支付",@"发货中",@"已成功",@"已失败",nil ];
        
        YYWeakSelf(self);
        
        _HeadView.TitleBtnBlockClick = ^(NSInteger TagIndex) {
            
            if (TagIndex == 0) {
                weakself.OrderStatus = @"";
            }else if (TagIndex == 1){
                weakself.OrderStatus = @"0";
            }else if (TagIndex == 2){
                weakself.OrderStatus = @"3";
            }else if (TagIndex == 3){
                weakself.OrderStatus = @"2";
            }else if (TagIndex == 4){
                weakself.OrderStatus = @"1";
            }
            [weakself GetMyCollectNetworkData];
        };
     
     }
    
    return _HeadView;
    
}


#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
      return UIEdgeInsetsMake(6, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0;
    
}



@end

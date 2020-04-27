//
//  PDDCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "PDDCollectionViewController.h"
#import "YYOrderHeadView.h"
#import "HomeMainCollectionViewCell.h"

@interface PDDCollectionViewController ()

@property(nonatomic,strong)YYOrderHeadView * PDDHeadView;

@property(nonatomic,strong)NSString * activity_type;


@end

@implementation PDDCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.activity_type = @"1";
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[HomeMainCollectionViewCell class] forCellWithReuseIdentifier:@"HomeMainCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    self.collectionView.mj_header = [LPRefreshGifHeader headerWithRefreshingBlock:^{
            
           [self GetSelfViewControllerNetworkData];
            
    }];
    
    self.collectionView.mj_footer = [LPRefreshFooter footerWithRefreshingBlock:^{
        
          [self GetSelfViewControllerNetwMoreData];
        
     }];
    
    [self GetSelfViewControllerNetworkData];
    
}



#pragma mark 网络请求数据

-(void)GetSelfViewControllerNetworkData{
    
      self.RefreshCount = 1;
    
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsItems];
         
     NSDictionary * dict = @{@"mall_id":@"3",@"activity_type":self.activity_type,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                        
       [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
                
           NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
           
           self.RefreshCount ++ ;
           
           [self.MainListArray removeAllObjects];
           
           [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                   
           [self.collectionView.mj_header endRefreshing];
           
           [self.collectionView reloadData];
        
          
       } failure:^(NSError *error, id responseCache) {
              
            NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
           
            [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                   
            [self.collectionView reloadData];
           

       }];

    
}

-(void)GetSelfViewControllerNetwMoreData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsItems];
        
    NSDictionary * dict = @{@"mall_id":@"3",@"activity_type":self.activity_type,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                       
      [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
               
            NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
          
            self.RefreshCount ++ ;
          
            [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
          
            [self.collectionView.mj_footer endRefreshing];
                  
            [self.collectionView reloadData];
       
         
      } failure:^(NSError *error, id responseCache) {
             
           NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
          
           [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                  
           [self.collectionView reloadData];
          

      }];
    
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
      return self.MainListArray.count;
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
      HomeMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeMainCollectionViewCell" forIndexPath:indexPath];
    
      cell.Model = self.MainListArray[indexPath.item];
    
      return cell;
    
}



#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
    HomeVc.mall_id = self.MainListArray[indexPath.item].mall_id;
    HomeVc.item_id = self.MainListArray[indexPath.item].item_id;
    HomeVc.activity_id = self.MainListArray[indexPath.item].activity_id;
    [self.navigationController pushViewController:HomeVc animated:YES];
    
    
}

#pragma mark <UICollectionViewDelegate>


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.36);
   
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
        
        [headerView addSubview:self.PDDHeadView];
        
     
        return headerView;
    
    }
    
    return nil;
    
}

/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
- (YYOrderHeadView *)PDDHeadView
{
    
    if (_PDDHeadView == nil) {
        
       _PDDHeadView = [[YYOrderHeadView alloc] initWithFrame:CGRectMake(0, 0 , YYScreenWidth , 40)];
        
        _PDDHeadView.backgroundColor = UIColor.whiteColor;
        
        _PDDHeadView.TitleArray = [[NSArray alloc]initWithObjects:@"推荐",@"今日爆款",@"1.9包邮",@"品牌清仓",nil ];
        
        YYWeakSelf(self);
        
        _PDDHeadView.TitleBtnBlockClick = ^(NSInteger TagIndex) {
            
            if (TagIndex == 0) {
                weakself.activity_type = @"1";
            }else if (TagIndex == 1){
                weakself.activity_type = @"31";
            }else if (TagIndex == 2){
                weakself.activity_type = @"30";
            }else if (TagIndex == 3){
                weakself.activity_type = @"32";
            }
            [weakself GetSelfViewControllerNetworkData];
            
            
        };
     
     }
    
    return _PDDHeadView;
    
}



#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
      return UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0.5;
    
}



@end

//
//  JingDCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/15.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "JingDCollectionViewController.h"
#import "YYPDDHeadView.h"
#import "HomeMainCollectionViewCell.h"


@interface JingDCollectionViewController ()

@property(nonatomic,strong)YYPDDHeadView * PDDHeadView;

@end

@implementation JingDCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[HomeMainCollectionViewCell class] forCellWithReuseIdentifier:@"HomeMainCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [self GetSelfViewControllerNetworkData];
    
}

#pragma mark 网络请求数据

-(void)GetSelfViewControllerNetworkData{
    
                  
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsItems];
         
     NSDictionary * dict = @{@"mall_id":@"4",@"activity_type":@"1",@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                        
       [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
                
           NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
           
           YYNSLog(@"猜你喜欢数据----%@",responseObject);
            [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                   
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
-(YYPDDHeadView *)PDDHeadView
{
    
    if (_PDDHeadView == nil) {
        
       _PDDHeadView = [[YYPDDHeadView alloc] initWithFrame:CGRectMake(0, 0 , YYScreenWidth , 45)];
        
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

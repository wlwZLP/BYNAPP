//
//  MyTraceCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyTraceCollectionViewController.h"
#import "TraceCollectionViewCell.h"
#import "MyCollectModel.h"

@interface MyTraceCollectionViewController ()

@property(nonatomic,strong)NSDictionary * TraceData;

@property(nonatomic,strong)NSArray<MyCollectModel*> * TraceListArray;

@property(nonatomic,strong)NSArray   * TitleArray;

@end

@implementation MyTraceCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[TraceCollectionViewCell class] forCellWithReuseIdentifier:@"TraceCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetMyCollectNetworkData];
    
}


#pragma mark 获取其他类目数据

-(void)GetMyCollectNetworkData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserBrowsers];
         
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
                
        NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
        
        self.TraceData = EncodeDicFromDic(DataDic, @"data");
        
        self.TitleArray = self.TraceData.allKeys;
            
        [self.collectionView reloadData];
          
    } failure:^(NSError *error, id responseCache) {
              
         NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
           
         self.TraceData = EncodeDicFromDic(DataDic, @"data");
         
         self.TitleArray = self.TraceData.allKeys;
               
          [self.collectionView reloadData];

     }];
    
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return self.TitleArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [NSArray modelArrayWithClass:[MyCollectModel class] json:EncodeArrayFromDic(self.TraceData, self.TraceData.allKeys[section])].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
      TraceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TraceCollectionViewCell" forIndexPath:indexPath];
    
      cell.Model = [NSArray modelArrayWithClass:[MyCollectModel class] json:EncodeArrayFromDic(self.TraceData, self.TraceData.allKeys[indexPath.section])][indexPath.item];
    
      return cell;

}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectModel * Model =  [NSArray modelArrayWithClass:[MyCollectModel class] json:EncodeArrayFromDic(self.TraceData, self.TraceData.allKeys[indexPath.section])][indexPath.item];
    HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
    HomeVc.mall_id = Model.item_type;
    HomeVc.item_id = Model.item_id;
    HomeVc.activity_id = Model.collect_id;
    [self.navigationController pushViewController:HomeVc animated:YES];
    
}



#pragma mark <UICollectionViewDelegate>


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake((YYScreenWidth - 36) / 3, (YYScreenWidth - 36) / 3 + 45);
   
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
        
        UILabel * TitleLabel = [[UILabel alloc]init];
        TitleLabel.text = self.TraceData.allKeys[indexPath.section];
        TitleLabel.textColor = YY66Color;
        TitleLabel.frame = CGRectMake(10 , 15, YYScreenWidth - 20, 20);
        TitleLabel.textAlignment = NSTextAlignmentCenter;
        TitleLabel.font = [UIFont systemFontOfSize:16 weight:0];
        [headerView addSubview:TitleLabel];
     
        return headerView;
    
    }
    
    return nil;
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
      return UIEdgeInsetsMake(10, 12, 0, 12);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
       return 6;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
       return 6;

}

@end

//
//  MyTeamCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyTeamCollectionViewController.h"
#import "YYTeamHeadView.h"
#import "TeamCollectionViewCell.h"
#import "MyTeamModel.h"

@interface MyTeamCollectionViewController ()

@property(nonatomic,strong)YYTeamHeadView * TeamHeadView;

@property(nonatomic,strong)NSArray <MyTeamModel*> * TeamListArray;

@end

@implementation MyTeamCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.collectionView registerClass:[TeamCollectionViewCell class] forCellWithReuseIdentifier:@"TeamCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetMyTeamControllNetworkData];
    
}

#pragma mark 获取当前界面网络数据

-(void)GetMyTeamControllNetworkData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVUserTeam];
         
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
                
        NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
    
        self.TeamListArray = [NSArray modelArrayWithClass:[MyTeamModel class] json:EncodeArrayFromDic(DataDic, @"data")];
        
        [self.collectionView reloadData];
          
    } failure:^(NSError *error, id responseCache) {
              
         NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");

         self.TeamListArray = [NSArray modelArrayWithClass:[MyTeamModel class] json:EncodeArrayFromDic(DataDic, @"data")];
     
          [self.collectionView reloadData];

     }];
    
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.TeamListArray.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     TeamCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TeamCollectionViewCell" forIndexPath:indexPath];
    
      cell.Model = self.TeamListArray[indexPath.item];
    
      return cell;
    
}

#pragma mark <UICollectionViewDelegate>


#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake(YYScreenWidth , 45);
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
       return (CGSize){YYScreenWidth, 145};
    
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
        
        [headerView addSubview:self.TeamHeadView];
        
     
        return headerView;
    
    }
    
    return nil;
    
}

/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
-(YYTeamHeadView *)TeamHeadView
{
    
    if (_TeamHeadView == nil) {
        
       _TeamHeadView = [[YYTeamHeadView alloc] initWithFrame:CGRectMake(0, 0 , YYScreenWidth , 145)];
        
     }
    
    return _TeamHeadView;
    
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

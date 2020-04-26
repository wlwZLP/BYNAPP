//
//  WithRecordCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "WithRecordCollectionViewController.h"
#import "WithRecordCollectionViewCell.h"


@interface WithRecordCollectionViewController ()

@property(nonatomic,strong)NSMutableArray * RecordListArray;

@end

@implementation WithRecordCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.RecordListArray = [NSMutableArray array];
    
    [self.collectionView registerClass:[WithRecordCollectionViewCell class] forCellWithReuseIdentifier:@"WithRecordCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetPersonRecordNetWordData];
    
    
}

-(void)GetPersonRecordNetWordData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVUserTxrecs];
    
    NSDictionary * dict = @{@"type":self.RecordType,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
         
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
            
          NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
          
          [self.RecordListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(Data, @"Data")]];
        
          [self.collectionView reloadData];
          
    } failure:^(NSError *error, id responseCache) {
              
        
          [self.collectionView reloadData];

    }];

    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
     return self.RecordListArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
      WithRecordCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WithRecordCollectionViewCell" forIndexPath:indexPath];
    
      return cell;
    
}



#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake(YYScreenWidth , 75);
   
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

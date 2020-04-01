//
//  HomeLikeCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeLikeCollectionViewController.h"
#import "HomeMainCollectionViewCell.h"

@interface HomeLikeCollectionViewController ()

@end

@implementation HomeLikeCollectionViewController


- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
 
    [self.collectionView registerClass:[HomeMainCollectionViewCell class] forCellWithReuseIdentifier:@"HomeMainCollectionViewCell"];
    
    
    [self GetHomeLikeNetworkData];
  
}


-(void)GetHomeLikeNetworkData{
    

     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsItems];
    
     NSDictionary * dict = @{@"mall_id":@"1",@"category_id":self.HomeID};
                      
     [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
              
         NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
     
         self.ListDataArray = [NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")];
         
         
         [self.collectionView reloadData];
         YYNSLog(@"获取类目数据----%@",responseObject);
        
    } failure:^(NSError *error) {
              
             
       
    }];
    
    
    
    
}


#pragma mark <UICollectionViewDataSource>


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HomeMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeMainCollectionViewCell" forIndexPath:indexPath];

    return cell;

}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{


     return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.36);
     

}


@end

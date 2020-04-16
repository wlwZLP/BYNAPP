//
//  MyVipCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyVipCollectionViewController.h"
#import "MyVipImgCollectionViewCell.h"
#import "MyVipGridCollectionViewCell.h"

@interface MyVipCollectionViewController ()





@end

@implementation MyVipCollectionViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
       
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor blackColor]]  forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:18]}];

    [self.collectionView registerClass:[MyVipImgCollectionViewCell class] forCellWithReuseIdentifier:@"MyVipImgCollectionViewCell"];
    
    [self.collectionView registerClass:[MyVipGridCollectionViewCell class] forCellWithReuseIdentifier:@"MyVipGridCollectionViewCell"];
    
    self.collectionView.backgroundColor = YYBGColor;
    
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetMyVipControllerNetData];
    
}




-(void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]  forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :YY33Color, NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    
}


-(void)viewWillAppear:(BOOL)animated{
    

    
}

#pragma mark 获取当前界面网络数据

-(void)GetMyVipControllerNetData{
    
   NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVCommon];
        
   [PPNetworkTools POST:url parameters:nil success:^(id responseObject) {
               
       NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
       
       YYNSLog(@"会员中心数据------%@",responseObject);
       
 
         
   } failure:^(NSError *error, id responseCache) {
             
     

    }];
    
    

}



#pragma mark 收益明细
-(void)VipLeftBackClick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
     return 1;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        MyVipImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyVipImgCollectionViewCell" forIndexPath:indexPath];
        
        [cell.MainImgView setImage:[UIImage imageNamed:@"NoVipBg"]];
           
        return cell;
        
    }else{
       
        MyVipGridCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyVipGridCollectionViewCell" forIndexPath:indexPath];
           
        return cell;
        
    }
   
    
}



#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
 
     return CGSizeMake(YYScreenWidth , YYScreenWidth);
    
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
     return (CGSize){YYScreenWidth, 0};
    
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

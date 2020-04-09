//
//  BrandDetailsCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandDetailsCollectionViewController.h"
#import "DetailsTopCollectionViewCell.h"
#import "DetailsNumCollectionViewCell.h"
#import "DetailsNotesCollectionViewCell.h"

@interface BrandDetailsCollectionViewController ()

@end

@implementation BrandDetailsCollectionViewController

;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.frame = CGRectMake(0, 0, YYScreenWidth, YYScreenHeight - YYTabBarHeight);
    
    self.collectionView.backgroundColor = YYBGColor;
 
    [self.collectionView registerClass:[DetailsTopCollectionViewCell class] forCellWithReuseIdentifier:@"DetailsTopCollectionViewCell"];
    
    [self.collectionView registerClass:[DetailsNumCollectionViewCell class] forCellWithReuseIdentifier:@"DetailsNumCollectionViewCell"];
    
    [self.collectionView registerClass:[DetailsNotesCollectionViewCell class] forCellWithReuseIdentifier:@"DetailsNotesCollectionViewCell"];
    
    [self CreateBrandDetailsBottomView];
    
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == 0) {
        
        DetailsTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailsTopCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
        
        
    }else if (indexPath.item == 1){
        
        DetailsNumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailsNumCollectionViewCell" forIndexPath:indexPath];
        
       return cell;
        
        
    }else{
        
        DetailsNotesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailsNotesCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
        
        
    }
    

    
}


#pragma mark <UICollectionViewDelegate>


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    if (indexPath.item == 0) {
        
        return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.62 +100);
        
    }else if (indexPath.item == 1){
       
        return CGSizeMake(YYScreenWidth , 112);
        
    }else{
       
        return CGSizeMake(YYScreenWidth , 152);
        
    }
        
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


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

      return 0;

}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
     return 0;

}


#pragma mark 创建地下立即购买按钮


-(void)CreateBrandDetailsBottomView{
    
    
    UIView * BottomView = [[UIView alloc]initWithFrame:CGRectMake(0, YYScreenHeight - YYTabBarHeight - YYBarHeight, YYScreenWidth, YYTabBarHeight)];
    BottomView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:BottomView];
    
    UIImageView * HomeImage = [[UIImageView alloc] init];
    HomeImage.backgroundColor = [UIColor clearColor];
    HomeImage.frame = CGRectMake(24, 18, 20, 20);
    HomeImage.image = [UIImage imageNamed:@"icon_tabbar_homepage"];
    [BottomView addSubview:HomeImage];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"首页";
    TitleLabel.frame = CGRectMake(22, 42, 24, 15);
    TitleLabel.textColor = YY33Color;
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.font = [UIFont systemFontOfSize:10 weight:0];
    [BottomView addSubview:TitleLabel];
    
    UIButton * BuyButton = [[UIButton alloc]init];
    BuyButton.backgroundColor = YYHexColor(@"#FFD409");
    if (YYTabBarHeight > 50) {
       BuyButton.frame = CGRectMake(63 , 18 , YYScreenWidth - 75, 40);
    }else{
       BuyButton.frame = CGRectMake(63 , 7 , YYScreenWidth - 75, 40);
    }
    [BuyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [BuyButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [BuyButton addTarget:self action:@selector(BottomBuyButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:BuyButton];
    [YYTools ChangeView:BuyButton RadiusSize:10 BorderColor:[UIColor clearColor]];
    
 
}


#pragma mark 立即购买商品

-(void)BottomBuyButtonClick{
    
    [self YYShowAlertViewTitle:@"点击购买"];
    
}




@end

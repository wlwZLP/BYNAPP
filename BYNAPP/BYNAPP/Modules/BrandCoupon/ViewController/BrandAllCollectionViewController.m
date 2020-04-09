//
//  LiveAllCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandAllCollectionViewController.h"
#import "BrandTopCollectionViewCell.h"
#import "BrandRecomdCollectionViewCell.h"
#import "BrandDetailsCollectionViewController.h"


@interface BrandAllCollectionViewController ()

@property(nonatomic,strong)NSArray * IconImgArray;

@end

@implementation BrandAllCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.IconImgArray = [[NSArray alloc]initWithObjects:@"banner01",@"banner02",@"banner03",@"banner01",@"banner02",@"banner01",@"banner03",@"banner01",@"banner02",@"banner01",nil ];

    [self.collectionView registerClass:[BrandTopCollectionViewCell class] forCellWithReuseIdentifier:@"BrandTopCollectionViewCell"];
    
    [self.collectionView registerClass:[BrandRecomdCollectionViewCell class] forCellWithReuseIdentifier:@"BrandRecomdCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }
    return 6;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        BrandTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandTopCollectionViewCell" forIndexPath:indexPath];
        
        cell.ListArray = self.IconImgArray;

        return cell;
        
        
    }else{
        
        BrandRecomdCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandRecomdCollectionViewCell" forIndexPath:indexPath];
               
        return cell;
        
    }
   
    
}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    BrandDetailsCollectionViewController * BrandVc = [[BrandDetailsCollectionViewController alloc]init];
    BrandVc.title = @"商品详情";
    [self.navigationController pushViewController:BrandVc animated:YES];
    
    
}


#pragma mark <UICollectionViewDelegate>


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        if (self.IconImgArray.count <=5) {
             return CGSizeMake(YYScreenWidth , 100);
        }else if ( self.IconImgArray.count >5 && self.IconImgArray.count <= 10){
             return CGSizeMake(YYScreenWidth , 200);
        }else{
            return CGSizeMake(YYScreenWidth , 320);
        }
       
    }else{
        
        return CGSizeMake(YYScreenWidth , 108);
    }
    
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return (CGSize){YYScreenWidth,0};
    }
    return (CGSize){YYScreenWidth,50};
    
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
        TitleLabel.text = @"为你推荐";
        TitleLabel.textColor = YY22Color;
        TitleLabel.frame = CGRectMake(12, 17, 100, 25);
        TitleLabel.textAlignment = NSTextAlignmentLeft;
        TitleLabel.font = [UIFont systemFontOfSize:18 weight:1];
        [headerView addSubview:TitleLabel];
     
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

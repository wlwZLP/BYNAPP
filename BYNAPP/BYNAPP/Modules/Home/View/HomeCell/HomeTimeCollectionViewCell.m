//
//  HomeTimeCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeTimeCollectionViewCell.h"
#import "SaleCollectionViewCell.h"

@interface HomeTimeCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong)UICollectionView * SaleCollectionView;

@end

@implementation HomeTimeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
        
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    UIView * MainBGView = UIView.new;
    MainBGView.backgroundColor = UIColor.whiteColor;
    MainBGView.frame = CGRectMake(0, 10, self.ZLP_width, self.ZLP_height - 10);
    [self addSubview:MainBGView];
    
    UILabel * TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"限时抢购";
    TitleLabel.textColor = YY22Color;
    TitleLabel.frame = CGRectMake(12, 16, 80, 20);
    TitleLabel.textAlignment = NSTextAlignmentLeft;
    TitleLabel.font = [UIFont systemFontOfSize:18 weight:0];
    [MainBGView addSubview:TitleLabel];
    
    
    [MainBGView addSubview:self.SaleCollectionView];
           
    self.SaleCollectionView.delegate = self;
           
    self.SaleCollectionView.dataSource = self;
           
    [self.SaleCollectionView registerClass:[SaleCollectionViewCell class] forCellWithReuseIdentifier:@"SaleCollectionViewCell"];
   

}



-(void)layoutSubviews{

    [self.SaleCollectionView reloadData];
    
  
}



/**
 *  懒加载collectionView
 *
 *  @return collectionView
 */
- (UICollectionView *)SaleCollectionView
{
    if (_SaleCollectionView == nil) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _SaleCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, self.ZLP_width , 160 ) collectionViewLayout:flowLayout];
        _SaleCollectionView.backgroundColor= UIColor.whiteColor;
        _SaleCollectionView.scrollsToTop = YES;
        _SaleCollectionView.showsHorizontalScrollIndicator = NO;
        _SaleCollectionView.showsVerticalScrollIndicator = NO;
        
    }
    
    return _SaleCollectionView;
}



#pragma mark ---- UIScrollViewDelegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    
}



#pragma mark ---- UICollectionViewDataSource

//相当tableview的几个区，

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
      return 1;
    
}


//相当tableview的对应每个区有几个行，几个ithme

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
     return 10;
    
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
     SaleCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SaleCollectionViewCell" forIndexPath:indexPath];
    
     return cell;
    
        
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
       return 0;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
      return (CGSize){0,0};
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
     return CGSizeMake(112 , 160);
  
}


#pragma mark ---- 解决iOS 8 上不能自动布局的问题

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}

#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, 8, 0, 8);//上左下右
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
      return 0;
    
}


@end

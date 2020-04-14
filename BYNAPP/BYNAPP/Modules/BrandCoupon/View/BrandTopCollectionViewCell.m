//
//  BrandTopCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandTopCollectionViewCell.h"
#import "BrandGridCollectionViewCell.h"

@interface BrandTopCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong)UICollectionView * GridCollectionView;


@end

@implementation BrandTopCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
      
        self.backgroundColor = [UIColor redColor];
        
        [self addSubview:self.GridCollectionView];
        
        self.GridCollectionView.delegate = self;
        
        self.GridCollectionView.dataSource = self;
        
        [self.GridCollectionView registerClass:[BrandGridCollectionViewCell class] forCellWithReuseIdentifier:@"BrandGridCollectionViewCell"];
       
    }
    
    return self;
    
}




-(void)setBrandListArray:(NSArray<BrandModel *> *)BrandListArray{
    
    _BrandListArray = BrandListArray;
    
    [self.GridCollectionView reloadData];
    
}



/**
 *  懒加载collectionView
 *
 *  @return collectionView
 */
- (UICollectionView *)GridCollectionView
{
    if (_GridCollectionView == nil) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _GridCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.ZLP_width , self.ZLP_height) collectionViewLayout:flowLayout];
        _GridCollectionView.backgroundColor= YYBGColor;
        _GridCollectionView.scrollsToTop = YES;
        _GridCollectionView.showsHorizontalScrollIndicator = NO;
        _GridCollectionView.showsVerticalScrollIndicator = NO;
        
    }
    
    return _GridCollectionView;
}


#pragma mark ---- UICollectionViewDataSource

//相当tableview的几个区，

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
      return 1;
    
}


//相当tableview的对应每个区有几个行，几个ithme

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
      return self.BrandListArray.count;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
     BrandGridCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandGridCollectionViewCell" forIndexPath:indexPath];
    
     cell.Model = self.BrandListArray[indexPath.item];
    
     return cell;
        
}



#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.BrandGridBtnBlockClick(indexPath.item);
    
    
}






- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
       return 0;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
      return (CGSize){0,0};
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
     return CGSizeMake(self.ZLP_width/5 , 100);
    
}


#pragma mark ---- 解决iOS 8 上不能自动布局的问题

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
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

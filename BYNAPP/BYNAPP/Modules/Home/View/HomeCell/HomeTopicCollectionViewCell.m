//
//  HomeTopicCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeTopicCollectionViewCell.h"
#import "ImgCollectionViewCell.h"

@interface HomeTopicCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong)UICollectionView * ImgCollectionView;


@end

@implementation HomeTopicCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.ImgCollectionView];
        
        self.ImgCollectionView.delegate = self;
        
        self.ImgCollectionView.dataSource = self;
        
        [self.ImgCollectionView registerClass:[ImgCollectionViewCell class] forCellWithReuseIdentifier:@"ImgCollectionViewCell"];
       

    }
    
    return self;
    
}



-(void)layoutSubviews{

    [self.ImgCollectionView reloadData];
    
  
}



/**
 *  懒加载collectionView
 *
 *  @return collectionView
 */
- (UICollectionView *)ImgCollectionView
{
    if (_ImgCollectionView == nil) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _ImgCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 10, self.ZLP_width , self.ZLP_height) collectionViewLayout:flowLayout];
        _ImgCollectionView.backgroundColor= [UIColor whiteColor];
        _ImgCollectionView.scrollsToTop = YES;
        _ImgCollectionView.showsHorizontalScrollIndicator = YES;
        _ImgCollectionView.showsVerticalScrollIndicator = YES;
        
    }
    
    return _ImgCollectionView;
}



#pragma mark ---- UIScrollViewDelegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    
    
}


-(void)setZonesListArray:(NSArray<HomeBannerModel *> *)ZonesListArray{
    
    _ZonesListArray = ZonesListArray;
    
    [self.ImgCollectionView reloadData];
    
}


#pragma mark ---- UICollectionViewDataSource

//相当tableview的几个区，

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
      return 1;
    
}


//相当tableview的对应每个区有几个行，几个ithme

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
     return self.ZonesListArray.count;
    
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
     ImgCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImgCollectionViewCell" forIndexPath:indexPath];
    
      [cell.MainImgView setImageURL:[NSURL URLWithString: self.ZonesListArray[indexPath.item].cover]];
    
      return cell;
        
}

#pragma mark -选中某item进行跳转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
     self.TopicBtnBlockClick(indexPath.item);

}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
      return (CGSize){0,0};
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    if (indexPath.item ==0) {
        return CGSizeMake(self.ZLP_width , 85);
    }else{
        return CGSizeMake(self.ZLP_width/2 -1 , 85);
    }
     
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


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
   
    return 5;
}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
   
    return 2;

}





@end

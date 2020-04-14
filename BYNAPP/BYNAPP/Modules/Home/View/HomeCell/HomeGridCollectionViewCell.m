//
//  HomeGridCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeGridCollectionViewCell.h"
#import "GridCollectionViewCell.h"

@interface HomeGridCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong)UICollectionView * GridCollectionView;

@property(nonatomic,strong)UIPageControl * GridPageControl;


@end

@implementation HomeGridCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
      
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.GridCollectionView];
        
        self.GridCollectionView.delegate = self;
        
        self.GridCollectionView.dataSource = self;
        
        [self.GridCollectionView registerClass:[GridCollectionViewCell class] forCellWithReuseIdentifier:@"GridCollectionViewCell"];
        
        [self addSubview:self.GridPageControl];
       
    }
    
    return self;
    
}



-(void)layoutSubviews{

    [self.GridCollectionView reloadData];
    
   
     self.GridPageControl.numberOfPages = 1;
    
   
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
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _GridCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.ZLP_width , 160 ) collectionViewLayout:flowLayout];
        _GridCollectionView.backgroundColor= UIColor.whiteColor;
        _GridCollectionView.scrollsToTop = YES;
        _GridCollectionView.showsHorizontalScrollIndicator = NO;
        _GridCollectionView.showsVerticalScrollIndicator = NO;
        
    }
    
    return _GridCollectionView;
}


/**
 *  懒加载collectionView
 *
 *  @return collectionView
 */
- (UIPageControl *)GridPageControl
{
    if (_GridPageControl == nil) {
        
        _GridPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.ZLP_width - 200, 160 , 200 , 10)];
        
        _GridPageControl.tag = 100;
        //设置选中的页数
        _GridPageControl.hidesForSinglePage = YES;
        //设置未选中点的颜色
      
        
    }
    
    return _GridPageControl;
}

#pragma mark ---- UIScrollViewDelegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    if (scrollView.contentOffset.x == 0) {
        
        self.GridPageControl.currentPage = 0;
        
    }else{
        
        self.GridPageControl.currentPage = 1;
        
    }
    
}



#pragma mark ---- UICollectionViewDataSource

//相当tableview的几个区，

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
      return 1;
    
}


//相当tableview的对应每个区有几个行，几个ithme

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
     return self.ChannelListArray.count;
    
}


-(void)setChannelListArray:(NSArray *)ChannelListArray{
    
    _ChannelListArray = ChannelListArray;

    [self.GridCollectionView reloadData];

}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    GridCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridCollectionViewCell" forIndexPath:indexPath];
    
    cell.Model = self.ChannelListArray[indexPath.item];

    return cell;
        
}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.GridBtnBlockClick(indexPath.item);
    
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
       return 0;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
      return (CGSize){0,0};
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
     return CGSizeMake(self.ZLP_width/5 , 80);
    
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

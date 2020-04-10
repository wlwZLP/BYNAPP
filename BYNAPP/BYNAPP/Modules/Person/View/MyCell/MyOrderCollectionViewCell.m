//
//  MyOrderCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyOrderCollectionViewCell.h"
#import "GridCollectionViewCell.h"


@interface MyOrderCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong)UICollectionView * GridCollectionView;


@end

@implementation MyOrderCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
      
        self.backgroundColor = YYBGColor;
        
        [self addSubview:self.GridCollectionView];
        
        self.GridCollectionView.delegate = self;
        
        self.GridCollectionView.dataSource = self;
        
        [self.GridCollectionView registerClass:[GridCollectionViewCell class] forCellWithReuseIdentifier:@"GridCollectionViewCell"];
        
        [self.GridCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
      
        [self.GridCollectionView reloadData];
        
        [YYTools ChangeView:self.GridCollectionView RadiusSize:5 BorderColor:[UIColor clearColor]];

    }
    
    return self;
    
}



-(void)layoutSubviews{

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
        _GridCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(12, 10, self.ZLP_width - 24 , self.ZLP_height -10) collectionViewLayout:flowLayout];
        _GridCollectionView.backgroundColor= UIColor.whiteColor;
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
    
       return 3;
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
      GridCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridCollectionViewCell" forIndexPath:indexPath];
     
      cell.backgroundColor = [UIColor clearColor];
    
      return cell;
        
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
      return CGSizeMake((self.ZLP_width -24)/5 , 70);
    
}


#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
       return (CGSize){self.ZLP_width,35};
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
      return (CGSize){YYScreenWidth,0};
    
}


// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *headerView = [self.GridCollectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerId" forIndexPath:indexPath];
        
        if(headerView == nil){
            headerView = [[UICollectionReusableView alloc] init];
        }
        
        headerView.backgroundColor = UIColor.whiteColor;
        
        UILabel * TitleLabel = [[UILabel alloc]init];
        TitleLabel.text = @"生活服务订单";
        TitleLabel.frame = CGRectMake(12, 7.5 , 150 , 21);
        TitleLabel.textColor = YY33Color;
        TitleLabel.textAlignment = NSTextAlignmentLeft;
        TitleLabel.font = [UIFont systemFontOfSize:15 weight:0];
        [headerView addSubview:TitleLabel];
        
        
        UIView * LLineView = UIView.new;
        LLineView.backgroundColor = YYE5Color;
        LLineView.frame = CGRectMake(0, 34 , self.ZLP_width , 0.5);
        [headerView addSubview:LLineView];
     
        return headerView;
    
    }
    
    return nil;
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
      return UIEdgeInsetsMake(0, 0, 10, 0);//上左下右
   
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
   
    return 0;

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0;
}



@end

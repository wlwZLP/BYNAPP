//
//  MyVipGridCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyVipGridCollectionViewCell.h"
#import "VipGridImgCollectionViewCell.h"
@interface MyVipGridCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView * GridCollectionView;

@end


@implementation MyVipGridCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
         self.backgroundColor = YYBGColor;
        
         UIImageView * Mainimage = [[UIImageView alloc] init];
         Mainimage.frame = CGRectMake(12, 0, self.ZLP_width - 24, 64);
         Mainimage.image = [UIImage imageNamed:@"celltop"];
         [self addSubview:Mainimage];
        
         UILabel * TitleLabel = [[UILabel alloc]init];
         TitleLabel.text = @"会员专享超200项特权";
         TitleLabel.frame = CGRectMake(24, 12, self.ZLP_width - 48 , 25);
         TitleLabel.textColor = YYHexColor(@"#FFDD39");
         TitleLabel.textAlignment = NSTextAlignmentLeft;
         TitleLabel.font = [UIFont systemFontOfSize:18 weight:0];
         [self addSubview:TitleLabel];
         
         UILabel * ContentLabel = [[UILabel alloc]init];
         ContentLabel.text = @"一省到底的品质生活";
         ContentLabel.frame = CGRectMake(24, 37 , self.ZLP_width - 48 , 25);
         ContentLabel.textColor = YYHexColor(@"#FFF6CA");
         ContentLabel.textAlignment = NSTextAlignmentLeft;
         ContentLabel.font = [UIFont systemFontOfSize:12 weight:0];
         [self addSubview:ContentLabel];
        
         [self addSubview:self.GridCollectionView];
         
         self.GridCollectionView.delegate = self;
         
         self.GridCollectionView.dataSource = self;
         
         [self.GridCollectionView registerClass:[VipGridImgCollectionViewCell class] forCellWithReuseIdentifier:@"VipGridImgCollectionViewCell"];
        
        
     }
    
    return self;
    
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
        _GridCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(12, 64 , self.ZLP_width - 24, self.ZLP_height - 64 ) collectionViewLayout:flowLayout];
        _GridCollectionView.backgroundColor= UIColor.whiteColor;
        _GridCollectionView.scrollsToTop = YES;
        _GridCollectionView.showsHorizontalScrollIndicator = NO;
        _GridCollectionView.showsVerticalScrollIndicator = NO;
        
    }
    
    return _GridCollectionView;
}

-(void)setImgListArray:(NSArray *)ImgListArray{
    
     _ImgListArray = ImgListArray;
    
     [self.GridCollectionView reloadData];
    
}


#pragma mark ---- UICollectionViewDataSource

//相当tableview的几个区，

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
      return 1;
    
}


//相当tableview的对应每个区有几个行，几个ithme

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
     return self.ImgListArray.count;
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
     VipGridImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VipGridImgCollectionViewCell" forIndexPath:indexPath];
    
     [cell.MainImgView sd_setImageWithURL:[NSURL URLWithString:self.ImgListArray[indexPath.item]]];
    
     return cell;
        
}



- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
       return 0;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
      return (CGSize){0,0};
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
     return CGSizeMake(self.ZLP_height/2 - 32 , YYScreenWidth * 0.66);
    
}


#pragma mark ---- 解决iOS 8 上不能自动布局的问题

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, YYScreenWidth * 0.1 , 0 , YYScreenWidth * 0.2);//上左下右
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
      return YYScreenWidth * 0.1;
    
}





@end

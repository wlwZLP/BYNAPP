//
//  YYUpdateView.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/27.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYUpdateView.h"
#import "UpdatetitleCollectionViewCell.h"

@interface YYUpdateView ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong)UICollectionView * TitleCollectionView;

@property(nonatomic,strong)UIView * MainBgView;



@end

@implementation YYUpdateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
   
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        
        [self CreateHeaderView];

    }
    
    return self;
}


-(void)CreateHeaderView{
    
    UIView * CenterView = [[UIView alloc]init];
    CenterView.frame = CGRectMake(YYScreenWidth/2 -156, YYScreenHeight * 0.2, 312, 469);
    CenterView.backgroundColor = UIColor.clearColor;
    [self addSubview:CenterView];
    [YYTools ChangeView:CenterView RadiusSize:8 BorderColor:[UIColor clearColor]];
    self.MainBgView =CenterView;
    
    
    UIImageView * MainImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0 , CenterView.ZLP_width, CenterView.ZLP_height)];
    MainImgView.image = [UIImage imageNamed:@"UpdataBg"];
    [CenterView addSubview:MainImgView];
    
    UIButton * DelBtn = [[UIButton alloc]init];
    DelBtn.frame = CGRectMake(275, 60 , 24, 24);
    [DelBtn setImage:[UIImage imageNamed:@"guanbi"] forState:UIControlStateNormal];
    [DelBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [DelBtn addTarget:self action:@selector(DelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [CenterView addSubview:DelBtn];
    
    
    [CenterView addSubview:self.TitleCollectionView];
    
    self.TitleCollectionView.delegate = self;
    
    self.TitleCollectionView.dataSource = self;
    
    [self.TitleCollectionView registerClass:[UpdatetitleCollectionViewCell class] forCellWithReuseIdentifier:@"UpdatetitleCollectionViewCell"];
    
    UIButton * OkBtn = UIButton.new;
    [OkBtn setTitle:@"立即升级" forState:UIControlStateNormal];
    OkBtn.frame = CGRectMake(20 , CenterView.ZLP_height - 60, CenterView.ZLP_width - 40, 44);
    OkBtn.backgroundColor = YYHexColor(@"#FFD409");
    [OkBtn addTarget:self action:@selector(OKButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [OkBtn setTitleColor:YY22Color forState:UIControlStateNormal];
    OkBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [CenterView addSubview:OkBtn];
    [YYTools ChangeView:OkBtn RadiusSize:15 BorderColor:[UIColor clearColor]];
    
    
}


/**
 *  懒加载collectionView
 *
 *  @return collectionView
 */
- (UICollectionView *)TitleCollectionView
{
    if (_TitleCollectionView == nil) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _TitleCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(20, 180, 280 , 220 ) collectionViewLayout:flowLayout];
        _TitleCollectionView.backgroundColor= UIColor.whiteColor;
        _TitleCollectionView.scrollsToTop = YES;
        _TitleCollectionView.showsHorizontalScrollIndicator = YES;
        _TitleCollectionView.showsVerticalScrollIndicator = YES;
        
    }
    
    return _TitleCollectionView;
}


-(void)DelButtonClick{
    
    [[LPAnimationView sharedMask] dismiss];
    
}


-(void)OKButtonClick{
    
    [[LPAnimationView sharedMask] dismiss];
    
}


-(void)layoutSubviews{

    [self.TitleCollectionView reloadData];
    

}

#pragma mark ---- UICollectionViewDataSource

//相当tableview的几个区，

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
      return 1;
    
}


//相当tableview的对应每个区有几个行，几个ithme

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
      return 4;
    
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     UpdatetitleCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UpdatetitleCollectionViewCell" forIndexPath:indexPath];
    
     return cell;
        
}


#pragma mark -选中某item进行跳转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
 
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
      return (CGSize){0,0};
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
     return CGSizeMake(280 , 50);
    
     
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

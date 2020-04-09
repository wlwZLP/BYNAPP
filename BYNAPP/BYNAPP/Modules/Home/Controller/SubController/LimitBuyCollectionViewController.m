//
//  LimitBuyCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "LimitBuyCollectionViewController.h"
#import "LimitBuyCollectionViewCell.h"

static int const TimelabelWith = 90;

@interface LimitBuyCollectionViewController ()

/** 用来存放所有时间的scrollView */
@property (nonatomic, strong) UIScrollView * TimeScrollView;

@end

@implementation LimitBuyCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self CreateLimitBuyTopnavView];
    
    self.collectionView.frame = CGRectMake(0, YYBarHeight + 56, YYScreenWidth, YYScreenHeight - YYBarHeight - 56);
    
    [self.collectionView registerClass:[LimitBuyCollectionViewCell class] forCellWithReuseIdentifier:@"LimitBuyCollectionViewCell"];
    

}

-(void)viewWillAppear:(BOOL)animated{
        
    [self.navigationController setNavigationBarHidden:YES animated:nil];
        
}

#pragma mark 创建头部控件
-(void)CreateLimitBuyTopnavView{
    
   UIView * TopNavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YYScreenWidth, YYBarHeight + 56)];
   TopNavView.backgroundColor = UIColor.yellowColor;
   [self.view addSubview:TopNavView];
   [TopNavView.layer addSublayer:[YYTools SetGradLayerView:TopNavView FromColor:@"#FFDD39" ToColor:@"#FFD117"]];
   
   UIButton * BackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   [BackBtn setImage:[UIImage imageNamed:@"Limitback"] forState:UIControlStateNormal];
   [BackBtn setImage:[UIImage imageNamed:@"Limitback"] forState:UIControlStateHighlighted];
   [BackBtn sizeToFit];
   BackBtn.frame = CGRectMake(15, YYStatusHeight + 11, 10, 17);
   [BackBtn addTarget:self action:@selector(LimitLeftBackClick) forControlEvents:UIControlEventTouchUpInside];
   [TopNavView addSubview:BackBtn];
   
   UILabel * Titlelabel = [[UILabel alloc] init];
   Titlelabel.frame = CGRectMake((YYScreenWidth -200)/2,YYStatusHeight + 10 ,200,24);
   Titlelabel.numberOfLines = 0;
   Titlelabel.text= @"限时抢购";
   Titlelabel.font = [UIFont fontWithName:@"PangMenZhengDao" size:22.f];
   Titlelabel.textAlignment = NSTextAlignmentCenter;
   Titlelabel.textColor = YY22Color;
   [TopNavView addSubview:Titlelabel];
    
   UIImageView * SearchImage = [[UIImageView alloc] init];
   SearchImage.backgroundColor = [UIColor clearColor];
    SearchImage.frame = CGRectMake(YYScreenWidth -31, YYStatusHeight + 13, 17 , 17);
   SearchImage.image = [UIImage imageNamed:@"yuanquan"];
   [TopNavView addSubview:SearchImage];
    
   [TopNavView addSubview:self.TimeScrollView];
    
    NSArray * TimeArray = [[NSArray alloc]initWithObjects:@"01:00",@"02:00",@"03:00",@"04:00",@"05:00",@"06:00",@"07:00",@"08:00",@"09:00",@"10:00",@"11:00",@"12:00",@"13:00",nil ];
    // 创建3个标题按钮
   for (NSUInteger i = 0; i < TimeArray.count; i++) {
       
       CGFloat X =  i * TimelabelWith ;
       UIButton *titleButton = [[UIButton alloc]init];
       [titleButton setTitleColor:YY22Color forState:UIControlStateSelected];
       [titleButton setTitleColor:YY66Color forState:UIControlStateNormal];
       titleButton.titleLabel.hidden = YES;
       titleButton.frame = CGRectMake(X , 10, TimelabelWith, 30);
       [titleButton setAdjustsImageWhenHighlighted:NO];
       titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
       titleButton.titleLabel.font = [UIFont systemFontOfSize: 14.0];
       titleButton.tag = i;
       [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
       titleButton.layer.masksToBounds = YES;
       titleButton.layer.cornerRadius = 10;
       [self.TimeScrollView addSubview:titleButton];
       [titleButton setTitle:TimeArray[i] forState:UIControlStateNormal];
   
   }
    
    self.TimeScrollView.contentSize = CGSizeMake(TimeArray.count * TimelabelWith, 0);
    
}

/**
 *  懒加载UISearchBar
 */
- (UIScrollView *)TimeScrollView{

   if (_TimeScrollView== nil) {
  
      _TimeScrollView = [[UIScrollView alloc] init];
      _TimeScrollView.backgroundColor = [UIColor clearColor];
      _TimeScrollView.frame = CGRectMake(0, YYBarHeight, YYScreenWidth, 56);
      _TimeScrollView.showsHorizontalScrollIndicator = NO;
      _TimeScrollView.showsVerticalScrollIndicator = NO;
      _TimeScrollView.pagingEnabled = YES;
      _TimeScrollView.bounces = YES;
      _TimeScrollView.scrollsToTop = YES;
        
    }
    
    return _TimeScrollView;
    
}


#pragma mark 头部按钮返回上一个界面
-(void)LimitLeftBackClick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)titleButtonClick:(UIButton*)Sender{
    
    [self YYShowAlertViewTitle:[NSString stringWithFormat:@"第%ld张",(long)Sender.tag]];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

      return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   
    return 10;
 
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    LimitBuyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LimitBuyCollectionViewCell" forIndexPath:indexPath];

    return cell;

}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

   
    
}


#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{


     return CGSizeMake(YYScreenWidth , (YYScreenWidth - 24) * 0.36);
     

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


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0;
}


@end

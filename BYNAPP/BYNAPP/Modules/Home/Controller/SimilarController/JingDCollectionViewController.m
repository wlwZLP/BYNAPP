//
//  JingDCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/15.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "JingDCollectionViewController.h"
#import "YYPDDHeadView.h"
#import "HomeMainCollectionViewCell.h"
#import "MyJingDongModel.h"

static int const TimelabelWith = 90;


@interface JingDCollectionViewController ()

@property(nonatomic,strong)YYPDDHeadView * PDDHeadView;

@property(nonatomic,strong)UIScrollView * TopTitleScrollView;

@property(nonatomic,strong)NSString * HeadSort;

@property(nonatomic,strong)NSString * channel_type;

/** 上一次点击的标题按钮 */
@property (nonatomic, strong) UIButton * previousClickedTitleButton;


@end

@implementation JingDCollectionViewController


- (void)viewDidLoad {
    
     [super viewDidLoad];
    
     self.HeadSort = @"";
    
     self.channel_type = @"1";
  
     NSArray * TitleArray = [NSArray arrayWithObjects:@{@"Name":@"推荐",@"JDID":@"1"},@{@"Name":@"京东超市",@"JDID":@"25"},@{@"Name":@"9.9专区",@"JDID":@"10"},@{@"Name":@"秒杀",@"JDID":@"34"},@{@"Name":@"京东自营",@"JDID":@"110"},@{@"Name":@"数码家电",@"JDID":@"24"},@{@"Name":@"家居日用",@"JDID":@"27"},@{@"Name":@"母婴玩具",@"JDID":@"26"},@{@"Name":@"美妆穿搭",@"JDID":@"28"},@{@"Name":@"医药保健",@"JDID":@"29"}, nil];
    
    
    [self CreateJingDongHeadView:[NSArray modelArrayWithClass:[MyJingDongModel class] json:TitleArray]];
    
    self.collectionView.frame = CGRectMake(0, 95, YYScreenWidth, YYScreenHeight - 95);
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[HomeMainCollectionViewCell class] forCellWithReuseIdentifier:@"HomeMainCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    self.collectionView.mj_header = [LPRefreshGifHeader headerWithRefreshingBlock:^{
            
          [self GetSelfViewControllerNetworkData];
            
    }];
    
    self.collectionView.mj_footer = [LPRefreshFooter footerWithRefreshingBlock:^{
        
          [self GetSelfViewControllerNetwMoreData];
        
     }];
    
}


#pragma mark 创建头部控件
-(void)CreateJingDongHeadView:(NSArray <MyJingDongModel*> *)TitleListArray{
    
    UIView * TopNavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YYScreenWidth, 95)];
    TopNavView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:TopNavView];

    [TopNavView addSubview:self.TopTitleScrollView];
    
    for (NSUInteger i = 0; i < TitleListArray.count; i++) {
       
       CGFloat X =  i * TimelabelWith ;
       UIButton *titleButton = [[UIButton alloc]init];
       [titleButton setTitleColor:YY66Color forState:UIControlStateNormal];
       [titleButton setTitleColor:YY22Color forState:UIControlStateSelected];
       titleButton.titleLabel.hidden = YES;
       titleButton.frame = CGRectMake(X , 10, TimelabelWith, 30);
       titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
       titleButton.titleLabel.font = [UIFont systemFontOfSize:16];
        if (i == 0) {
            titleButton.selected = YES;
            self.previousClickedTitleButton = titleButton;
        }
       titleButton.tag = TitleListArray[i].JDID.intValue;
       [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
       [self.TopTitleScrollView addSubview:titleButton];
      
       NSString * Title = [NSString stringWithFormat:@"%@",TitleListArray[i].Name];
       [titleButton setTitle:Title forState:UIControlStateNormal];
   
   }
    
    self.TopTitleScrollView.contentSize = CGSizeMake(TitleListArray.count * TimelabelWith, 0);
    
    [YYTools SetView:self.TopTitleScrollView RadiusSize:0.5 BorderColor:YYE1Color];
    
    
    [self.view addSubview:self.PDDHeadView];
    
}



/**
 *  懒加载UISearchBar
 */
- (UIScrollView *)TopTitleScrollView{

   if (_TopTitleScrollView== nil) {
  
      _TopTitleScrollView = [[UIScrollView alloc] init];
      _TopTitleScrollView.backgroundColor = [UIColor clearColor];
      _TopTitleScrollView.frame = CGRectMake(0, 0, YYScreenWidth, 50);
      _TopTitleScrollView.showsHorizontalScrollIndicator = NO;
      _TopTitleScrollView.showsVerticalScrollIndicator = NO;
      _TopTitleScrollView.pagingEnabled = YES;
      _TopTitleScrollView.bounces = YES;
      _TopTitleScrollView.scrollsToTop = YES;
        
    }
    
    return _TopTitleScrollView;
    
}



#pragma mark ===============头部点击=============

-(void)titleButtonClick:(UIButton*)Sender{
    
    self.previousClickedTitleButton.selected = NO;
    
    Sender.selected = YES;
    
    self.previousClickedTitleButton = Sender;
    
    self.channel_type = [NSString stringWithFormat:@"%ld",(long)Sender.tag];
    
    [self GetSelfViewControllerNetworkData];
     
    
}




-(void)viewWillAppear:(BOOL)animated{
    
    [self GetSelfViewControllerNetworkData];
    
}

#pragma mark 网络请求数据

-(void)GetSelfViewControllerNetworkData{
    
     self.RefreshCount = 1;
  
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsItems];
         
     NSDictionary * dict = @{@"mall_id":@"4",@"sort":self.HeadSort,@"channel_type":self.self.channel_type,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                        
       [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
                
            NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
           
            self.RefreshCount ++ ;
           
            [self.MainListArray removeAllObjects];
           
            [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
             
            [self.collectionView.mj_header endRefreshing];
           
            [self.collectionView reloadData];
        
          
       } failure:^(NSError *error, id responseCache) {
              
            NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
           
             [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                   
            [self.collectionView reloadData];
           

       }];

    
}


-(void)GetSelfViewControllerNetwMoreData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsItems];
        
   NSDictionary * dict = @{@"mall_id":@"4",@"sort":self.HeadSort,@"channel_type":self.self.channel_type,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                       
      [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
               
            NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
          
            self.RefreshCount ++ ;
          
            [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
          
            [self.collectionView.mj_footer endRefreshing];
                  
            [self.collectionView reloadData];
       
         
      } failure:^(NSError *error, id responseCache) {
             
           NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
          
           [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                  
           [self.collectionView reloadData];
          

      }];
    
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
      return self.MainListArray.count;
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
      HomeMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeMainCollectionViewCell" forIndexPath:indexPath];
    
      cell.Model = self.MainListArray[indexPath.item];
    
      return cell;
    
}



#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
    HomeVc.mall_id = self.MainListArray[indexPath.item].mall_id;
    HomeVc.item_id = self.MainListArray[indexPath.item].item_id;
    HomeVc.activity_id = self.MainListArray[indexPath.item].activity_id;
    [self.navigationController pushViewController:HomeVc animated:YES];
    
    
}

#pragma mark <UICollectionViewDelegate>


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.36);
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
       return (CGSize){YYScreenWidth, 0};
    
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

/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
-(YYPDDHeadView *)PDDHeadView
{
    
    if (_PDDHeadView == nil) {
        
       _PDDHeadView = [[YYPDDHeadView alloc] initWithFrame:CGRectMake(0, 50 , YYScreenWidth , 45)];
        
      YYWeakSelf(self);
      
      _PDDHeadView.HeaderTopBlockClick = ^(NSString * _Nonnull SortType) {
      
             weakself.HeadSort = SortType;
          
             [weakself GetSelfViewControllerNetworkData];
          
      };
        
     }
    
    return _PDDHeadView;
    
}


#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
      return UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0.5;
    
}



@end

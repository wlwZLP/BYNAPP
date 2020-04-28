//
//  HomeSearchCollectionViewController.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/12.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeSearchCollectionViewController.h"
#import "GoodsCourseCollectionViewCell.h"
#import "SearchTagCollectionViewCell.h"
#import "YYSearchHeadView.h"
#import "HomeMainCollectionViewCell.h"
#import "MyNewCollectionViewController.h"

@interface HomeSearchCollectionViewController ()<UISearchBarDelegate>

/** 自定义导航栏View*/
//@property (nonatomic, strong) UIView * TopNavView;
/** 左边返回button */
@property (nonatomic, strong) UIButton * LeftBackBtn;
/** 搜索 */
@property (nonatomic, strong) UISearchBar * MainSearchBar;
/** 右边是取消button*/
@property (nonatomic, strong) UIButton * RightCalBtn;
/** 上一个点击的btn */
@property (nonatomic, strong) UIButton * OldClickedTitleButton;
/** 上一个点击的btn黄色下划线 */
@property (nonatomic, strong) UIView * titleUnderline;
/** 搜索记录 */
@property(nonatomic,strong)NSMutableArray * SearchCacheArray;
/** 热门推荐*/
@property(nonatomic,strong)NSArray * HotWordsArray;
/** 当前界面展示形式 1为刚进来 2为搜索结果*/
@property(nonatomic,strong)NSString  * SearchTpye;
/** 搜索结果列表头部*/
@property(nonatomic,strong)YYSearchHeadView * SearchHeadView;
/** 1.淘宝 2.天猫 3.拼多多 4.京东*/
@property(nonatomic,strong)NSString  * mall_id;
/** 搜索头部类型  价格(discount_price_des, discount_price_asc) 销量(month_sales_des, month_sales_asc) 综合(不用传)*/
@property(nonatomic,strong)NSString  * HeadSort;
/** 搜索头部类型  是否用券*/
@property(nonatomic,assign)NSString * has_coupon;


@end

@implementation HomeSearchCollectionViewController


- (void)viewDidLoad {
    
     [super viewDidLoad];
    
     self.SearchTpye = @"1";
    
     self.mall_id = @"1";
    
     self.HeadSort = @"";
    
     self.has_coupon = @"false";
    
     self.SearchCacheArray = [NSMutableArray array];
    
     // 创建缓存对象
     YYCache *cache = [[YYCache alloc]initWithName:MyCache];
     
      // 判断对象是否存在
     if ([cache containsObjectForKey:YYHotWords]) {
         // 取出缓存
         self.HotWordsArray = (NSArray*)[cache objectForKey:YYHotWords];
    
     }
   
    self.SearchCacheArray = [YYSaveTool YYGetDataByCahcePath:YYSearchCache];
    
     [self CreateHomeBaseViewController];
    
     self.collectionView.frame = CGRectMake(0, YYBarHeight + 40, YYScreenWidth, YYScreenHeight - YYBarHeight - 40);
    
     [self.collectionView registerClass:[GoodsCourseCollectionViewCell class] forCellWithReuseIdentifier:@"GoodsCourseCollectionViewCell"];
    
     [self.collectionView registerClass:[SearchTagCollectionViewCell class] forCellWithReuseIdentifier:@"SearchTagCollectionViewCell"];
    
     [self.collectionView registerClass:[HomeMainCollectionViewCell class] forCellWithReuseIdentifier:@"HomeMainCollectionViewCell"];
   
     [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];

    
}

-(void)viewWillAppear:(BOOL)animated{
      
    [self.navigationController setNavigationBarHidden:YES animated:nil];
     
}


-(void)viewWillDisappear:(BOOL)animated{
    
    
    
    

    
}

#pragma mark ===============网络请求=============

-(void)GetSearchViewControllerNetWorkData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsSearch];
            
    NSDictionary * dict = @{@"keyword":self.MainSearchBar.text,@"mall_id":self.mall_id,@"has_coupon":self.has_coupon,@"sort":self.HeadSort,@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                           
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
        
        [YYSaveTool YYSetSavelCahceName:self.MainSearchBar.text pathName:YYSearchCache];
        
        self.SearchCacheArray = [YYSaveTool YYGetDataByCahcePath:YYSearchCache];
  
        [UIView animateWithDuration:0.25 animations:^{
            
            // 滚动scrollView
            self.LeftBackBtn.frame = CGRectMake( 12 , YYStatusHeight + 14 , 10 , 17);
            
            self.MainSearchBar.frame = CGRectMake(40, YYStatusHeight + 6, YYScreenWidth - 60, 32);
            
            self.RightCalBtn.frame = CGRectMake(YYScreenWidth , YYStatusHeight + 6 , 60 , 32);
          
        } completion:^(BOOL finished) {
           
    
            
        }];
        
        self.SearchTpye = @"2";
        
        [self.MainListArray removeAllObjects];
        
        NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
          
        [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
              
        [self.collectionView reloadData];
             
    } failure:^(NSError *error, id responseCache) {
        
         self.SearchTpye = @"2";
                 
         NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
               
         [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")]];
                   
         [self.collectionView reloadData];

    }];
    
    
}
#pragma mark 创建头部滑动视图

-(void)CreateHomeBaseViewController{
    // 标题栏
    UIView * TopTitleView = [[UIView alloc] init];
    TopTitleView.backgroundColor = [UIColor whiteColor];
    TopTitleView.frame = CGRectMake(0, 0, YYScreenWidth,YYBarHeight + 40);
    [self.view addSubview:TopTitleView];
    
    NSArray * TitleArray  = [[NSArray alloc]initWithObjects:@"淘宝",@"天猫",@"京东",@"拼多多",nil ];
    
    // 标题按钮的尺寸
    CGFloat titleButtonW = YYScreenWidth/4;
    
    CGFloat titleButtonH = 22;
    //每行间距
    CGFloat rowMargin = 0;
    // 创建3个标题按钮
    for (NSUInteger i = 0; i < TitleArray.count; i++) {
        
        CGFloat X =  i * titleButtonW + rowMargin*(i + 1) ;
        UIButton *titleButton = [[UIButton alloc]init];
        [titleButton setTitleColor:YY22Color forState:UIControlStateSelected];
        [titleButton setTitleColor:YY66Color forState:UIControlStateNormal];
        titleButton.titleLabel.hidden = YES;
        // frame
        titleButton.frame = CGRectMake(X , YYBarHeight + 10 , titleButtonW, titleButtonH);
        [titleButton setAdjustsImageWhenHighlighted:NO];
        titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        titleButton.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(TopTitleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.layer.masksToBounds = YES;
        titleButton.layer.cornerRadius = 10;
        [TopTitleView addSubview:titleButton];
        [titleButton setTitle:TitleArray[i] forState:UIControlStateNormal];
    
    }
    
    [TopTitleView addSubview:self.LeftBackBtn];
    
    [TopTitleView addSubview:self.MainSearchBar];
    
    [TopTitleView addSubview:self.RightCalBtn];
    
    UIView * LineView = [[UIView alloc]initWithFrame:CGRectMake(0, YYBarHeight + 39, YYScreenWidth, 0.5)];
    LineView.backgroundColor = YYE5Color;
    [TopTitleView addSubview:LineView];
    
    // 下划线
    UIButton * firstTitleButton = TopTitleView.subviews.firstObject;
    
    firstTitleButton.selected = YES;
    self.OldClickedTitleButton = firstTitleButton;
    UIView *titleUnderline = [[UIView alloc] init];
    titleUnderline.ZLP_height = 3;
    titleUnderline.ZLP_y = TopTitleView.ZLP_height - titleUnderline.ZLP_height- 3;
    titleUnderline.backgroundColor = YYHexColor(@"#FFD409");
    [TopTitleView addSubview:titleUnderline];
    self.titleUnderline = titleUnderline;
    self.titleUnderline.ZLP_width = 30;
    self.titleUnderline.ZLP_centerX = firstTitleButton.ZLP_centerX;
    
    
    
}



/**
 *  懒加载UIButton
 *
 *  @return LeftBackBtn
 */
- (UIButton *)LeftBackBtn{
    
    if (_LeftBackBtn== nil) {
        
       _LeftBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
       _LeftBackBtn.frame = CGRectMake(-12 , YYStatusHeight + 14 , 10 , 17);
       [_LeftBackBtn setBackgroundImage:[UIImage imageNamed:@"LeftBack"] forState:UIControlStateNormal];
        [_LeftBackBtn addTarget:self action:@selector(LeftbackbuttonClick) forControlEvents:UIControlEventTouchUpInside];
       _LeftBackBtn.backgroundColor = [UIColor whiteColor];
    }
    
    return _LeftBackBtn;
    
}


-(void)LeftbackbuttonClick{
    
   [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (UIButton *)RightCalBtn{
    
    if (_RightCalBtn== nil) {
       _RightCalBtn = [[UIButton alloc]init];
       [_RightCalBtn setTitleColor:YY66Color forState:UIControlStateNormal];
       _RightCalBtn.frame = CGRectMake( YYScreenWidth - 70 , YYStatusHeight + 6 , 60 , 32);
       _RightCalBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
       _RightCalBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
       [_RightCalBtn addTarget:self action:@selector(RightCancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
       [_RightCalBtn setTitle:@"取消" forState:UIControlStateNormal];
    }
    
    return _RightCalBtn;
    
}

-(void)RightCancelButtonClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
- (UISearchBar *)MainSearchBar{
    
    if (_MainSearchBar== nil) {
        
       _MainSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, YYStatusHeight + 6 , YYScreenWidth - 80 , 32)];
       _MainSearchBar.backgroundColor = [UIColor colorWithRed:255/255.0 green:254/255.0 blue:248/255.0 alpha:1.0];
       _MainSearchBar.showsCancelButton = NO;
       _MainSearchBar.tintColor = [UIColor orangeColor];
       _MainSearchBar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor]];
       _MainSearchBar.placeholder = @"粘贴标题，搜索优惠";
       _MainSearchBar.delegate = self;
       _MainSearchBar.searchBarStyle  = UISearchBarStyleProminent;
        [YYTools ChangeView:_MainSearchBar RadiusSize:10 BorderColor:YYHexColor(@"#FFD409")];
        UITextField * textField = _MainSearchBar.BYNGetSearchTextFiled;
        textField.backgroundColor = [UIColor colorWithRed:255/255.0 green:254/255.0 blue:248/255.0 alpha:1.0];
        textField.textColor = YY66Color;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10 , 17 , 17)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.image = [UIImage imageNamed:@"HomeSearch"];
        textField.leftView = imageView;
        NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc]initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName:YY99Color,NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        textField.attributedPlaceholder = arrStr;
        
    }
    
    return _MainSearchBar;
    
}



#pragma mark - titbuttonclick

-(void)TopTitleButtonClick:(UIButton*)titleButton{

    [UIView animateWithDuration:0.25 animations:^{
        // 滚动scrollView
        self.OldClickedTitleButton.selected = NO;
          
        titleButton.selected = YES;
          
        self.OldClickedTitleButton = titleButton;
           
        self.titleUnderline.ZLP_centerX = titleButton.ZLP_centerX;
      
    } completion:^(BOOL finished) {
        
        if (titleButton.tag == 0) {
            self.mall_id = @"1";
        }else if (titleButton.tag == 1){
            self.mall_id = @"2";
        }else if (titleButton.tag == 2){
            self.mall_id = @"4";
        }else{
            self.mall_id = @"3";
        }
        if ([self.SearchTpye isEqualToString:@"1"]) {
            return ;
        }
        [self GetSearchViewControllerNetWorkData];
        
    }];
  

    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
   
     if ([self.SearchTpye isEqualToString:@"1"]) {
         return 3;
     }else{
         return 1;
     }
     
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
 
     if ([self.SearchTpye isEqualToString:@"1"]) {
         if (section == 0) {
            return 1;
         }else if (section == 1){
            return self.SearchCacheArray.count;
         }else{
            return self.HotWordsArray.count;
         }
     }else{
         return self.MainListArray.count;
     }
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.SearchTpye isEqualToString:@"1"]) {
        if (indexPath.section == 0) {
            
           GoodsCourseCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsCourseCollectionViewCell" forIndexPath:indexPath];
            
            cell.IMgClickBlockClick = ^{
              
                MyNewCollectionViewController * NewVc = [[MyNewCollectionViewController alloc]init];
                NewVc.title = @"新手教程";
                [self.navigationController pushViewController:NewVc animated:YES];
                
            };
            
            return cell;
            
        }else if (indexPath.section == 1){
            
           SearchTagCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchTagCollectionViewCell" forIndexPath:indexPath];
            
          [cell.TextBtn setTitle:self.SearchCacheArray[indexPath.item] forState:UIControlStateNormal];
            
           cell.labelClickBlockClick = ^{
                
               self.MainSearchBar.text = self.SearchCacheArray[indexPath.item];
               [self GetSearchViewControllerNetWorkData];
                
           };
            
           return cell;
            
        }else{
            
          SearchTagCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchTagCollectionViewCell" forIndexPath:indexPath];
            
          [cell.TextBtn setTitle:self.HotWordsArray[indexPath.item] forState:UIControlStateNormal];
            
          cell.labelClickBlockClick = ^{
               self.MainSearchBar.text = self.HotWordsArray[indexPath.item];
               [self GetSearchViewControllerNetWorkData];
               
          };
            
           return cell;
            
        }
        
    }else{
        
        HomeMainCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeMainCollectionViewCell" forIndexPath:indexPath];
        
        cell.Model = self.MainListArray[indexPath.item];
        
        return cell;
        
    }
    
 
}


#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.SearchTpye isEqualToString:@"2"]) {
        
        HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
        HomeVc.mall_id = self.MainListArray[indexPath.item].mall_id;
        HomeVc.item_id = self.MainListArray[indexPath.item].item_id;
        HomeVc.activity_id = self.MainListArray[indexPath.item].activity_id;
        [self.navigationController pushViewController:HomeVc animated:YES];
        
    }
    
}

#pragma mark <UICollectionViewDelegate>


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    if ([self.SearchTpye isEqualToString:@"1"]) {
        if (indexPath.section == 0) {
            return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.17 + 20);
        }else if (indexPath.section == 1){
            return CGSizeMake([self GetStringText:self.SearchCacheArray[indexPath.item]] + 20 , 30);
        }else{
            return CGSizeMake([self GetStringText:self.HotWordsArray[indexPath.item]] + 20 , 30);
        }
       
    }else{
        return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.36);
    }
    
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if ([self.SearchTpye isEqualToString:@"1"]) {
        if (section == 0) {
           return (CGSize){YYScreenWidth,0};
        }else if (section == 1){
            if (self.SearchCacheArray.count == 0) {
                 return (CGSize){YYScreenWidth,0};
            }else{
                 return (CGSize){YYScreenWidth,60};
            }
        }else{
           return (CGSize){YYScreenWidth,60};
        }
    }else{
        return (CGSize){YYScreenWidth,40};
    }

  
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
       return (CGSize){0,0};
    
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
        
        for (UIView *view in headerView.subviews) {
           [view removeFromSuperview];
        }
        
        headerView.backgroundColor = UIColor.whiteColor;
        
        if ([self.SearchTpye isEqualToString:@"1"]) {
            if (indexPath.section == 1) {
                UILabel * TitleLabel = [[UILabel alloc]init];
                TitleLabel.textColor = YY22Color;
                TitleLabel.text = @"搜索历史";
                TitleLabel.frame = CGRectMake(20 , 10 , 180, 20);
                TitleLabel.textAlignment = NSTextAlignmentLeft;
                TitleLabel.font = [UIFont systemFontOfSize:16 weight:1];
                [headerView addSubview:TitleLabel];
                
                UIButton * DelBtn = [[UIButton alloc]init];
                DelBtn.frame = CGRectMake(YYScreenWidth - 50, 10, 20, 20);
                [DelBtn setImage:[UIImage imageNamed:@"searchdel"] forState:UIControlStateNormal];
                [DelBtn addTarget:self action:@selector(SearchDelButtonClick) forControlEvents:UIControlEventTouchUpInside];
                [headerView addSubview:DelBtn];
                
            }else{
                UILabel * TitleLabel = [[UILabel alloc]init];
                TitleLabel.textColor = YY22Color;
                TitleLabel.text = @"实时热搜";
                TitleLabel.frame = CGRectMake(20 , 10 , 180, 20);
                TitleLabel.textAlignment = NSTextAlignmentLeft;
                TitleLabel.font = [UIFont systemFontOfSize:16 weight:1];
                [headerView addSubview:TitleLabel];
            }
        }else{
            
            [headerView addSubview:self.SearchHeadView];
            
        }
        
        return headerView;
    
    }
    
     return nil;
    
}


#pragma mark ===============删除搜索历史=============

-(void)SearchDelButtonClick{
    
    [YYSaveTool YYDeleDataByfilePath:YYSearchCache];
    
    self.SearchCacheArray = [YYSaveTool YYGetDataByCahcePath:YYSearchCache];
    
    [self.collectionView reloadData];
    
}

/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
-(YYSearchHeadView *)SearchHeadView
{
    
    if (_SearchHeadView == nil) {
        
        _SearchHeadView = [[YYSearchHeadView alloc] initWithFrame:CGRectMake(0, 0 , YYScreenWidth , 45)];
        
        YYWeakSelf(self);
        
        _SearchHeadView.HeaderTopBlockClick = ^(NSString * _Nonnull SortType) {
            
             weakself.HeadSort = SortType;
            
             [weakself GetSearchViewControllerNetWorkData];
            
        };
        
        _SearchHeadView.HeaderCouponBlockClick = ^(NSString * _Nonnull CouponType) {
            
             weakself.has_coupon = CouponType;
            
             [weakself GetSearchViewControllerNetWorkData];
            
        };
        
     }
    
    return _SearchHeadView;
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(5, 0, 0, 0);//上左下右
    }else{
        return UIEdgeInsetsMake(0, 12 , 20 , 12);//上左下右
    }
      
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
       return 10;
    
}


/**
 根据字符串求宽度
 @param text 计算的内容
 @return 返回宽度
 */
-(CGFloat)GetStringText:(NSString *)text
{
    //加上判断，防止传nil等不符合的值，导致程序奔溃
    if (text == nil || [text isEqualToString:@""]){
        text = @"无";
    }
   
    CGSize TagSize = CGSizeMake(YYScreenWidth - 40, 20);
    
    CGRect rect = [text boundingRectWithSize:TagSize
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                     context:nil];
    return rect.size.width + 5;
    
    
}

#pragma mark - UISearchBardelegete
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    return YES;
    
}

// return NO to not become first responder
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    NSLog(@"编辑开始");
    
}

// called when text starts editing
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    return YES;
}
// return NO to not resign first responder
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
    NSLog(@"编辑完成");
    
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length == 0) {
        
        self.SearchTpye = @"1";
       
        [UIView animateWithDuration:0.25 animations:^{
            
            self.LeftBackBtn.frame = CGRectMake( -12 , YYStatusHeight + 14 , 10 , 17);
                
            self.MainSearchBar.frame = CGRectMake(12, YYStatusHeight + 6, YYScreenWidth - 80, 32);
                
            self.RightCalBtn.frame = CGRectMake( YYScreenWidth - 70 , YYStatusHeight + 6 , 60 , 32);
              
        } completion:^(BOOL finished) {
               
        
                
        }];
        
        [self.collectionView reloadData];
        
        
    }
    
    
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
     [self GetSearchViewControllerNetWorkData];
    
}

// called when keyboard search button pressed
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    return YES;
    
}




@end

//
//  YYMemCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/3/31.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYMemViewController.h"
#import "LeftTableViewCell.h"
#import "RightCollectionViewCell.h"
#import "MenListCollectionViewController.h"
#import "MenModel.h"


static float kLeftTableViewWidth = 95.f;


@interface YYMemViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource>

/** 首页搜索空间 */
@property (nonatomic,strong)UISearchBar * HomeSearchBar;

@property (nonatomic,strong)UITableView * LeftTableView;

@property (nonatomic,strong)UICollectionView * RightCollectionView;

@property (nonatomic,strong)NSMutableArray<MenModel*> * dataSource;

@property (nonatomic,strong)NSMutableArray * collectionDatas;

@property (nonatomic,assign)NSInteger  selectIndex;

@property (nonatomic,assign)BOOL  isScrollDown;

@end

@implementation YYMemViewController



- (void)viewDidLoad{
    
    
    [super viewDidLoad];
    
    [self CreateHomeNavTopSearch];
       
    [self.navigationController setNavigationBarHidden:YES animated:nil];
    
    _selectIndex = 0;
    
    _isScrollDown = YES;

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.LeftTableView];
    
    [self.LeftTableView registerClass:[LeftTableViewCell class] forCellReuseIdentifier:@"LeftTableViewCell"];
    
    [self.view addSubview:self.RightCollectionView];
    
    [self.RightCollectionView registerClass:[RightCollectionViewCell class] forCellWithReuseIdentifier:@"RightCollectionViewCell"];
    
    [self.RightCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [self GetMenberNetworkData];
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
    
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
  
    [super viewWillDisappear:animated];
    
}



-(void)GetMenberNetworkData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsCategories];
    
    NSDictionary * dict = @{@"mall_id":@"1",@"mode":@"2",@"parent_id":@"1522"};
       
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
        
//        YYNSLog(@"类目商品接口数据----%@",responseObject);
        
        NSArray * DataArray = EncodeArrayFromDic(responseObject, @"data");
           
        for (NSDictionary * dict in DataArray)
        {
           MenModel * Model = [MenModel modelWithDictionary:dict];
           
           [self.dataSource addObject:Model];
           
           NSMutableArray *datas = [NSMutableArray array];
           
           for (ChildrenModel * sModel in Model.children)
           {
               [datas addObject:sModel];
           }
           
           [self.collectionDatas addObject:datas];
           
        }
        
        [self.LeftTableView reloadData];
        
        
           
    } failure:^(NSError *error, id responseCache) {
       
       
        
        
        
           
    }];
    
    
    
}

#pragma mark - Getters

- (NSMutableArray *)dataSource
{
    if (!_dataSource)
    {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSMutableArray *)collectionDatas
{
    if (!_collectionDatas)
    {
        _collectionDatas = [NSMutableArray array];
    }
    return _collectionDatas;
}

- (UITableView *)LeftTableView
{
    if (!_LeftTableView)
    {
        _LeftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, YYBarHeight, kLeftTableViewWidth, YYScreenHeight)];
        _LeftTableView.delegate = self;
        _LeftTableView.dataSource = self;
        _LeftTableView.tableFooterView = [UIView new];
        _LeftTableView.rowHeight = 55;
        _LeftTableView.backgroundColor = YYBGColor;
        _LeftTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _LeftTableView.showsVerticalScrollIndicator = NO;
        _LeftTableView.separatorColor = [UIColor clearColor];
       
    }
    return _LeftTableView;
}




/**
 *  懒加载collectionView
 *
 *  @return collectionView
 */
- (UICollectionView *)RightCollectionView
{
    if (_RightCollectionView == nil) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _RightCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(kLeftTableViewWidth, YYBarHeight , YYScreenWidth - kLeftTableViewWidth , YYScreenHeight - YYBarHeight ) collectionViewLayout:flowLayout];
        _RightCollectionView.backgroundColor= UIColor.whiteColor;
        _RightCollectionView.scrollsToTop = YES;
        _RightCollectionView.delegate = self;
        _RightCollectionView.dataSource = self;
        _RightCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    
    return _RightCollectionView;
}


#pragma mark - UITableView DataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftTableViewCell" forIndexPath:indexPath];
    
    cell.name.text = self.dataSource[indexPath.item].name;

    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectIndex = indexPath.row;
    
    [self scrollToTopOfSection:_selectIndex animated:YES];
    
    [self.LeftTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_selectIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    
}

#pragma mark - 解决点击 TableView 后 CollectionView 的 Header 遮挡问题

- (void)scrollToTopOfSection:(NSInteger)section animated:(BOOL)animated
{
    CGRect headerRect = [self frameForHeaderForSection:section];
    CGPoint topOfHeader = CGPointMake(0, headerRect.origin.y - self.RightCollectionView.contentInset.top);
    [self.RightCollectionView setContentOffset:topOfHeader animated:animated];
    
}


- (CGRect)frameForHeaderForSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    UICollectionViewLayoutAttributes *attributes = [self.RightCollectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
    return attributes.frame;
}

#pragma mark - UICollectionView DataSource Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     return 18;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    RightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCollectionViewCell" forIndexPath:indexPath];
      
     return cell;
    
}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    SubCategoryModel * model = self.collectionDatas[indexPath.section][indexPath.row];
    
    MenListCollectionViewController * ListVc = [[MenListCollectionViewController alloc]init];
    
    [self.navigationController pushViewController:ListVc animated:YES];
    
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
     return CGSizeMake((YYScreenWidth - kLeftTableViewWidth)/3, (YYScreenWidth - kLeftTableViewWidth) / 3 + 18);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
     return CGSizeMake(YYScreenWidth - kLeftTableViewWidth, 50);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *headerView = [self.RightCollectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerId" forIndexPath:indexPath];
        
        if(headerView == nil){
            headerView = [[UICollectionReusableView alloc] init];
        }
        
        headerView.backgroundColor = UIColor.whiteColor;
        
        UILabel * TitleLabel = [[UILabel alloc]init];
        TitleLabel.text = @"为你推荐";
        TitleLabel.textColor = YY22Color;
        TitleLabel.frame = CGRectMake(20, 20, 100, 20);
        TitleLabel.textAlignment = NSTextAlignmentLeft;
        TitleLabel.font = [UIFont systemFontOfSize:14 weight:1];
        [headerView addSubview:TitleLabel];
     
        return headerView;
    
    }
    
     return nil;
    
}



// CollectionView分区标题即将展示
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    // 当前CollectionView滚动的方向向上，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (!_isScrollDown && (collectionView.dragging || collectionView.decelerating))
    {
        [self selectRowAtIndexPath:indexPath.section];
    }
}

// CollectionView分区标题展示结束
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(nonnull UICollectionReusableView *)view forElementOfKind:(nonnull NSString *)elementKind atIndexPath:(nonnull NSIndexPath *)indexPath
{
    // 当前CollectionView滚动的方向向下，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (_isScrollDown && (collectionView.dragging || collectionView.decelerating))
    {
        [self selectRowAtIndexPath:indexPath.section + 1];
    }
}

// 当拖动CollectionView的时候，处理TableView
- (void)selectRowAtIndexPath:(NSInteger)index
{
    [self.LeftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
      return UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
       return 0;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
      return 0;
}

#pragma mark - UIScrollView Delegate
// 标记一下CollectionView的滚动方向，是向上还是向下
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static float lastOffsetY = 0;
    
    if (self.RightCollectionView == scrollView)
    {
        _isScrollDown = lastOffsetY < scrollView.contentOffset.y;
        lastOffsetY = scrollView.contentOffset.y;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


#pragma mark 头部搜索控件

-(void)CreateHomeNavTopSearch{
    
    UIView * TopBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YYScreenWidth, YYBarHeight)];
    TopBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:TopBarView];
    
    [TopBarView addSubview:self.HomeSearchBar];
    
    UIButton * SearchBtn = [[UIButton alloc] initWithFrame:CGRectMake(YYScreenWidth - 125, YYStatusHeight + 6 , 66, 32)];
    [SearchBtn addTarget:self action:@selector(SearchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    SearchBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    SearchBtn.backgroundColor = YYHexColor(@"#FFD409");
    [SearchBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [SearchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [SearchBtn.titleLabel setFont :[ UIFont fontWithName :@"Helvetica-Bold" size : 15]];
    [TopBarView addSubview:SearchBtn];
    [YYTools ChangeView:SearchBtn RadiusSize:16 BorderColor:YYHexColor(@"#FFD409")];
    
    UIButton * HomeRightBtn = [[UIButton alloc]init];
    [HomeRightBtn setBackgroundImage:[UIImage imageNamed:@"HomeMes"] forState:UIControlStateNormal];
    // frame
    HomeRightBtn.frame = CGRectMake(YYScreenWidth - 40 , YYStatusHeight + 10, 26, 24);
    [TopBarView addSubview:HomeRightBtn];
    
    
}


/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
- (UISearchBar *)HomeSearchBar
{
    
    if (_HomeSearchBar== nil) {
        
       _HomeSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, YYStatusHeight + 6 , YYScreenWidth - 100 , 32)];
       _HomeSearchBar.backgroundColor = [UIColor colorWithRed:255/255.0 green:254/255.0 blue:248/255.0 alpha:1.0];
       _HomeSearchBar.showsCancelButton = NO;
       _HomeSearchBar.tintColor = [UIColor orangeColor];
       _HomeSearchBar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor]];
       _HomeSearchBar.placeholder = @"粘贴标题，搜索优惠";
       _HomeSearchBar.delegate = self;
        _HomeSearchBar.searchBarStyle  = UISearchBarStyleProminent;
       [YYTools ChangeView:_HomeSearchBar RadiusSize:10 BorderColor:YYHexColor(@"#FFD409")];
        UITextField *textField = _HomeSearchBar.BYNGetSearchTextFiled;
        textField.backgroundColor = [UIColor colorWithRed:255/255.0 green:254/255.0 blue:248/255.0 alpha:1.0];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10 , 17 , 17)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.image = [UIImage imageNamed:@"HomeSearch"];
        textField.leftView = imageView;
        NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc]initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName:YY99Color,NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        textField.attributedPlaceholder = arrStr;
        
        
    }
    
    return _HomeSearchBar;
    
}










@end

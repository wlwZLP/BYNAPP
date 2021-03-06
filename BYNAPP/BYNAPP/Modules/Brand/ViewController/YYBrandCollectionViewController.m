//
//  YYLiveCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/3/31.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYBrandCollectionViewController.h"
#import "BrandPlistModel.h"
#import "BrandAllCollectionViewController.h"
#import "BrandOtherCollectionViewController.h"
#import "BrandSearchCollectionViewController.h"

static int const HomelabelWith = 90;

@interface YYBrandCollectionViewController ()<UISearchBarDelegate>

/** 用来存放所有文字的scrollView */
@property (nonatomic, strong) UIScrollView * titleScrollView;
/** 用来存放所有子控制器view的scrollView */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 标题下划线 */
@property (nonatomic, strong) UIView * titleUnderline;
/** 上一次点击的标题按钮 */
@property (nonatomic, strong) UIButton * previousClickedTitleButton;
/** 标题按钮数量 */
@property(nonatomic,strong)NSArray<BrandPlistModel*> * BrandTitleModelArray;

/** 首页搜索空间 */
@property (nonatomic, strong)UISearchBar * BrandSearchBar;

@end

@implementation YYBrandCollectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self CreateHomeNavTopSearch];
    

    [self GetBrandPlistDataCompleteData:^(NSArray<BrandPlistModel *> *ModelArray) {
       
       [ModelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                 
         if (idx == 0) {
                    
            BrandAllCollectionViewController * OneVC = [[BrandAllCollectionViewController alloc]init];
                               
            [self addChildViewController:OneVC];
                    
          }else{
                     
            BrandOtherCollectionViewController * OneVC = [[BrandOtherCollectionViewController alloc]init];
            OneVC.Brand_id = ModelArray[idx].Brand_id;
            [self addChildViewController:OneVC];
                    
          }
         
        }];
           
        self.BrandTitleModelArray = ModelArray;
            
        [self CreateBrandBaseViewController];
            
    }];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:nil];
    
    self.BrandSearchBar.text = @"";
   
}


-(void)GetBrandPlistDataCompleteData:(nullable void(^)(NSArray<BrandPlistModel*> * ModelArray))CompleteData{
    

    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVHome];
                  
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
        
         NSDictionary * DataDic = EncodeDicFromDic(responseObject, @"data");
        
         NSDictionary * categories = EncodeDicFromDic(DataDic, @"categories");
        
         NSArray * DataArray = EncodeArrayFromDic(categories, @"contents");
        
         NSDictionary * dict1 = @{@"id":@"000",@"name":@"全部"};
               
         NSMutableArray * TitleArray = [NSMutableArray array];
               
         [TitleArray addObject:dict1];
               
         [TitleArray addObjectsFromArray:DataArray];
        
         CompleteData([NSArray modelArrayWithClass:[BrandPlistModel class] json:TitleArray]);

    } failure:^(NSError *error, id responseCache) {
     
          NSDictionary * DataDic = EncodeDicFromDic(responseCache, @"data");
          
          NSDictionary * categories = EncodeDicFromDic(DataDic, @"categories");
          
          CompleteData([NSArray modelArrayWithClass:[BrandPlistModel class] json:EncodeArrayFromDic(categories, @"contents")]);
       
    }];
    
    
}


#pragma mark 视图控制器的生命周期

-(void)CreateHomeNavTopSearch{
    
    UIView * TopBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YYScreenWidth, YYBarHeight)];
    TopBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:TopBarView];
    
    [TopBarView addSubview:self.BrandSearchBar];
    
    UIButton * SearchBtn = [[UIButton alloc] initWithFrame:CGRectMake(YYScreenWidth - 125, YYStatusHeight + 6 , 66, 32)];
    SearchBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    SearchBtn.backgroundColor = YYHexColor(@"#FFD409");
    [SearchBtn addTarget:self action:@selector(BrandSearchBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [SearchBtn setTitleColor:YY66Color forState:UIControlStateNormal];
    [SearchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [SearchBtn.titleLabel setFont :[ UIFont fontWithName :@"Helvetica-Bold" size : 15]];
    [TopBarView addSubview:SearchBtn];
    [YYTools ChangeView:SearchBtn RadiusSize:16 BorderColor:YYHexColor(@"#FFD409")];

    UIButton * HomeRightBtn = [[UIButton alloc]init];
    [HomeRightBtn setBackgroundImage:[UIImage imageNamed:@"HomeMes"] forState:UIControlStateNormal];
    HomeRightBtn.frame = CGRectMake(YYScreenWidth - 40 , YYStatusHeight + 10, 26, 24);
    [TopBarView addSubview:HomeRightBtn];
    
    
}


-(void)BrandSearchBtnClick{
    
    if (self.BrandSearchBar.text.length == 0) {
        
        UITextField *textField = self.BrandSearchBar.BYNGetSearchTextFiled;
        
        [textField shake];
        
        return;
    }
    
    BrandSearchCollectionViewController * Search = [[BrandSearchCollectionViewController alloc]init];
    Search.title = @"搜索";
    Search.SearchText = self.BrandSearchBar.text;
    [self.navigationController pushViewController:Search animated:YES];
    
    
    
}

/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
-(UISearchBar *)BrandSearchBar
{
    
    if (_BrandSearchBar== nil) {
        
       _BrandSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, YYStatusHeight + 6 , YYScreenWidth - 100 , 32)];
       _BrandSearchBar.backgroundColor = [UIColor colorWithRed:255/255.0 green:254/255.0 blue:248/255.0 alpha:1.0];
       _BrandSearchBar.showsCancelButton = NO;
       _BrandSearchBar.tintColor = [UIColor orangeColor];
       _BrandSearchBar.backgroundImage = [UIImage imageWithColor:[UIColor whiteColor]];
       _BrandSearchBar.placeholder = @"粘贴标题，搜索优惠";
       _BrandSearchBar.delegate = self;
       _BrandSearchBar.searchBarStyle  = UISearchBarStyleProminent;
       [YYTools ChangeView:_BrandSearchBar RadiusSize:10 BorderColor:YYHexColor(@"#FFD409")];
        
       UITextField *textField = _BrandSearchBar.BYNGetSearchTextFiled;
       textField.backgroundColor = [UIColor colorWithRed:255/255.0 green:254/255.0 blue:248/255.0 alpha:1.0];
       UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10 , 17 , 17)];
       imageView.backgroundColor = [UIColor clearColor];
       imageView.image = [UIImage imageNamed:@"HomeSearch"];
       textField.leftView = imageView;
       NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc]initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName:YY99Color,NSFontAttributeName:[UIFont systemFontOfSize:12]}];
       textField.attributedPlaceholder = arrStr;
        
        
   }
    
    return _BrandSearchBar;
    
}




#pragma mark 创建头部滑动视图

-(void)CreateBrandBaseViewController{
    // 标题栏
    [self setupTitlesView];
    // 添加下划线的
    [self setupTitleUnderline];
    // scrollView
    [self setupScrollView];
    // 添加第0个子控制器的view
    [self addChildVcViewIntoScrollView:0];
   
}

/**
 *  标题栏
 */
- (void)setupTitlesView{
    
    // 文字
    UIScrollView * TitlescrollView = [[UIScrollView alloc] init];
    TitlescrollView.backgroundColor = [UIColor whiteColor];
    TitlescrollView.frame = CGRectMake(0, YYBarHeight, YYScreenWidth, 40);
    TitlescrollView.showsHorizontalScrollIndicator = NO;
    TitlescrollView.showsVerticalScrollIndicator = NO;
    TitlescrollView.pagingEnabled = YES;
    TitlescrollView.bounces = YES;
    TitlescrollView.scrollsToTop = YES;
    [self.view addSubview:TitlescrollView];
    self.titleScrollView = TitlescrollView;
    
    // 标题栏按钮
    [self setupTitleButtons];
    

}

/**
 *  标题下划线
 */
- (void)setupTitleUnderline
{
    // 标题按钮
    UIButton * firstTitleButton = self.titleScrollView.subviews.firstObject;
    // 下划线
    UIView *titleUnderline = [[UIView alloc] init];
    titleUnderline.ZLP_height = 3;
    titleUnderline.ZLP_y = self.titleScrollView.ZLP_height - titleUnderline.ZLP_height;
    titleUnderline.backgroundColor = YYHexColor(@"#FFD409");
    [self.titleScrollView addSubview:titleUnderline];
    self.titleUnderline = titleUnderline;
    
    // 切换按钮状态
    firstTitleButton.selected = YES;
    firstTitleButton.titleLabel.font = [UIFont systemFontOfSize:17 weight:2];
    self.previousClickedTitleButton = firstTitleButton;
    
    [firstTitleButton.titleLabel sizeToFit]; // 让label根据文字内容计算尺寸
    self.titleUnderline.ZLP_width = firstTitleButton.titleLabel.ZLP_width;
    self.titleUnderline.ZLP_centerX = firstTitleButton.ZLP_centerX;
    
    
}


/**
 *  scrollView
 */
- (void)setupScrollView
{
    // 不允许自动修改UIScrollView的内边距
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.frame = CGRectMake(0, YYBarHeight + 40, YYScreenWidth, YYScreenHeight  - 40 - YYTabBarHeight - YYBarHeight);
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = YES;
    scrollView.scrollsToTop = YES;
    // 点击状态栏的时候，这个scrollView不会滚动到最顶部
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 添加子控制器的view
    NSUInteger count = self.childViewControllers.count;
    CGFloat scrollViewW = scrollView.ZLP_width;
    scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
    
    
}



/**
 *  标题栏按钮
 */
- (void)setupTitleButtons{
    
    NSUInteger count = self.BrandTitleModelArray.count;
    
    //设置标题滚动条
    self.titleScrollView.contentSize = CGSizeMake(count * HomelabelWith, 0);
    
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    // 标题按钮的尺寸
    CGFloat titleButtonW = HomelabelWith;
    
    CGFloat titleButtonH = 22;
    //每行间距
    CGFloat rowMargin = 0;
    
    // 创建3个标题按钮
    for (NSUInteger i = 0; i < count; i++) {
        
        CGFloat X =  i * titleButtonW + rowMargin*(i + 1) ;
        UIButton *titleButton = [[UIButton alloc]init];
        [titleButton setTitleColor:YY22Color forState:UIControlStateSelected];
        [titleButton setTitleColor:YY66Color forState:UIControlStateNormal];
        titleButton.titleLabel.hidden = YES;
        // frame
        titleButton.frame = CGRectMake(X , 10, titleButtonW, titleButtonH);
        [titleButton setAdjustsImageWhenHighlighted:NO];
        titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        titleButton.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.layer.masksToBounds = YES;
        titleButton.layer.cornerRadius = 10;
        [self.titleScrollView addSubview:titleButton];
        [titleButton setTitle:self.BrandTitleModelArray[i].name forState:UIControlStateNormal];
        
    }

    
}



#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 求出标题按钮的索引
    NSUInteger index = scrollView.contentOffset.x / scrollView.ZLP_width;
    // 点击对应的标题按钮
    UIButton * titleButton = self.titleScrollView.subviews[index];
    
    [self titleButtonClick:titleButton];
    
}


#pragma mark - titbuttonclick

-(void)titleButtonClick:(UIButton*)titleButton{
    
    // 切换按钮状态
    self.previousClickedTitleButton.selected = NO;
    self.previousClickedTitleButton.titleLabel.font =[UIFont systemFontOfSize:14];
    titleButton.selected = YES;
    self.previousClickedTitleButton = titleButton;
    titleButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:2];

    NSUInteger index = titleButton.tag;

    [UIView animateWithDuration:0.25 animations:^{
        // 滚动scrollView
        self.titleUnderline.ZLP_width = titleButton.titleLabel.ZLP_width + 10;
        self.titleUnderline.ZLP_centerX = titleButton.ZLP_centerX;
        CGFloat offsetX = self.scrollView.ZLP_width * index;
        int RowCount =  YYScreenWidth / HomelabelWith /2 ;
        
        if (index > RowCount) {
            
           self.titleScrollView.contentOffset = CGPointMake(HomelabelWith * (index -  1), 0);
            
        }else{
            
           
         }
        self.scrollView.contentOffset = CGPointMake(offsetX, self.scrollView.contentOffset.y);
        
      
    } completion:^(BOOL finished) {
        // 添加子控制器的view
        [self addChildVcViewIntoScrollView:index];
        
    }];
  
    // 设置index位置对应的tableView.scrollsToTop = YES， 其他都设置为NO
    for (NSUInteger i = 0; i < self.childViewControllers.count; i++) {
        UIViewController *childVc = self.childViewControllers[i];
        // 如果view还没有被创建，就不用去处理
        if (!childVc.isViewLoaded) continue;
        UIScrollView *scrollView = (UIScrollView *)childVc.view;
        if (![scrollView isKindOfClass:[UIScrollView class]]) continue;
        scrollView.scrollsToTop = (i == index);
        
    }
    
    
}

/**
 *  添加第index个子控制器的view到scrollView中
 */
- (void)addChildVcViewIntoScrollView:(NSUInteger)index{
    
    UIViewController * childVc = self.childViewControllers[index];
    
    // 如果view已经被加载过，就直接返回
    if (childVc.isViewLoaded) return;
    
    // 取出index位置对应的子控制器view
    UIView *childVcView = childVc.view;
    
    // 设置子控制器view的frame
    CGFloat scrollViewW = self.scrollView.ZLP_width;
    childVcView.frame = CGRectMake(index * scrollViewW, 0, scrollViewW, self.scrollView.ZLP_height);
    // 添加子控制器的view到scrollView中
    [self.scrollView addSubview:childVcView];
    
    
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

    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
     if (self.BrandSearchBar.text.length == 0) {
           
         UITextField *textField = self.BrandSearchBar.BYNGetSearchTextFiled;
           
         [textField shake];
         
         return;
     }
    
     BrandSearchCollectionViewController * Search = [[BrandSearchCollectionViewController alloc]init];
     Search.title = @"搜索";
     Search.SearchText = self.BrandSearchBar.text;
     [self.navigationController pushViewController:Search animated:YES];
    
}


// called when keyboard search button pressed
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    return YES;
    
    
}






@end

//
//  MyNewCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyNewCollectionViewController.h"
#import "CouponCollectionViewCell.h"
#import "YYOrderHeadView.h"
#import "NewsModel.h"
#import "NewArticlesModel.h"
#import "MyNewImgCollectionViewCell.h"

@interface MyNewCollectionViewController ()

@property(nonatomic,strong)YYOrderHeadView * HeadView;

@property(nonatomic,strong)NSArray * NewsListArray;

@property(nonatomic,strong)NSArray<NewArticlesModel*> * ArticlesListArray;

@property(nonatomic,strong)NSMutableArray * TitleArray;


@property(nonatomic,strong)NSString * news_cid;

@end

@implementation MyNewCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.TitleArray = [NSMutableArray array];
    
    self.news_cid = @"5";
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[MyNewImgCollectionViewCell class] forCellWithReuseIdentifier:@"MyNewImgCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetNewControllersNetData];
    
    
}


#pragma mark  多个网络请求结束后在这里处理数据


-(void)GetNewControllersNetData{
    
    //网络请求1
     RACSignal * signal1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      
         NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserArticleCategories];
         
         [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
                  
              NSArray * DataArray = EncodeArrayFromDic(responseObject, @"data");
             
              self.news_cid = EncodeStringFromDic(DataArray[0], @"id");
             
              [subscriber sendNext:DataArray];
             
          } failure:^(NSError *error, id responseCache) {
                   
              [subscriber sendNext:responseCache];

          }];
         
         return  nil;
         
     }];
         
    //网络请求2
     RACSignal * signal2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserArticles];
         
        NSDictionary * dict = @{@"cid":self.news_cid};
         
        [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
                
             NSDictionary * Datadic = EncodeDicFromDic(responseObject, @"data");
            
             NSArray * DataArray = EncodeArrayFromDic(Datadic, @"data");
            
             [subscriber sendNext:DataArray];
            
         } failure:^(NSError *error, id responseCache) {
                   
              [subscriber sendNext:responseCache];
           
         }];
         
          return  nil;
         
     }];
     
    
     [self rac_liftSelector:@selector(updateUIPic:pic2:) withSignalsFromArray:@[signal1,signal2]];
    
}

- (void)updateUIPic:(id)pic1 pic2:(id)pic2{
  
    NSArray * NetData1 = (NSArray*)pic1;
    
    NSArray * NetData2 = (NSArray*)pic2;
    
    self.NewsListArray =  [NSArray modelArrayWithClass:[NewsModel class] json:NetData1];
    
    self.ArticlesListArray =  [NSArray modelArrayWithClass:[NewArticlesModel class] json:NetData2];
               
    for (NewsModel * Model in self.NewsListArray) {
                   
        [self.TitleArray addObject:Model.name];
                   
    }
 
    
    [self.collectionView reloadData];
    
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
      return self.ArticlesListArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
      MyNewImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyNewImgCollectionViewCell" forIndexPath:indexPath];
    
      [cell.MainImgView setImageURL:[NSURL URLWithString: self.ArticlesListArray[indexPath.item].cover]];
    
       return cell;
    
}

#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YYWebViewController * WebVc = [[YYWebViewController alloc]init];
    WebVc.title = self.ArticlesListArray[indexPath.item].title;
    WebVc.WebUrlString = self.ArticlesListArray[indexPath.item].page_url;
    [self.navigationController pushViewController:WebVc animated:YES];
    
}


#pragma mark <UICollectionViewDelegate>


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake(YYScreenWidth , 128 );
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
       return (CGSize){YYScreenWidth,40};
    
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
        
        if (self.TitleArray.count> 0) {
            
            [headerView addSubview:self.HeadView];
            
            self.HeadView.TitleArray = self.TitleArray;
        }
     
        return headerView;
    
    }
    
    return nil;
    
}

/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
- (YYOrderHeadView *)HeadView
{
    
    if (_HeadView== nil) {
        
        _HeadView = [[YYOrderHeadView alloc] initWithFrame:CGRectMake(0, 0 , YYScreenWidth , 40)];
        
        _HeadView.backgroundColor = UIColor.whiteColor;
        
        _HeadView.TitleBtnBlockClick = ^(NSInteger TagIndex) {
            
           
            
            
        };
     
     }
    
    return _HeadView;
    
}


#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
      return UIEdgeInsetsMake(10, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 10;
    
}

@end

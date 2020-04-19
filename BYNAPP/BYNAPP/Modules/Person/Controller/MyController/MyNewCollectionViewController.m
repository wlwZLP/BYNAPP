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

@property(nonatomic,strong)NSArray<NewsModel*> * NewsListArray;

@property(nonatomic,strong)NSArray<NewArticlesModel*> * ArticlesListArray;

@property(nonatomic,strong)NSMutableArray * TitleArray;

@property(nonatomic,strong)NSString * news_cid;

@property(nonatomic,assign)NSInteger  headReoldCount;

@end

@implementation MyNewCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.TitleArray = [NSMutableArray array];
    
    self.news_cid = @"5";
    
    self.headReoldCount = 0;
    
    self.collectionView.backgroundColor = UIColor.whiteColor;
    
    [self.collectionView registerClass:[MyNewImgCollectionViewCell class] forCellWithReuseIdentifier:@"MyNewImgCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetNewTopHeaderNetData];
    
    
}


#pragma mark  多个网络请求结束后在这里处理数据
-(void)GetNewTopHeaderNetData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserArticleCategories];
    
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
             
         NSArray * DataArray = EncodeArrayFromDic(responseObject, @"data");
        
         self.NewsListArray =  [NSArray modelArrayWithClass:[NewsModel class] json:DataArray];
        
        [self GetNewBotomImgNetData:self.NewsListArray[0].news_id];
        
        for (NewsModel * Model in self.NewsListArray) {
                       
            [self.TitleArray addObject:Model.name];
                       
        }
        
     } failure:^(NSError *error, id responseCache) {
              
          [self GetNewBotomImgNetData:@"0"];
         
     }];
    
    
}


-(void)GetNewBotomImgNetData:(NSString*)NewCid{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserArticles];
     
    NSDictionary * dict = @{@"cid":NewCid};
     
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
            
         NSDictionary * Datadic = EncodeDicFromDic(responseObject, @"data");
        
         NSArray * DataArray = EncodeArrayFromDic(Datadic, @"data");
        
         self.ArticlesListArray =  [NSArray modelArrayWithClass:[NewArticlesModel class] json:DataArray];
                   
//        for (int i = 0; i < self.ArticlesListArray.count ; i ++ ) {
//            [self.collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:i inSection:0], nil]];
//        }
         [self.collectionView reloadData];
        
     } failure:^(NSError *error, id responseCache) {
                
       
     }];
    
    
}


-(void)GetNewData{
    
    //网络请求1
     RACSignal * signal1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      
           return  nil;
         
     }];
         
    //网络请求2
     RACSignal * signal2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
          return  nil;
         
     }];
     
    
     [self rac_liftSelector:@selector(updateUIPic:pic2:) withSignalsFromArray:@[signal1,signal2]];
    
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
        
        if (self.TitleArray.count> 0 && self.headReoldCount == 0) {
            
            [headerView addSubview:self.HeadView];
            
            self.HeadView.TitleArray = self.TitleArray;
            
            self.headReoldCount ++;
            
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
- (YYOrderHeadView *)HeadView{
    
    if (_HeadView== nil) {
        
        _HeadView = [[YYOrderHeadView alloc] initWithFrame:CGRectMake(0, 0 , YYScreenWidth , 40)];
        
        _HeadView.backgroundColor = UIColor.whiteColor;
        
        _HeadView.TitleBtnBlockClick = ^(NSInteger TagIndex) {
            
           [self GetNewBotomImgNetData:self.NewsListArray[TagIndex].news_id];
            
            
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

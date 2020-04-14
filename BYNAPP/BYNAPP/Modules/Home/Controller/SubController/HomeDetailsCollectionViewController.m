//
//  DetailsCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeDetailsCollectionViewController.h"
#import "GoodsTopCollectionViewCell.h"
#import "GoodsTitleCollectionViewCell.h"
#import "GoodsCouponCollectionViewCell.h"
#import "GoodsCourseCollectionViewCell.h"
#import "GoodsShopCollectionViewCell.h"
#import "GoodsDetailsCollectionViewCell.h"
#import "GoodsSameCollectionViewCell.h"


@interface HomeDetailsCollectionViewController ()<UISearchBarDelegate>

@property(nonatomic,strong)UISearchBar * GoodsSearchBar;

@property(nonatomic,assign)BOOL  ISHideVipRule;

@property(nonatomic,assign)BOOL  ISHideGoodsDetails;

@property(nonatomic,strong)NSDictionary * DetailsDic;


@end

@implementation HomeDetailsCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.ISHideVipRule = YES;
    
    self.ISHideGoodsDetails = NO;
    
    self.collectionView.frame = CGRectMake(0, -YYBarHeight , YYScreenWidth, YYScreenHeight + YYBarHeight - 55);
    
    self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    self.collectionView.backgroundColor = YYBGColor;
   
    [self.collectionView registerClass:[GoodsTopCollectionViewCell class] forCellWithReuseIdentifier:@"GoodsTopCollectionViewCell"];
    
    [self.collectionView registerClass:[GoodsTitleCollectionViewCell class] forCellWithReuseIdentifier:@"GoodsTitleCollectionViewCell"];
    
    [self.collectionView registerClass:[GoodsCouponCollectionViewCell class] forCellWithReuseIdentifier:@"GoodsCouponCollectionViewCell"];
    
    [self.collectionView registerClass:[GoodsCourseCollectionViewCell class] forCellWithReuseIdentifier:@"GoodsCourseCollectionViewCell"];
    
    [self.collectionView registerClass:[GoodsShopCollectionViewCell class] forCellWithReuseIdentifier:@"GoodsShopCollectionViewCell"];
    
    [self.collectionView registerClass:[GoodsDetailsCollectionViewCell class] forCellWithReuseIdentifier:@"GoodsDetailsCollectionViewCell"];
    
    [self.collectionView registerClass:[GoodsSameCollectionViewCell class] forCellWithReuseIdentifier:@"GoodsSameCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];

}



-(void)viewWillAppear:(BOOL)animated{
        
    UIView * barImageView = self.navigationController.navigationBar.subviews.firstObject;
    
    [barImageView addSubview:self.GoodsSearchBar];
    
    barImageView.alpha = 0.0;
    
    [self getHomeGoodsDetailsNetData];
        
}


-(void)getHomeGoodsDetailsNetData{
    
    dispatch_group_t group = dispatch_group_create();
    
    [self loadPartOne:group];
    
    [self loadPartTwo:group];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        [self.collectionView reloadData];
      
    });
    
    
}

-(void)loadPartOne:(dispatch_group_t)group{
    
    dispatch_group_enter(group);
    
     NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsDetail];
    
     NSDictionary * dict ;
     
     if (self.activity_id.length == 0) {
         dict = @{@"item_id":self.item_id,@"mall_id":self.Goods_Type};
     }else{
         dict = @{@"item_id":self.item_id,@"mall_id":self.Goods_Type,@"activity_id":self.activity_id};
     }
     
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
        
//         YYNSLog(@"商品详情数据-----%@",responseObject);
        self.DetailsDic = EncodeDicFromDic(responseObject, @"data");
        
         dispatch_group_leave(group);
        
    } failure:^(NSError *error, id responseCache) {
        
        
        dispatch_group_leave(group);
        
    }];
         

}


-(void)loadPartTwo:(dispatch_group_t)group{
    
    dispatch_group_enter(group);

    NSDictionary * dict = @{@"id":self.item_id,@"page":@"1"};
               
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsSimlarItems];

    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
        
//        YYNSLog(@"相似商品-----%@",responseObject);
        
         dispatch_group_leave(group);
        
    } failure:^(NSError *error, id responseCache) {
        
        
        dispatch_group_leave(group);
        
        
    }];
    
    
}


    
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat minAlphaOffset = - 88;
    CGFloat maxAlphaOffset = 200;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha;
    if (offset <= 0) {
        alpha = 0.0;
    } else {
        alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    }
    UIView *barImageView = self.navigationController.navigationBar.subviews.firstObject;
    barImageView.alpha = alpha;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

      return 7;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   
    if (section == 6) {
        return 10;
    }
    return 1;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        GoodsTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsTopCollectionViewCell" forIndexPath:indexPath];
        
        cell.ImgListArray = EncodeArrayFromDic(self.DetailsDic, @"images");
        
        return cell;
        
    }else if (indexPath.section == 1){
        
        GoodsTitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsTitleCollectionViewCell" forIndexPath:indexPath];

        return cell;
        
    }else if (indexPath.section == 2){
        
        GoodsCouponCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsCouponCollectionViewCell" forIndexPath:indexPath];

        return cell;
        
    }else if (indexPath.section == 3){
        
        GoodsCourseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsCourseCollectionViewCell" forIndexPath:indexPath];

        return cell;
        
    }else if (indexPath.section == 4){
        
        GoodsShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsShopCollectionViewCell" forIndexPath:indexPath];

        return cell;
        
    }else if (indexPath.section == 5){
        
        GoodsDetailsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsDetailsCollectionViewCell" forIndexPath:indexPath];

        return cell;
        
    }else{
       
        GoodsSameCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsSameCollectionViewCell" forIndexPath:indexPath];

        return cell;
        
    }


}



#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    
    
}


#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
       return CGSizeMake(YYScreenWidth , YYScreenWidth * 0.9);
        
    }else if (indexPath.section == 1){
        
       return CGSizeMake(YYScreenWidth , 110);
        
    }else if (indexPath.section == 2){
        
       return CGSizeMake(YYScreenWidth , (YYScreenWidth - 24) * 0.21 + 10);
        
    }else if (indexPath.section == 3){
        
       return CGSizeMake(YYScreenWidth , (YYScreenWidth - 24) * 0.17 + 20);
        
    }else if (indexPath.section == 4){
        
       return CGSizeMake(YYScreenWidth , 90);
        
    }else if (indexPath.section == 5){
        
       return CGSizeMake(YYScreenWidth , 44);
        
    }else{
       
       return CGSizeMake((YYScreenWidth -16)/2  , (YYScreenWidth -16)/2 + 80);
        
    }
     
}



#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 6) {
        return (CGSize){YYScreenWidth,50};
    }
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
        
        UILabel * TitleLabel = [[UILabel alloc]init];
        TitleLabel.text = @"—— 相似推荐 ——";
        TitleLabel.textColor = YY66Color;
        TitleLabel.frame = CGRectMake((YYScreenWidth -180)/2, 16, 180, 25);
        TitleLabel.textAlignment = NSTextAlignmentCenter;
        TitleLabel.font = [UIFont systemFontOfSize:14 weight:0];
        [headerView addSubview:TitleLabel];
     
        return headerView;
    
    }
    
    return nil;
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    if (section == 6) {
        return UIEdgeInsetsMake(0, 8, 0, 8);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
      return 8;
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
     return 0;
    
}



/**
 *  懒加载UISearchBar
 *
 *  @return SalesSearchBar
 */
- (UISearchBar *)GoodsSearchBar{
    
    if (_GoodsSearchBar== nil) {
        
       _GoodsSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(38, YYStatusHeight + 6 , YYScreenWidth - 50 , 32)];
        _GoodsSearchBar.backgroundColor = YYHexColor(@"#F6F6F6");
       _GoodsSearchBar.showsCancelButton = NO;
       _GoodsSearchBar.tintColor = [UIColor orangeColor];
       _GoodsSearchBar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor]];
       _GoodsSearchBar.placeholder = @"搜索更多商品";
       _GoodsSearchBar.delegate = self;
       _GoodsSearchBar.searchBarStyle  = UISearchBarStyleProminent;
        [YYTools ChangeView:_GoodsSearchBar RadiusSize:16 BorderColor:UIColor.whiteColor];
        UITextField *textField = _GoodsSearchBar.BYNGetSearchTextFiled;
        textField.backgroundColor  = YYHexColor(@"#F6F6F6");;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10 , 17 , 17)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.image = [UIImage imageNamed:@"yuanquan"];
        textField.leftView = imageView;
        
        NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc]initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName:YYHexColor(@"#B2B2B2"),NSFontAttributeName:[UIFont systemFontOfSize:13]}];
        textField.attributedPlaceholder = arrStr;
        
    }
    
    return _GoodsSearchBar;
    
}




 
@end

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
#import "HomeSearchCollectionViewController.h"

@interface HomeDetailsCollectionViewController ()<WKUIDelegate, WKNavigationDelegate,UISearchBarDelegate>

@property(nonatomic,strong)UISearchBar * GoodsSearchBar;

@property(nonatomic,strong)UIButton * TopSearchBtn;

@property(nonatomic,assign)BOOL  ISHideVipRule;

@property(nonatomic,assign)BOOL  ISHideGoodsDetails;

@property(nonatomic,strong)NSDictionary * DetailsDic;

@property(nonatomic,strong)UIButton * RightBuyBtn;

@property(nonatomic,strong)UIButton * RightCollectBtn;

@property (nonatomic, strong)UIScrollView * WKScrollView;

@property (nonatomic, strong)WKWebView * GoodSWKWebView;

@property (nonatomic, assign)CGFloat webViewHeight;

@property(nonatomic, strong)NSArray<HomeMainModel*> * SimlarListArray;

@end

@implementation HomeDetailsCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.ISHideVipRule = YES;
    
    self.ISHideGoodsDetails = NO;
    
    self.webViewHeight = 1;
    
    self.view.backgroundColor = UIColor.redColor;
    
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
    
    [self CreateGoodsDetailsBottomView];

}



-(void)viewWillAppear:(BOOL)animated{
        
    UIView * barImageView = self.navigationController.navigationBar.subviews.firstObject;
    
    barImageView.alpha = 0.0;
    
    [barImageView addSubview:self.GoodsSearchBar];
   
    [self getHomeGoodsDetailsNetData];
        
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [self.GoodsSearchBar removeFromSuperview];
    
}


-(UIButton*)TopSearchBtn{
    
    if (_TopSearchBtn == nil) {
        _TopSearchBtn = [[UIButton alloc]init];
        _TopSearchBtn.frame = CGRectMake(0, 0, YYScreenWidth, YYBarHeight);
        _TopSearchBtn.backgroundColor = [UIColor clearColor];
        [_TopSearchBtn addTarget:self action:@selector(TopBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _TopSearchBtn;
    
}

-(void)TopBtnClick{
    
    
    
}

#pragma mark ===============创建下面UIview控制=============

-(void)CreateGoodsDetailsBottomView{
    
    
    UIView * BottomView = [[UIView alloc]init];
    BottomView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:BottomView];
    [BottomView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.collectionView.mas_bottom).with.offset(0);
       make.left.equalTo(self.view.mas_left).with.offset(0);
       make.right.equalTo(self.view.mas_right).with.offset(0);
       make.height.offset(55);
    }];
    
    UIImageView * HomeImage = [[UIImageView alloc] init];
    HomeImage.backgroundColor = [UIColor clearColor];
    HomeImage.frame = CGRectMake(24, 10, 20, 20);
    HomeImage.image = [UIImage imageNamed:@"icon_tabbar_homepage"];
    [BottomView addSubview:HomeImage];
    [HomeImage addTarget:self action:@selector(HomeImgClick)];
    
    UILabel * HomeLabel = [[UILabel alloc]init];
    HomeLabel.text = @"首页";
    HomeLabel.frame = CGRectMake(22, 35 , 24, 15);
    HomeLabel.textColor = YY33Color;
    HomeLabel.textAlignment = NSTextAlignmentCenter;
    HomeLabel.font = [UIFont systemFontOfSize:10 weight:0];
    [BottomView addSubview:HomeLabel];
    
    
    UIButton * CollectImage = [[UIButton alloc] init];
    CollectImage.backgroundColor = [UIColor clearColor];
    CollectImage.frame = CGRectMake(68, 10, 21, 19);
    [CollectImage setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
    [CollectImage setImage:[UIImage imageNamed:@"redax"] forState:UIControlStateSelected];
    [BottomView addSubview:CollectImage];
    [CollectImage addTarget:self action:@selector(CollectImgClick) forControlEvents:UIControlEventTouchUpInside];
    self.RightCollectBtn = CollectImage;
    
    UILabel * CollectLabel = [[UILabel alloc]init];
    CollectLabel.text = @"收藏";
    CollectLabel.frame = CGRectMake(67, 35 , 24, 15);
    CollectLabel.textColor = YY33Color;
    CollectLabel.textAlignment = NSTextAlignmentCenter;
    CollectLabel.font = [UIFont systemFontOfSize:10 weight:0];
    [BottomView addSubview:CollectLabel];
    
    
#pragma mark ===============分享商品按钮=============
    UIButton * ShareButton = [[UIButton alloc]init];
    ShareButton.backgroundColor = YYHexColor(@"#FFEC91");
    ShareButton.frame = CGRectMake(YYScreenWidth - 260 , 7 , 124, 40);
    [ShareButton setTitle:@"分享商品" forState:UIControlStateNormal];
    [ShareButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [ShareButton addTarget:self action:@selector(ShareButtonClick) forControlEvents:UIControlEventTouchUpInside];
    ShareButton.titleLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [BottomView addSubview:ShareButton];
    UIBezierPath * LeftPath = [UIBezierPath bezierPathWithRoundedRect:ShareButton.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(17,17)];
    CAShapeLayer *LeftLayer = [[CAShapeLayer alloc] init];
    LeftLayer.frame = ShareButton.bounds;
    LeftLayer.path = LeftPath.CGPath;
    ShareButton.layer.mask = LeftLayer;

#pragma mark ===============立即购买商品按钮=============
    UIButton * BuyButton = [[UIButton alloc]init];
    BuyButton.backgroundColor = YYHexColor(@"#FFD409");
    BuyButton.frame = CGRectMake(YYScreenWidth - 136 , 7 , 124, 40);
    [BuyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [BuyButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    BuyButton.titleLabel.font = [UIFont systemFontOfSize:15 weight:0];
    [BuyButton addTarget:self action:@selector(BottomBuyButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:BuyButton];
    UIBezierPath * RightPath = [UIBezierPath bezierPathWithRoundedRect:BuyButton.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(17,17)];
    CAShapeLayer * RightLayer = [[CAShapeLayer alloc] init];
    RightLayer.frame = BuyButton.bounds;
    RightLayer.path = RightPath.CGPath;
    BuyButton.layer.mask = RightLayer;
    self.RightBuyBtn = BuyButton;
    
 
}


#pragma mark ===============回到首页============
-(void)HomeImgClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

#pragma mark ===============收藏事件============
-(void)CollectImgClick{
    
    if (self.RightCollectBtn.selected == YES) {
        
        
        
    }else{
        
       NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserCollect];
           
       NSDictionary * dict = @{@"item_type":EncodeStringFromDic(self.DetailsDic, @"mall_id"),@"item_id":self.item_id,@"price":EncodeStringFromDic(self.DetailsDic, @"mall_id"),@"title":EncodeStringFromDic(self.DetailsDic, @"title"),@"cover_image":EncodeStringFromDic(self.DetailsDic, @"cover_image")};
         
       [PPNetworkTools POST:url parameters:dict success:^(id responseObject) {
               
            self.RightCollectBtn.selected = YES;
            
       } failure:^(NSError *error, id responseCache) {
               
          
               
        }];
        
    }
    
   
}

#pragma mark ===============分享点击事件============
-(void)ShareButtonClick{
    
    
    
}
#pragma mark ===============购买点击事件=============
-(void)BottomBuyButtonClick{
    
    
    
}

#pragma mark ===============网络请求=============

-(void)getHomeGoodsDetailsNetData{
    
    dispatch_group_t group = dispatch_group_create();
    
    [self loadPartOne:group];
    
    [self loadPartTwo:group];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       
        if ([EncodeStringFromDic(self.DetailsDic, @"is_collect") isEqualToString:@"1"]) {
            self.RightCollectBtn.selected = YES;
        }else{
            self.RightCollectBtn.selected = NO;
        }
        
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
        
         YYNSLog(@"商品详情数据-----%@",responseObject);
        
         self.DetailsDic = EncodeDicFromDic(responseObject, @"data");
        
         dispatch_group_leave(group);
        
    } failure:^(NSError *error, id responseCache) {
        
        self.DetailsDic = EncodeDicFromDic(responseCache, @"data");
        
        dispatch_group_leave(group);
        
    }];
         

}


-(void)loadPartTwo:(dispatch_group_t)group{
    
    dispatch_group_enter(group);

    NSDictionary * dict = @{@"id":self.item_id,@"page":@"1"};
               
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsSimlarItems];

    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
        
        NSDictionary * DataDic =  EncodeDicFromDic(responseObject, @"data");
        
        self.SimlarListArray = [NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(DataDic, @"items")];
        
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
        return self.SimlarListArray.count;
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
        
        [cell.Logoimage setImageWithURL:[NSURL URLWithString:EncodeStringFromDic(self.DetailsDic, @"mall_icon")] placeholder:[UIImage imageNamed:@"iqiyi"]];
        
        cell.TitleLabel.text =  [NSString stringWithFormat:@"      %@",EncodeStringFromDic(self.DetailsDic, @"title")];
        
        cell.CouponPriceLabel.text = [NSString stringWithFormat:@"￥%@券后价",EncodeStringFromDic(self.DetailsDic, @"discount_price")];
        NSMutableAttributedString * CouponString = [[NSMutableAttributedString alloc] initWithString:cell.CouponPriceLabel.text];
        NSRange Range1 = NSMakeRange(0, 1);
        NSRange Range2 = NSMakeRange(cell.CouponPriceLabel.text.length - 3, 3);
        [CouponString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:Range1];
        [CouponString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:Range2];
        [cell.CouponPriceLabel setAttributedText:CouponString];
        
        cell.GainMoneyLabel.text = [NSString stringWithFormat:@"%@",EncodeStringFromDic(self.DetailsDic, @"coupon_money_text")];
        
        cell.OldPriceLabel.text = [NSString stringWithFormat:@"原价￥%@",EncodeStringFromDic(self.DetailsDic, @"price")];
        NSMutableAttributedString *  abs = [[NSMutableAttributedString alloc]initWithString:cell.OldPriceLabel.text];
        [abs addAttribute:NSStrikethroughStyleAttributeName value:@(2) range:NSMakeRange(0, cell.OldPriceLabel.text.length)];
        cell.OldPriceLabel.attributedText = abs;
        
        cell.SaleNumLabel.text = [NSString stringWithFormat:@"已售%@件",EncodeStringFromDic(self.DetailsDic, @"month_sales")];
        
        return cell;
        
    }else if (indexPath.section == 2){
        
        GoodsCouponCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsCouponCollectionViewCell" forIndexPath:indexPath];
        
        cell.CouponLabel.text = [NSString stringWithFormat:@"%@元优惠券",EncodeStringFromDic(self.DetailsDic, @"coupon_money")];
        NSMutableAttributedString * CouponStr = [[NSMutableAttributedString alloc] initWithString:cell.CouponLabel.text];
        NSRange Range1 = NSMakeRange(0, EncodeStringFromDic(self.DetailsDic, @"coupon_money").length);
        [CouponStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:Range1];
        [cell.CouponLabel setAttributedText:CouponStr];
        
        cell.TimeLabel.text = [NSString stringWithFormat:@"%@-%@",EncodeStringFromDic(self.DetailsDic, @"coupon_starttime"),EncodeStringFromDic(self.DetailsDic, @"coupon_endtime")];
        
        cell.DrawLabelBlockClick = ^{
            
            [self YYShowAlertViewTitle:@"立即领取"];
            
        };

        return cell;
        
    }else if (indexPath.section == 3){
        
        GoodsCourseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsCourseCollectionViewCell" forIndexPath:indexPath];

        return cell;
        
    }else if (indexPath.section == 4){
        
        GoodsShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsShopCollectionViewCell" forIndexPath:indexPath];
  
        [cell.ShopImgview setImageWithURL:[NSURL URLWithString:EncodeStringFromDic(self.DetailsDic, @"shop_logo")] placeholder:[UIImage imageNamed:@"iqiyi"]];
        
        cell.ShopLabel.text = [NSString stringWithFormat:@"%@",EncodeStringFromDic(self.DetailsDic, @"shop_name")];
        
        NSDictionary * des_dic = EncodeDicFromDic(self.DetailsDic, @"dsr_info");
        
        cell.LeftNumLabel.text = [NSString stringWithFormat:@"宝贝描述：%@",EncodeStringFromDic(des_dic, @"descriptionMatch")];
        
        cell.CenterNumLabel.text = [NSString stringWithFormat:@"卖家服务：%@",EncodeStringFromDic(des_dic, @"serviceAttitude")];
        
        cell.RightNumLabel.text = [NSString stringWithFormat:@"处理速度：%@",EncodeStringFromDic(des_dic, @"deliverySpeed")];
        
        return cell;
        
    }else if (indexPath.section == 5){
        
        GoodsDetailsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsDetailsCollectionViewCell" forIndexPath:indexPath];
        
        [cell.contentView addSubview:self.GoodSWKWebView];
         
        cell.OpenDeatilsBtnBlockClick = ^(NSInteger ClickIndex) {
           
            
            if (ClickIndex == 0) {
                
                self.webViewHeight = 5000;
                          
                self.GoodSWKWebView.frame = CGRectMake(0, 44, YYScreenWidth, self.webViewHeight);

                [self.GoodSWKWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:EncodeStringFromDic(self.DetailsDic, @"detail_web_url")]]];
                          
                [self.collectionView reloadData];
                
            }else{
                
                self.webViewHeight = 0;
                          
                self.GoodSWKWebView.frame = CGRectMake(0, 44, YYScreenWidth, self.webViewHeight);

                [self.GoodSWKWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:EncodeStringFromDic(self.DetailsDic, @"detail_web_url")]]];
                          
                [self.collectionView reloadData];
                
                
            }
       
        };

        return cell;
        
    }else{
       
        GoodsSameCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsSameCollectionViewCell" forIndexPath:indexPath];
        
        cell.Model = self.SimlarListArray[indexPath.item];

        return cell;
        
    }


}



#pragma mark -选中某item进行跳转

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 6) {
        
        HomeDetailsCollectionViewController * HomeVc = [[HomeDetailsCollectionViewController alloc]init];
        HomeVc.Goods_Type = self.SimlarListArray[indexPath.item].mall_id;
        HomeVc.item_id = self.SimlarListArray[indexPath.item].item_id;
        HomeVc.activity_id = self.SimlarListArray[indexPath.item].activity_id;
        [self.navigationController pushViewController:HomeVc animated:YES];
        
    }
    
    
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
        
       return CGSizeMake(YYScreenWidth , 44 + self.webViewHeight);
        
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




#pragma mark ===============GoodsSearchBar=============
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


#pragma mark - UISearchBardelegete
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    HomeSearchCollectionViewController * Search = [[HomeSearchCollectionViewController alloc]init];
    [self.navigationController pushViewController:Search animated:YES];
    return NO;
    
}



#pragma mark ===============GoodSWKWebView=============
- (WKWebView *)GoodSWKWebView {
    
    if (!_GoodSWKWebView) {
        
        WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        wkWebConfig.userContentController = wkUController;
        //自适应屏幕的宽度js
        NSString *jSString = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
        WKUserScript *wkUserScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        //添加js调用
        [wkUController addUserScript:wkUserScript];
        
        _GoodSWKWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 44 , YYScreenWidth , self.webViewHeight) configuration:wkWebConfig];
        _GoodSWKWebView.backgroundColor = [UIColor whiteColor];
        _GoodSWKWebView.opaque = NO;
        _GoodSWKWebView.userInteractionEnabled = YES;
        _GoodSWKWebView.scrollView.bounces = NO;
        _GoodSWKWebView.scrollView.bounces = false;
        [_GoodSWKWebView sizeToFit];
        
        if (@available(ios 11.0,*)) {

           _GoodSWKWebView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

        }
        
     }
    
    return _GoodSWKWebView;
    
}




#pragma 监听webView  contentSize 值的变化
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    if ([keyPath isEqualToString:@"contentSize"]) {
        //方法一
        UIScrollView *scrollView = (UIScrollView *)object;
        
        CGFloat height = scrollView.contentSize.height;
        
     
    
     }
    
}


 

 
@end

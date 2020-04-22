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

/** 用来存放所有时间的scrollView */
@property (nonatomic, strong) NSArray<HomeTimeModel*> * TimelistArray;

/** 当前点击的button */
@property (nonatomic, strong) UIButton * OldClickBtn;

@end


@implementation LimitBuyCollectionViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsFlashSaleTimes];
    
    NSDictionary * dict = @{@"mode":@"0"};
                       
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
       
         self.TimelistArray =  [NSArray modelArrayWithClass:[HomeTimeModel class] json:EncodeArrayFromDic(responseObject, @"data")];
     
          [self CreateLimitBuyTopnavView:self.TimelistArray];
               
    } failure:^(NSError *error, id responseCache) {
        
        self.TimelistArray =  [NSArray modelArrayWithClass:[HomeTimeModel class] json:EncodeArrayFromDic(responseCache, @"data")];
        
        [self CreateLimitBuyTopnavView:self.TimelistArray];
                              
    }];
   
    
    self.collectionView.frame = CGRectMake(0, YYBarHeight + 56, YYScreenWidth, YYScreenHeight - YYBarHeight - 56);
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[LimitBuyCollectionViewCell class] forCellWithReuseIdentifier:@"LimitBuyCollectionViewCell"];
    

}

-(void)viewWillAppear:(BOOL)animated{
        
    [self.navigationController setNavigationBarHidden:YES animated:nil];
        
}

#pragma mark 创建头部控件
-(void)CreateLimitBuyTopnavView:(NSArray <HomeTimeModel*> *)TitleListArray{
    
   UIView * TopNavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YYScreenWidth, YYBarHeight + 56)];
   TopNavView.backgroundColor = UIColor.yellowColor;
   [self.view addSubview:TopNavView];
   [TopNavView.layer addSublayer:[YYTools SetGradLayerView:TopNavView FromColor:@"#FFDD39" ToColor:@"#FFD117"]];
   
   UIButton * BackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   [BackBtn setImage:[UIImage imageNamed:@"LeftBack"] forState:UIControlStateNormal];
   [BackBtn setImage:[UIImage imageNamed:@"LeftBack"] forState:UIControlStateHighlighted];
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
    
    
    for (NSUInteger i = 0; i < TitleListArray.count; i++) {
       
       CGFloat X =  i * TimelabelWith ;
       UIButton *titleButton = [[UIButton alloc]init];
       [titleButton setTitleColor:YY66Color forState:UIControlStateNormal];
       [titleButton setTitleColor:YYHexColor(@"#FFD409") forState:UIControlStateSelected];
       [titleButton setBackgroundImage:[UIImage imageWithColor:UIColor.clearColor] forState:UIControlStateNormal];
       [titleButton setBackgroundImage:[UIImage imageWithColor:YYHexColor(@"#312903")] forState:UIControlStateSelected];
       titleButton.titleLabel.hidden = YES;
       titleButton.frame = CGRectMake(X , 10, TimelabelWith, 43);
       [titleButton setAdjustsImageWhenHighlighted:NO];
       titleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
       titleButton.titleLabel.font = [UIFont systemFontOfSize: 14.0];
       titleButton.tag = i;
       [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
       titleButton.layer.masksToBounds = YES;
       titleButton.layer.cornerRadius = 10;
       titleButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
       [self.TimeScrollView addSubview:titleButton];
       if ([TitleListArray[i].desc isEqualToString:@"抢购中"]) {
            titleButton.selected = YES;
           self.OldClickBtn  = titleButton;
            [self GetLimitBuyNetWorkData:TitleListArray[i].time];
//           self.titleUnderline.ZLP_centerX = sender.ZLP_centerX;
        }else{
            titleButton.selected = NO;
        }
       NSString * Title = [NSString stringWithFormat:@"%@\n%@",TitleListArray[i].show_time,TitleListArray[i].desc];
       [titleButton setTitle:Title forState:UIControlStateNormal];
   
   }
    
    self.TimeScrollView.contentSize = CGSizeMake(TitleListArray.count * TimelabelWith, 0);
    
}



#pragma mark ===============网络请求=============

-(void)GetLimitBuyNetWorkData:(NSString *)TimeString{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIGoodsFlashSaleItems];
    
    NSDictionary * dict = @{@"time":TimeString,@"mode":@"0",@"page":[NSString stringWithFormat:@"%ld",(long)self.RefreshCount]};
                       
    [PPNetworkTools GET:url parameters:dict success:^(id responseObject) {
       
        NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
        
       [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(Data, @"items")]];
     
        [self.collectionView reloadData];
               
    } failure:^(NSError *error, id responseCache) {
        
        NSDictionary * Data = EncodeDicFromDic(responseCache, @"data");
            
        [self.MainListArray addObjectsFromArray:[NSArray modelArrayWithClass:[HomeMainModel class] json:EncodeArrayFromDic(Data, @"items")]];
         
        [self.collectionView reloadData];
   
    }];
    
    
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
     
    if (Sender.tag ==  self.OldClickBtn.tag) {
        return;
    }else{
        self.OldClickBtn.selected = NO;
        Sender.selected = YES;
        self.OldClickBtn = Sender;
        [self GetLimitBuyNetWorkData:self.TimelistArray[Sender.tag].time];
    }
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

      return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   
    return self.MainListArray.count;
 
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    LimitBuyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LimitBuyCollectionViewCell" forIndexPath:indexPath];

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
    
      return UIEdgeInsetsMake(10, 0, 0, 0);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
      return 0;
}


@end

//
//  OederDetailsCollectionViewController.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/18.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "CouponDetailsCollectionViewController.h"
#import "CouponDetailsTopCollectionViewCell.h"
#import "CouponDetailsCenCollectionViewCell.h"
#import "CouponDetailsBotCollectionViewCell.h"


@interface CouponDetailsCollectionViewController ()

@property(nonatomic,assign)CGFloat StringHeight;

@property(nonatomic,assign)NSString * ContentString;

@end

@implementation CouponDetailsCollectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.StringHeight = 0;
    
    self.collectionView.backgroundColor = YYBGColor;
    
    [self.collectionView registerClass:[CouponDetailsTopCollectionViewCell class] forCellWithReuseIdentifier:@"CouponDetailsTopCollectionViewCell"];
    
    [self.collectionView registerClass:[CouponDetailsCenCollectionViewCell class] forCellWithReuseIdentifier:@"CouponDetailsCenCollectionViewCell"];
    
    [self.collectionView registerClass:[CouponDetailsBotCollectionViewCell class] forCellWithReuseIdentifier:@"CouponDetailsBotCollectionViewCell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    
    [self GetCouponDetailsNetWordData];
    
    self.ContentString = @"使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知使用须知11111111111";
    
    self.StringHeight = [self GetTextStringHeight:self.ContentString font:[UIFont systemFontOfSize:14] Width:YYScreenWidth - 56];
    
     [self.collectionView reloadData];
    
    
}


#pragma mark ===============卡券详情网络接口=============

-(void)GetCouponDetailsNetWordData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIMPVOerdersDetail];

         
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
            
          NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
          
    
       
          
    } failure:^(NSError *error, id responseCache) {
              
        

    }];

    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
     return 3;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == 0) {
        
        CouponDetailsTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CouponDetailsTopCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }else if (indexPath.item == 1){
        
         CouponDetailsCenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CouponDetailsCenCollectionViewCell" forIndexPath:indexPath];
        
         return cell;
        
    }else{
        
        CouponDetailsBotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CouponDetailsBotCollectionViewCell" forIndexPath:indexPath];
      
         cell.ContengString = self.ContentString;
        
         return cell;
        
    }
      
    
}



#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item == 0) {
        return CGSizeMake(YYScreenWidth , 100);
    }else if (indexPath.item == 1){
        return CGSizeMake(YYScreenWidth , 260);
    }else{
       return CGSizeMake(YYScreenWidth , 65 + self.StringHeight);
    }
 
    
   
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

#pragma mark 获取字符串高度

- (CGFloat)GetTextStringHeight:(NSString *)text font:(UIFont *)font Width:(CGFloat)width {
    // 设置文字属性 要和label的一致
    NSDictionary *attrs = @{NSFontAttributeName :font};
    
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);

    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;

    // 计算文字占据的宽高
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;

   // 当你是把获得的高度来布局控件的View的高度的时候.size转化为ceilf(size.height)。
    return  ceilf(size.height);
    
}


@end

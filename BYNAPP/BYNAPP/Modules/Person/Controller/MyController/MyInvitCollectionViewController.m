//
//  MyInvitCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MyInvitCollectionViewController.h"
#import "InvitImgCollectionViewCell.h"

@interface MyInvitCollectionViewController ()

@property(nonatomic,strong)NSArray *  PostersArray;

@end

@implementation MyInvitCollectionViewController


-(instancetype)init{
    
     UICollectionViewFlowLayout * flowLayout = [UICollectionViewFlowLayout new];
     flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
     flowLayout.itemSize = CGSizeMake(YYScreenWidth, 50);
     return [super initWithCollectionViewLayout:flowLayout];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self GetPersonInVitNetWordData];
      
    
}

-(void)GetPersonInVitNetWordData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",Common_URL,URL_APIUserInvitePoster];
         
                        
    [PPNetworkTools GET:url parameters:nil success:^(id responseObject) {
                
          NSDictionary * Data = EncodeDicFromDic(responseObject, @"data");
        
          self.PostersArray = EncodeArrayFromDic(Data, @"posters");
           
          [self.collectionView reloadData];
          
    } failure:^(NSError *error, id responseCache) {
              
          NSDictionary * Data = EncodeDicFromDic(responseCache, @"data");
         
          self.PostersArray = EncodeArrayFromDic(Data, @"posters");
        
          [self.collectionView reloadData];

    }];

    
}


-(void)viewWillAppear:(BOOL)animated{
    
   self.view.backgroundColor = UIColor.whiteColor;
    
   self.collectionView.backgroundColor = UIColor.whiteColor;
       
   self.collectionView.frame = CGRectMake(0, 0, YYScreenWidth, 1.3 * YYScreenWidth + 200);
   
   self.collectionView.showsHorizontalScrollIndicator = NO;
   
   [self.collectionView registerClass:[InvitImgCollectionViewCell class] forCellWithReuseIdentifier:@"InvitImgCollectionViewCell"];
   
   [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
   
   UIButton * SaveBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, 1.3 * YYScreenWidth + 230 - YYBarHeight , YYScreenWidth - 24 , 45)];
   [SaveBtn addTarget:self action:@selector(SavePosterButtonClick) forControlEvents:UIControlEventTouchUpInside];
   SaveBtn.backgroundColor = YYHexColor(@"#FFD409");
   [SaveBtn setTitleColor:YY22Color forState:UIControlStateNormal];
   [SaveBtn setTitle:@"保存海报" forState:UIControlStateNormal];
   [SaveBtn.titleLabel setFont :[UIFont fontWithName:@"Helvetica-Bold" size:16]];
   [self.view addSubview:SaveBtn];
   [YYTools ChangeView:SaveBtn RadiusSize:16 BorderColor:YYHexColor(@"#FFD409")];
    
    
}


#pragma mark 保存海报

-(void)SavePosterButtonClick{
    
    [self YYShowAlertViewTitle:@"保存海报"];
    
    
    
}




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

     return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
     return self.PostersArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
      InvitImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InvitImgCollectionViewCell" forIndexPath:indexPath];
    
      [cell.InvitImgView sd_setImageWithURL:[NSURL URLWithString:self.PostersArray[indexPath.item]] placeholderImage:[UIImage imageNamed:@"Invitcode"]];
     
      return cell;
    
    
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
 
     return CGSizeMake(YYScreenWidth * 0.75 , YYScreenWidth * 1.28);
   
}

#pragma mark 设置区头区尾

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
       return (CGSize){0,0};
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
       return (CGSize){0,0};
    
}


// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
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
      return UIEdgeInsetsMake(0, YYScreenWidth * 0.08, 40 , YYScreenWidth * 0.08);//上左下右
   
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
       return YYScreenWidth * 0.08;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
       return 0;

}

#pragma mark uiscrollview delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
  
    YYNSLog(@"----------%f", scrollView.contentOffset.x);
 

    
}


@end

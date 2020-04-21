//
//  YYCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/3/31.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYBaseCollectionViewController.h"

@interface YYBaseCollectionViewController ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation YYBaseCollectionViewController


static NSString * const reuseIdentifier = @"Cell";


-(instancetype)init{
    
     UICollectionViewFlowLayout * flowLayout = [UICollectionViewFlowLayout new];
     flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
     flowLayout.itemSize = CGSizeMake(YYScreenWidth, 50);
     return [super initWithCollectionViewLayout:flowLayout];
    
}


- (void)viewDidLoad {
    
      [super viewDidLoad];
    
      //是否显示返回按钮
      self.isShowLiftBack = YES;
    
      self.RefreshCount = 1;
    
      [self.navigationController setNavigationBarHidden:NO animated:nil];
    
      self.collectionView.backgroundColor = [UIColor whiteColor];
    
      self.ListDataArray = [NSMutableArray array];
    
      [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

      self.collectionView.emptyDataSetSource = self;
    
      self.collectionView.emptyDataSetDelegate = self;
    
      self.collectionView.showsHorizontalScrollIndicator = NO;
    
      self.collectionView.showsVerticalScrollIndicator = NO;
    
    
}



- (void)setIsShowLiftBack:(BOOL)isShowLiftBack{
    
    _isShowLiftBack = isShowLiftBack;
    
    NSInteger VCCount = self.navigationController.viewControllers.count;
    //下面判断的意义是 当VC所在的导航控制器中的VC个数大于1 或者 是present出来的VC时，才展示返回按钮，其他情况不展示
    if (isShowLiftBack && ( VCCount > 1 || self.navigationController.presentingViewController != nil)){
       
      self.navigationItem.leftBarButtonItem = [self itemWithimage:[UIImage imageNamed:@"LeftBack"] highImage:[UIImage imageNamed:@"LeftBack"] target:self action:@selector(YYBaseLeftBackRightClick)];
      
    } else {
        
        self.navigationItem.hidesBackButton = YES;
        UIBarButtonItem * NULLBar=[[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
        self.navigationItem.leftBarButtonItem = NULLBar;
    }
    
}

- (void)YYBaseLeftBackRightClick {
    
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.ListDataArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     UICollectionViewCell * cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
     cell.backgroundColor = [UIColor blueColor];
    
     return cell;
    
}

#pragma mark <DZNEmptyDataSetSource>

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    
     return [UIImage imageNamed:@"kongbai"];
    
}

#pragma mark <UIBarButtonItem>

-(UIBarButtonItem *)itemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
    
}


#pragma mark 一个信息提示跟新

-(void)YYShowAlertViewTitle:(NSString *)title {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:sure];
    [YYRootViewController presentViewController:alertVC animated:YES completion:nil];
    
}

/**
 *  根据内容提示
 */
-(void)YYShowMessage:(NSString *)message{
    
    MBProgressHUD * HUD=[[MBProgressHUD alloc]initWithView:self.view];
    HUD.contentColor=[UIColor colorWithWhite:0.5f alpha:0.1];
    HUD.bezelView.color=[UIColor blackColor];
    HUD.mode= MBProgressHUDModeText;
    HUD.label.text= message;
    HUD.label.textColor = YY66Color;
    HUD.removeFromSuperViewOnHide= YES;
    [self.view addSubview:HUD];
//    [self.view bringSubviewToFront:HUD];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:2];

    
}


#pragma mark 设置右边导航栏

-(void)YYSetRightNavTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:YY66Color forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:containView];
    
    
}



@end

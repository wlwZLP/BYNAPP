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
    
      self.collectionView.backgroundColor = [UIColor whiteColor];
    
      self.ListDataArray = [NSMutableArray array];
    
      [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

      self.collectionView.emptyDataSetSource = self;
    
      self.collectionView.emptyDataSetDelegate = self;
    
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






@end

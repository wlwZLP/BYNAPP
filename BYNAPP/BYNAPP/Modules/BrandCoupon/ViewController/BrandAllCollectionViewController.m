//
//  LiveAllCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "BrandAllCollectionViewController.h"

@interface BrandAllCollectionViewController ()

@end

@implementation BrandAllCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    
    [super viewDidLoad];

    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
   
    
    
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
  
    
    
    return cell;
    
}

#pragma mark <UICollectionViewDelegate>









@end

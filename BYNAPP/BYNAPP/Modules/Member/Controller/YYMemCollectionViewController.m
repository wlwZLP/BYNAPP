//
//  YYMemCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/3/31.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYMemCollectionViewController.h"

@interface YYMemCollectionViewController ()

@end

@implementation YYMemCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    
     [super viewDidLoad];
    

    
    
    
    
}


-(void)viewDidAppear:(BOOL)animated{
    
    [self.collectionView removeFromSuperview];
    
 
}

-(void)viewDidLayoutSubviews{
    
    
    
}


#pragma mark <DZNEmptyDataSetSource>








@end

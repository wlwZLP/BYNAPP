//
//  HomeBannerCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeBannerCollectionViewCell.h"

@interface HomeBannerCollectionViewCell ()<SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView * TopCycleScrollView;




@end

@implementation HomeBannerCollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor redColor];
        
        [self addSubview:self.TopCycleScrollView];
        
    }
    
    return self;
    
}




-(SDCycleScrollView*)TopCycleScrollView{
    
    if (_TopCycleScrollView == nil) {
        
        _TopCycleScrollView= [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 10, self.ZLP_width , self.ZLP_height) delegate:self placeholderImage:[UIImage imageNamed:@"banner01"]];
        _TopCycleScrollView.backgroundColor = [UIColor redColor];
        _TopCycleScrollView.localizationImageNamesGroup = self.ImgListArray;
        _TopCycleScrollView.backgroundColor = [UIColor clearColor];
        _TopCycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _TopCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _TopCycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControl"];
        _TopCycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrent"];
        
     }
    
    return _TopCycleScrollView;
    
}






@end

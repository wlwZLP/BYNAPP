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
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.TopCycleScrollView];
        
    }
    
    return self;
    
}



-(void)setImgListArray:(NSArray *)ImgListArray{
    
     _ImgListArray = ImgListArray;
    
     self.TopCycleScrollView.localizationImageNamesGroup = self.ImgListArray;
    
}




-(SDCycleScrollView*)TopCycleScrollView{
    
    if (_TopCycleScrollView == nil) {
        
        _TopCycleScrollView= [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.ZLP_width , self.ZLP_height) delegate:self placeholderImage:[UIImage imageNamed:@"banner01"]];
        _TopCycleScrollView.backgroundColor = [UIColor redColor];
        _TopCycleScrollView.backgroundColor = [UIColor clearColor];
        _TopCycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _TopCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _TopCycleScrollView.pageDotImage = [UIImage imageNamed:@"yqwhite"];
        _TopCycleScrollView.currentPageDotImage = [UIImage imageNamed:@"yqyellow"];
        
     }
    
    return _TopCycleScrollView;
    
}



#pragma mark - SDCycleScrollViewDelegate

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
  
        
     self.SdClyImgBlockClick(index);
  

}






@end

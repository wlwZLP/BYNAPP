//
//  GoodsTopCollectionViewCell.m
//  BYNAPP
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "GoodsTopCollectionViewCell.h"

@interface GoodsTopCollectionViewCell ()<SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView * DetailsCycleScrollView;

@property(nonatomic,strong)UIImageView * TopImageView;

@property(nonatomic,strong)UIView * TopView;

@end


@implementation GoodsTopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYRandomColor;
        
        [self addSubview:self.DetailsCycleScrollView];
        
    }
    
    return self;
    
}

-(void)setImgListArray:(NSMutableArray *)ImgListArray{
    
     _ImgListArray = ImgListArray;
    
    self.DetailsCycleScrollView.imageURLStringsGroup = ImgListArray;
    
}



-(SDCycleScrollView*)DetailsCycleScrollView{
    
    if (_DetailsCycleScrollView == nil) {
        
        _DetailsCycleScrollView= [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.ZLP_width , self.ZLP_height) delegate:self placeholderImage:[UIImage imageNamed:@"SDBG"]];
        _DetailsCycleScrollView.backgroundColor = UIColor.whiteColor;
        _DetailsCycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _DetailsCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _DetailsCycleScrollView.pageDotImage = [UIImage imageNamed:@"yqwhite"];
        _DetailsCycleScrollView.currentPageDotImage = [UIImage imageNamed:@"yqyellow"];
        
     }
    
    return _DetailsCycleScrollView;
    
}





@end

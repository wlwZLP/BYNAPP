//
//  CollectionViewCell.m
//  Linkage
//
//  Created by LeeJay on 16/8/22.
//  Copyright © 2016年 LeeJay. All rights reserved.
//  代码下载地址https://github.com/leejayID/Linkage


#import "RightCollectionViewCell.h"

@interface RightCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) UILabel *name;

@end

@implementation RightCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(8, 0, self.frame.size.width - 16, self.frame.size.width - 16)];
        self.imageV.contentMode = UIViewContentModeScaleAspectFit;
        self.imageV.image = [UIImage imageNamed:@"yifu"];
        [self.contentView addSubview:self.imageV];

        self.name = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.width - 8, self.frame.size.width, 16)];
        self.name.font = [UIFont systemFontOfSize:12];
        self.name.textAlignment = NSTextAlignmentCenter;
        self.name.textColor = YY66Color;
        self.name.text = @"服装";
        [self.contentView addSubview:self.name];
        
    }
    return self;
}

//- (void)setModel:(SubCategoryModel *)model
//{
//    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.logo]];
//     self.name.text = model.name;
//}


@end

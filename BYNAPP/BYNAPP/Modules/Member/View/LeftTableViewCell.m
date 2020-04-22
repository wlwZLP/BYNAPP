//
//  LeftTableViewCell.m
//  Linkage
//
//  Created by LeeJay on 16/8/22.
//  Copyright © 2016年 LeeJay. All rights reserved.
//  代码下载地址https://github.com/leejayID/Linkage

#import "LeftTableViewCell.h"

#define defaultColor rgba(253, 212, 49, 1)

@interface LeftTableViewCell ()

@property (nonatomic, strong) UIView * yellowView;

@end

@implementation LeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, 95 , 25)];
        self.name.numberOfLines = 1;
        self.name.textColor = YY33Color;
        self.name.textAlignment = NSTextAlignmentCenter;
        self.name.highlightedTextColor = YY33Color;
        [self.contentView addSubview:self.name];
        

        self.yellowView = [[UIView alloc] initWithFrame:CGRectMake(1, 7 , 3, 40)];
        self.yellowView.backgroundColor = YYHexColor(@"#FFD409");
        [self.contentView addSubview:self.yellowView];
        
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
    [super setSelected:selected animated:animated];
    self.contentView.backgroundColor = selected ?  YYHexColor(@"#FFFAE3"):[UIColor whiteColor] ;
    self.highlighted = selected;
    self.name.highlighted = selected;
    self.yellowView.hidden = !selected;
}

@end

//
//  SFSFEssenceLabel.m
//  百思不得姐
//
//  Created by xiaoaihhh on 16/6/27.
//  Copyright © 2016年 nowGO. All rights reserved.
//

#import "SFLabel.h"
#import <UIKit/UIKit.h>

@interface SFLabel ()

@property (assign, nonatomic) UIEdgeInsets edgeInsets;

@end

@implementation SFLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.edgeInsets = UIEdgeInsetsMake(0, 0, 20, 0);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}

- (void)awakeFromNib
{
    self.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [super awakeFromNib];
    
}


+ (UIEdgeInsets)edgeInsets
{
    return UIEdgeInsetsMake(0, 0, 0 , 0);
}


+ (NSDictionary *)textLabelArrtibute
{
    
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    attribute[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;//行间距
    paragraphStyle.alignment = NSTextAlignmentJustified;
    attribute[NSParagraphStyleAttributeName] = paragraphStyle;
    return attribute;
}


#pragma mark 设置第一行和最后一行距离label的距离
-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    //注意传入的UIEdgeInsetsInsetRect(bounds, self.edgeInsets),bounds是真正的绘图区域
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, self.edgeInsets) limitedToNumberOfLines:numberOfLines];
    rect.origin.x -= self.edgeInsets.left;
    rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
}


- (void)drawTextInRect:(CGRect)rect
{

    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
    
}




@end

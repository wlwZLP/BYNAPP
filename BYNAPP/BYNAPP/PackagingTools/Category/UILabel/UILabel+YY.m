//
//  UILabel+YY.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/11.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "UILabel+YY.h"

@implementation UILabel (YY)

/**
 *  字间距
 *
 *  @return 字间距
 */
- (CGFloat)YYWordSpace
{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setYYWordSpace:(CGFloat)YYWordSpace
{
    objc_setAssociatedObject(self, @selector(YYWordSpace), @(YYWordSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 *  行间距
 *
 *  @return 行间距
 */
- (CGFloat)YYLineSpace
{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setYYLineSpace:(CGFloat)YYLineSpace
{
    objc_setAssociatedObject(self, @selector(YYLineSpace), @(YYLineSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 *  特殊字
 *
 *  @return 特殊字
 */
- (NSString *)YYSpecialWord
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setYYSpecialWord:(NSString *)YYSpecialWord
{
    objc_setAssociatedObject(self, @selector(YYSpecialWord), YYSpecialWord, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
/**
*  特殊字
*
*  @return 特殊字
*/
- (UIColor *)YYSpecialWordColor
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setYYSpecialWordColor:(UIColor *)YYSpecialWordColor
{
    objc_setAssociatedObject(self, @selector(YYSpecialWordColor), YYSpecialWordColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
*  特殊字
*
*  @return 特殊字
*/
- (UIFont *)YYSpecialWordFont
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setYYSpecialWordFont:(UIFont *)YYSpecialWordFont
{
    objc_setAssociatedObject(self, @selector(YYSpecialWordFont), YYSpecialWordFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
*  特殊字
*
*  @return 特殊字
*/
- (NSString *)YYUnderlineWord
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setYYUnderlineWord:(NSString *)YYUnderlineWord
{
    objc_setAssociatedObject(self, @selector(YYUnderlineWord), YYUnderlineWord, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
*  特殊字
*
*  @return 特殊字
*/
-(UIColor *)YYUnderlineWordColor{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setYYUnderlineWordColor:(UIColor *)YYUnderlineWordColor
{
    objc_setAssociatedObject(self, @selector(YYUnderlineWordColor), YYUnderlineWordColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)YYUpdateConstraints{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:self.text];
    
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, self.text.length)];
    
    //字间距
    if (self.YYWordSpace > 0) {
        long number = self.YYWordSpace;
        CFNumberRef numberRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
        [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)numberRef range:NSMakeRange(0, self.text.length)];
        CFRelease(numberRef);
    }
    
    //行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    if (self.YYLineSpace > 0) {
        [paragraphStyle setLineSpacing:self.YYLineSpace];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.text.length)];
    }
    
    //特殊字啊
    if (self.YYSpecialWord) {
        NSRange range = [self.text rangeOfString:self.YYSpecialWord];
        if (self.YYSpecialWordFont) {
            [attributedString addAttribute:NSFontAttributeName value:self.YYSpecialWordFont range:range];
        }
        if (self.YYSpecialWordColor) {
            [attributedString addAttribute:NSForegroundColorAttributeName value:self.YYSpecialWordColor range:range];
        }
    }
    
    //下划线
    if (self.YYUnderlineWord) {
        NSRange range = [self.text rangeOfString:self.YYUnderlineWord];
        [attributedString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
        if (self.YYUnderlineWordColor) {
            [attributedString addAttribute:NSUnderlineColorAttributeName value:self.YYUnderlineWordColor range:range];
        }
    }

    self.attributedText = attributedString;
    

}



/// 添加点击方法
-(void)addLabelTarget:(id _Nullable )target action:(nonnull SEL)action{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:target action:action];
    
    self.userInteractionEnabled = YES;
    
    [self addGestureRecognizer:tap];
    
}


@end

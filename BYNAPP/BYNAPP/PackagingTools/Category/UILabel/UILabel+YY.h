//
//  UILabel+YY.h
//  BYNAPP
//
//  Created by zhulp on 2020/4/11.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (YY)

/**
 *  字间距
 */
@property (nonatomic,assign)CGFloat YYWordSpace;
/**
 *  行间距
 */
@property (nonatomic,assign)CGFloat YYLineSpace;

/**
 *  特殊字 字颜色 字大小
 */
@property (nonatomic,copy)NSString * YYSpecialWord;
/**
*  特殊字 字颜色 字大小
*/
@property (nonatomic,strong)UIColor * YYSpecialWordColor;
/**
*  特殊字 字颜色 字大小
*/
@property (nonatomic,strong)UIFont * YYSpecialWordFont;

/**
 *  下划线
 */
@property (nonatomic,copy)NSString * YYUnderlineWord;

/**
*  下划线颜色
*/
@property (nonatomic,strong)UIColor * YYUnderlineWordColor;


/**
*  下划线高度
*/
- (void)YYUpdateConstraints;


/**
*  给Label添加点击方法
*/
-(void)addLabelTarget:(id _Nullable )target action:(nonnull SEL)action;


@end

NS_ASSUME_NONNULL_END

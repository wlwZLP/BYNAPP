//
//  YYCollectionViewController.h
//  BYNAPP
//
//  Created by apple on 2020/3/31.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYBaseCollectionViewController : UICollectionViewController


@property(nonatomic,strong)NSArray * ListDataArray;

/**
 *  是否显示返回按钮,默认情况是YES
 */
@property (nonatomic, assign) BOOL isShowLiftBack;

/**
*  展示一个文字，用点击事件判断,类似JS  Alert;
*/
-(void)YYShowAlertViewTitle:(NSString *)title;

/**
*  导航栏右边字体设置
*/
-(void)YYSetRightNavTitle:(NSString *)title target:(id)target action:(SEL)action;

/**
*  展示一个文字，用点击事件判断,类似JS  Alert;
*/
-(void)YYBaseLeftBackRightClick;



@end

NS_ASSUME_NONNULL_END

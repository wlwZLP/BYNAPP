//
//  YYBaseViewController.h
//  BYNAPP
//
//  Created by apple on 2020/4/10.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYBaseViewController : UIViewController

/**
 *  是否显示返回按钮,默认情况是YES
 */
@property (nonatomic, assign) BOOL isShowLiftBack;



/**
*  展示一个文字，用点击事件判断,类似JS  Alert;
*/
-(void)YYShowAlertViewTitle:(NSString *)title;


-(void)YYShowAlertTitleClick;


/**
*  展示一个文字，用点击事件判断,类似JS  Alert;
*/
-(void)YYSetRightNavTitle:(NSString *)title target:(id)target action:(SEL)action;


@end

NS_ASSUME_NONNULL_END
